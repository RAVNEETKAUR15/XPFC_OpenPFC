#include "SlabBCC.hpp"
#include "Periodic.hpp"
#include <openpfc/openpfc.hpp>
#include <openpfc/ui.hpp>
#include <openpfc/utils/nancheck.hpp>

#include <nlohmann/json.hpp>

#include <iostream>

using json = nlohmann::json;
using namespace pfc;
using namespace pfc::utils;
using namespace pfc::ui;
using namespace std;

class Tungsten : public Model {
  using Model::Model;

private:
  std::vector<double> filterMF, opL, opN, P_F;
#ifdef MAHTI_HACK
  // in principle, we can reuse some of the arrays ...
  std::vector<double> psiMF, psi, &psiN = psiMF, P_star_psi, temperature;
  std::vector<std::complex<double>> psiMF_F, psi_F, &psiN_F = psiMF_F, P_psi_F;
#else
  std::vector<double> psiMF, psi, psiN, P_star_psi, temperature;
  std::vector<std::complex<double>> psiMF_F, psi_F, psiN_F, P_psi_F;
#endif
  size_t mem_allocated = 0;

public:
  /**
   * @brief Model parameters, which can be overridden from json file
   *
   */
  struct {
    // average density of the metastable fluid
    double n0;
    // Bulk densities at coexistence, obtained from phase diagram for chosen
    // temperature
    double n_sol, n_vap;
    // Effective temperature parameters. Temperature in K. Remember to change
    // n_sol and n_vap according to phase diagram when T is changed.
    double T0, Bx;
	double T_const, T_max, T_min;
	double tau_const;
	double G_grid, V_grid, x_initial;
	double m_xpos;
    // width of C2's peak
    double alpha;
    // how much we allow the k=1 peak to affect the k=0 value of the
    // correlation, by changing the higher order components of the Gaussian
    // function
    double alpha_farTol;
    // power of the higher order component of the gaussian function. Should be a
    // multiple of 2. Setting this to zero also disables the tolerance setting.
    int alpha_highOrd;
    // derived dimensionless values used in calculating vapor model parameters
    double tau;
    // Strength of the meanfield filter. Avoid values higher than ~0.28, to
    // avoid lattice-wavelength variations in the mean field
    double lambda;
    // numerical stability parameter for the exponential integrator method
    double stabP;
    // Vapor-model parameters
    double shift_u, shift_s;
    double p2, p3, p4, p2_bar, p3_bar, p4_bar;
    double q20, q21, q30, q31, q40;
    double q20_bar, q21_bar, q30_bar, q31_bar, q40_bar, q2_bar, q3_bar, q4_bar;
    double q2_bar_L;
  } params;

  void allocate() {
    FFT &fft = get_fft();
    auto size_inbox = fft.size_inbox();
    auto size_outbox = fft.size_outbox();

    // operators are only half size due to the symmetry of fourier space
    filterMF.resize(size_outbox);
    opL.resize(size_outbox);
    opN.resize(size_outbox);

    // psi, psiMF, psiN
    psi.resize(size_inbox);
    psiMF.resize(size_inbox);
    psiN.resize(size_inbox);

    // psi_F, psiMF_F, psiN_F, where suffix F means in fourier space
    psi_F.resize(size_outbox);
    psiMF_F.resize(size_outbox);
    psiN_F.resize(size_outbox);
	
	
	// fields related to changing temperature
	P_star_psi.resize(size_inbox);
	temperature.resize(size_inbox);
	
	P_F.resize(size_outbox);
	P_psi_F.resize(size_outbox);

    add_real_field("psi", psi);
    add_real_field("default", psi); // for backward compatibility
    add_real_field("psiMF", psiMF);
    add_real_field("temperature", temperature);

    mem_allocated = 0;
    mem_allocated += utils::sizeof_vec(filterMF);
    mem_allocated += utils::sizeof_vec(opL);
    mem_allocated += utils::sizeof_vec(opN);
    mem_allocated += utils::sizeof_vec(psi);
    mem_allocated += utils::sizeof_vec(psiMF);
    mem_allocated += utils::sizeof_vec(psiN);
    mem_allocated += utils::sizeof_vec(psi_F);
    mem_allocated += utils::sizeof_vec(psiMF_F);
    mem_allocated += utils::sizeof_vec(psiN_F);
	mem_allocated += utils::sizeof_vec(P_star_psi);
	mem_allocated += utils::sizeof_vec(P_F);
	mem_allocated += utils::sizeof_vec(temperature);
	mem_allocated += utils::sizeof_vec(P_psi_F);
  }

  void prepare_operators(double dt) {
    World w = get_world();
    auto dx = w.dx;
    auto dy = w.dy;
    auto dz = w.dz;
    auto Lx = w.Lx;
    auto Ly = w.Ly;
    auto Lz = w.Lz;

    const Decomposition &decomp = get_decomposition();
    std::array<int, 3> low = decomp.outbox.low;
    std::array<int, 3> high = decomp.outbox.high;

    int idx = 0;
    const double pi = std::atan(1.0) * 4.0;
    const double fx = 2.0 * pi / (dx * Lx);
    const double fy = 2.0 * pi / (dy * Ly);
    const double fz = 2.0 * pi / (dz * Lz);

    for (int k = low[2]; k <= high[2]; k++) {
      for (int j = low[1]; j <= high[1]; j++) {
        for (int i = low[0]; i <= high[0]; i++) {

          // laplacian operator -k^2
          double ki = (i <= Lx / 2) ? i * fx : (i - Lx) * fx;
          double kj = (j <= Ly / 2) ? j * fy : (j - Ly) * fy;
          double kk = (k <= Lz / 2) ? k * fz : (k - Lz) * fz;
          double kLap = -(ki * ki + kj * kj + kk * kk);

          // mean-field filtering operator (chi) make a C2 that's quasi-gaussian
          // on the left, and ken-style on the right
          double alpha2 = 2.0 * params.alpha * params.alpha;
          double lambda2 = 2.0 * params.lambda * params.lambda;
          double fMF = exp(kLap / lambda2);
          double k = sqrt(-kLap) - 1.0;
          double k2 = k * k;

          double rTol = -alpha2 * log(params.alpha_farTol) - 1.0;
          double g1 = 0;
          if (params.alpha_highOrd == 0) { // gaussian peak
            g1 = exp(-k2 / alpha2);
          } else { // quasi-gaussian peak with higher order component to make it
                   // decay faster towards k=0
            g1 = exp(-(k2 + rTol * pow(k, params.alpha_highOrd)) / alpha2);
          }

          // taylor expansion of gaussian peak to order 2
          double g2 = 1.0 - 1.0 / alpha2 * k2;
          // splice the two sides of the peak
          double gf = (k < 0.0) ? g1 : g2;
          // we separate this out because it is needed in the nonlinear
          // calculation when T is not constant in space
          // double opPeak = params.Bx * exp(-params.T / params.T0) * gf;
		  P_F[idx] = params.Bx * exp(-params.T_const / params.T0) * gf;
          // includes the lowest order n_mf term since it is a linear term
          double opCk = params.stabP + params.p2_bar - P_F[idx] + params.q2_bar * fMF;

          filterMF[idx] = fMF;
          opL[idx] = exp(kLap * opCk * dt);
          opN[idx] = (opCk == 0.0) ? kLap * dt : (opL[idx] - 1.0) / opCk;
          idx += 1;
        }
      }
    }

    CHECK_AND_ABORT_IF_NANS(opL);
    CHECK_AND_ABORT_IF_NANS(opN);
  }

  void initialize(double dt) override {
    allocate();
    prepare_operators(dt);
  }

  void step(double t) override {

    (void)t; // suppress compiler warning about unused parameter

    FFT &fft = get_fft();

    // Calculate mean-field density n_mf
    fft.forward(psi, psi_F);
    for (size_t idx = 0, N = psiMF_F.size(); idx < N; idx++) {
      psiMF_F[idx] = filterMF[idx] * psi_F[idx];
    }
    fft.backward(psiMF_F, psiMF);

    // Calculate the nonlinear part of the evolution equation in a real space
	
	/*
    for (size_t idx = 0, N = psiN.size(); idx < N; idx++) {
      double u = psi[idx], v = psiMF[idx];
      double u2 = u * u, u3 = u * u * u, v2 = v * v, v3 = v * v * v;
      double p3 = params.p3_bar, p4 = params.p4_bar;
      double q3 = params.q3_bar, q4 = params.q4_bar;
      psiN[idx] = p3 * u2 + p4 * u3 + q3 * v2 + q4 * v3;
    }
	*/
	
	for (size_t idx = 0, N = P_psi_F.size(); idx < N; idx++) {
		 P_psi_F[idx] = P_F[idx] * psi_F[idx]; 
	 }
	 
	 fft.backward(P_psi_F, P_star_psi);
	
	World w = get_world();
	auto dx = w.dx;
	auto x0 = w.x0;
	auto Lx = w.Lx;
	
	const Decomposition &decomp = get_decomposition();
	
	std::array<int, 3> low = decomp.inbox.low;
    std::array<int, 3> high = decomp.inbox.high;

	double l = Lx * dx;
	
	// double xpos = fmod(params.m_xpos, l);
	params.m_xpos = w.get_xpos();
	double fullruns = floor(params.m_xpos / l) * l;
	double steppoint = fmod(params.m_xpos, l);

	double local_FE = 0;

    size_t idx = 0;
    for (int k = low[2]; k <= high[2]; k++) {
      for (int j = low[1]; j <= high[1]; j++) {
        for (int i = low[0]; i <= high[0]; i++) {
          double x = x0 + i*dx;
		double dist = x + fullruns - (x > steppoint)*l;
          //double y = y0 + j * dy;
          //double z = z0 + k * dz;
	       double T_var = params.G_grid * (dist - params.x_initial - params.V_grid*t); //  
			 //T_var = 0;
			 //T_var = std::min(T_var,p.T_max-p.T_const); 
			 //T_var = std::max(T_var,p.T_min-p.T_const);
			 temperature[idx] = T_var;
	       double q2_bar_N = params.q21_bar*T_var/params.T0;  
			 //q2_bar_N = 0.0; 
          double q3_bar = params.q31_bar * (params.T_const+T_var)/params.T0 + params.q30_bar;

          double u = psi[idx];
          double v = psiMF[idx];
          //psiN[idx] = p.p3_bar * u * u + p.p4_bar * u * u * u + p.q3_bar * v * v +
			 // in below, missing prefactor -B_x * exp(-T_const/T0)? No. They are included in P_star_psi
			 double kernel_term_N = -(1.0 - exp(-T_var/params.T0) ) * P_star_psi[idx];
			 //kernel_term_N = 0; 
          psiN[idx] = params.p3_bar*u*u + params.p4_bar*u*u*u + q2_bar_N*v + q3_bar*v*v +
                      params.q4_bar*v*v*v - kernel_term_N;


          local_FE += params.p3_bar*u*u*u/3. + params.p4_bar*u*u*u*u/4. + q2_bar_N*u*v/2. +
          				q3_bar*u*v*v/3. + params.q4_bar*u*v*v*v/4. + -u*kernel_term_N*u/2. +
          				-u*P_star_psi[idx]/2. + params.p2_bar*u*u/2. + params.q2_bar*u*v/2.;
          
			 idx++; 
        }
      }
    }

    cout << "Parameters: p3_bar = " << params.p3_bar << ", p4_bar = " << params.p4_bar << ", q21_bar =" << params.q21_bar << std::endl;
    cout << "Parameters: q31_bar =" << params.q3_bar << ", q4_bar = " << params.q4_bar << std::endl;

auto Pmax = *max_element(std::begin(P_star_psi), std::end(P_star_psi));
auto Pmin = *min_element(std::begin(P_star_psi), std::end(P_star_psi));

    cout << "Step: " << Pmin << " <= Pstarpsi <= " << Pmax << std::endl;
    cout << "n0: " << params.n0 << ", n_sol: " << params.n_sol << ", n_vap: " << params.n_vap << std::endl;

    // Apply stabilization factor if given in parameters
    if (params.stabP != 0.0)
      for (size_t idx = 0, N = psiN.size(); idx < N; idx++) {
        psiN[idx] = psiN[idx] - params.stabP * psi[idx];
      }

    // Fourier transform of the nonlinear part of the evolution equation
    fft.forward(psiN, psiN_F);

    // Apply one step of the evolution equation
    for (size_t idx = 0, N = psi_F.size(); idx < N; idx++) {
      psi_F[idx] = opL[idx] * psi_F[idx] + opN[idx] * psiN_F[idx];
    }

    // Inverse Fourier transform result back to real space
    fft.backward(psi_F, psi);

    // Check does psi has any NaNs and abort the calculation if NaNs are
    // detected. This macro is enabled with compile option 'NAN_CHECK_ENABLED',
    // which is enabled when build type is 'Debug', i.e.
    // -DCMAKE_BUILD_TYPE=Debug. In normal production mode, use
    // -DCMAKE_BUILD_TYPE=Release, which turns on all the optimizations and
    // disables NaN checks and other debug mode checks which may cause any
    // overhead to the actual simulation.
    CHECK_AND_ABORT_IF_NANS(psi);

    double FE_sum;
    MPI_Reduce(&local_FE, &FE_sum, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
    cout << "Total free energy: " << FE_sum << std::endl;
    
  }

}; // end of class

/**
 * @brief Read model configuration from json file, under model/params.
 *
 * @param j json file
 * @param m model
 */
void from_json(const json &j, Tungsten &m) {
  auto &p = m.params;
  j.at("n0").get_to(p.n0);
  j.at("n_sol").get_to(p.n_sol);
  j.at("n_vap").get_to(p.n_vap);
  j.at("T_const").get_to(p.T_const);
  j.at("T0").get_to(p.T0);
  j.at("Bx").get_to(p.Bx);
  j.at("G_grid").get_to(p.G_grid);
  j.at("V_grid").get_to(p.V_grid);
  j.at("x_initial").get_to(p.x_initial);
  p.m_xpos = p.x_initial;
  j.at("alpha").get_to(p.alpha);
  j.at("alpha_farTol").get_to(p.alpha_farTol);
  j.at("alpha_highOrd").get_to(p.alpha_highOrd);
  p.tau_const = p.T_const / p.T0;
  j.at("lambda").get_to(p.lambda);
  j.at("stabP").get_to(p.stabP);
  j.at("shift_u").get_to(p.shift_u);
  j.at("shift_s").get_to(p.shift_s);
  j.at("p2_bar").get_to(p.p2_bar);
  j.at("p3_bar").get_to(p.p3_bar);
  j.at("p4_bar").get_to(p.p4_bar);
/*
  p.p2_bar = p.p2 + 2 * p.shift_s * p.p3 + 3 * pow(p.shift_s, 2) * p.p4;
  p.p3_bar = p.shift_u * (p.p3 + 3 * p.shift_s * p.p4);
  p.p4_bar = pow(p.shift_u, 2) * p.p4;
*/
  j.at("q20_bar").get_to(p.q20_bar);
  j.at("q21_bar").get_to(p.q21_bar);
  j.at("q30_bar").get_to(p.q30_bar);
  j.at("q31_bar").get_to(p.q31_bar);
  j.at("q40_bar").get_to(p.q40_bar);
/*
  p.q20_bar = p.q20 + 2.0 * p.shift_s * p.q30 + 3.0 * pow(p.shift_s, 2) * p.q40;
  p.q21_bar = p.q21 + 2.0 * p.shift_s * p.q31;
  p.q30_bar = p.shift_u * (p.q30 + 3.0 * p.shift_s * p.q40);
  p.q31_bar = p.shift_u * p.q31;
  p.q40_bar = pow(p.shift_u, 2) * p.q40;
*/
  p.q2_bar = p.q21_bar * p.tau_const + p.q20_bar;
  p.q2_bar_L = p.q2_bar;
  p.q3_bar = p.q31_bar * p.tau_const + p.q30_bar;
  p.q4_bar = p.q40_bar;
}

int main(int argc, char *argv[]) {
  cout << std::fixed;
  cout.precision(3);
  register_field_modifier<SlabBCC>("slab_bcc");
  register_field_modifier<Periodic>("periodic");
  App<Tungsten> app(argc, argv);
  return app.main();
}
