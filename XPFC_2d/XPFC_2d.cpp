/*

OpenPFC, a simulation software for the phase field crystal method.
Copyright (C) 2024 VTT Technical Research Centre of Finland Ltd.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as
published by the Free Software Foundation, either version 3 of the
License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see https://www.gnu.org/licenses/.

*/

#include <openpfc/openpfc.hpp>
#include <openpfc/ui.hpp>
#include <openpfc/utils/nancheck.hpp>

#include <nlohmann/json.hpp>

using json = nlohmann::json;
using namespace pfc;
using namespace pfc::utils;
using namespace pfc::ui;
using namespace std;

class Tungsten : public Model {
  using Model::Model;

private:
  std::vector<double> opL_n, opN_n, opL_c, opN_c;
#ifdef MAHTI_HACK
  // in principle, we can reuse some of the arrays ...
  std::vector<double> n, c;
  std::vector<std::complex<double>> n_F, c_F;
#else
  std::vector<double> n, c, NL_n, NL_c, Caa, Cbb, Caa_star_n, Cbb_star_n;
  std::vector<std::complex<double>> n_F, c_F, NL_n_F, NL_c_F, Caa_F, Cbb_F, Caa_star_n_F, Cbb_star_n_F;
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
    // nLambda for the system size
    double k_alpha;
    double k_beta;
    double Amp;
    double T;
    double c0;
    double Mn;
    double Mc;
    double omega;
    double Wc;
    double T_a;
    double T_b;
    double Tc; // Critical Temperature
    double sigma;
    double eps;
    double p3;
    double p4;
    
    
    
    
   /* double n_sol, n_vap;
    // Effective temperature parameters. Temperature in K. Remember to change
    // n_sol and n_vap according to phase diagram when T is changed.
    double T, T0, Bx, Bl    ;
    // width of C2's peak
    double alpha;
    
    
    // how much we allow the k=1 peak to affect the k=0 value of the
    // correlation, by changing the higher order components of the Gaussian
    // function
 
   // peak for alpha and beta phases
    
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
    double p2, p3, p4;
    //, p2_bar, p3_bar, p4_bar; THESE ARE IN VAPOUR MODEL
    // double q20, q21, q30, q31, q40;
    // double q20_bar, q21_bar, q30_bar, q31_bar, q40_bar, q2_bar, q3_bar, q4_bar;*/
  } params;

  void allocate() {
    FFT &fft = get_fft();
    auto size_inbox = fft.size_inbox();
    auto size_outbox = fft.size_outbox();

    // operators are only half size due to the symmetry of fourier space
    opL_n.resize(size_outbox);
    opN_n.resize(size_outbox);
    opL_c.resize(size_outbox);
    opN_c.resize(size_outbox);


	n.resize(size_inbox);
	c.resize(size_inbox);
	NL_n.resize(size_inbox);
	NL_c.resize(size_inbox);
	Caa.resize(size_inbox);
	Cbb.resize(size_inbox);
	Caa_star_n.resize(size_inbox);
	Cbb_star_n.resize(size_inbox);


	n_F.resize(size_outbox);
	c_F.resize(size_outbox);
	NL_n_F.resize(size_outbox);
	NL_c_F.resize(size_outbox);
	Caa_F.resize(size_outbox);
	Cbb_F.resize(size_outbox);
	Caa_star_n_F.resize(size_outbox);
	Cbb_star_n_F.resize(size_outbox);
   
    add_real_field("density", n);
    add_real_field("default", n); // for backward compatibility
    add_real_field("concentration", c);

    mem_allocated = 0;
    mem_allocated += utils::sizeof_vec(opL_n);
    mem_allocated += utils::sizeof_vec(opN_n);
    mem_allocated += utils::sizeof_vec(opL_c);
    mem_allocated += utils::sizeof_vec(opN_c);
    mem_allocated += utils::sizeof_vec(n);
    mem_allocated += utils::sizeof_vec(c);
    mem_allocated += utils::sizeof_vec(NL_n);
    mem_allocated += utils::sizeof_vec(NL_c);
    mem_allocated += utils::sizeof_vec(Caa_star_n);
    mem_allocated += utils::sizeof_vec(Cbb_star_n);
    mem_allocated += utils::sizeof_vec(n_F);
    mem_allocated += utils::sizeof_vec(c_F);
    mem_allocated += utils::sizeof_vec(NL_n_F);
    mem_allocated += utils::sizeof_vec(NL_c_F);
    mem_allocated += utils::sizeof_vec(Caa_F);
    mem_allocated += utils::sizeof_vec(Cbb_F);
    mem_allocated += utils::sizeof_vec(Caa_star_n_F);
    mem_allocated += utils::sizeof_vec(Cbb_star_n_F);
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

    FFT &fft = get_fft();

    for (int k = low[2]; k <= high[2]; k++) {
      for (int j = low[1]; j <= high[1]; j++) {
        for (int i = low[0]; i <= high[0]; i++) {

          // laplacian operator -k^2
          double ki = (i <= Lx / 2) ? i * fx : (i - Lx) * fx;
          double kj = (j <= Ly / 2) ? j * fy : (j - Ly) * fy;
          double kk = (k <= Lz / 2) ? k * fz : (k - Lz) * fz;
          double kLap = -(ki * ki + kj * kj + kk * kk);
          double k2 = -kLap;

          Caa_F[idx] = exp(-params.T/params.T_a)*exp(-(sqrt(-kLap)-params.k_alpha)*(sqrt(-kLap)-params.k_alpha)/(2. * params.sigma * params.sigma));
          Cbb_F[idx] = exp(-params.T/params.T_b)*exp(-(sqrt(-kLap)-params.k_beta)*(sqrt(-kLap)-params.k_beta)/(2. * params.sigma * params.sigma));
          double lam = -params.Mc*k2*(params.omega*params.eps + params.Wc*k2);

          opL_n[idx] = 1./(1. + dt * params.Mn * k2);
          opN_n[idx] = (-params.Mn * k2 * dt)/(1. + dt * params.Mn * k2);

          opL_c[idx] = 1./(1. - dt *lam);
          opN_c[idx] = (-params.Mc * k2 * dt)/(1. - dt * lam); 
          idx += 1;
        }
      }
    }
  }

  void initialize(double dt) override {
    allocate();
    prepare_operators(dt);
  }

  void step(double t) override {

    (void)t; // suppress compiler warning about unused parameter

    FFT &fft = get_fft();

    fft.forward(n, n_F);
    fft.forward(c, c_F);

    for (size_t idx = 0, N = n_F.size(); idx < N; idx++){
    	Caa_star_n_F[idx] = Caa_F[idx] * n_F[idx];
    	Cbb_star_n_F[idx] = Cbb_F[idx] * n_F[idx];
    }

    fft.backward(Caa_star_n_F, Caa_star_n);
    fft.backward(Cbb_star_n_F, Cbb_star_n);

    for (size_t idx = 0, N = n.size(); idx < N; idx++){
    	double C_eff = (1. - 3. * c[idx]*c[idx] + 2. * c[idx] * c[idx] * c[idx])*Caa_star_n[idx] + (1. - 3. * (1. - c[idx])*(1. - c[idx]) + 2. * (1. - c[idx]) * (1. - c[idx]) * (1. - c[idx]))*Cbb_star_n[idx];
    	double DC_eff =  (-6. * c[idx] + 6. * c[idx] * c[idx])*Caa_star_n[idx] -  (-6. * (1.-c[idx]) + 6. * (1. - c[idx]) * (1. - c[idx]))*Cbb_star_n[idx];
    	double fmix = c[idx] * log(c[idx]/params.c0) + (1. - c[idx]) * log((1.-c[idx])/(1. - params.c0));
    	NL_c[idx] = params.omega * (1 + n[idx])* (log(c[idx]/params.c0) - log((1. - c[idx])/(1. - params.c0))) - 0.5 * n[idx] * DC_eff;
    	NL_n[idx] = - params.p3 * n[idx] * n[idx] + params.p4 * n[idx]*n[idx]*n[idx] + params.omega * fmix - C_eff;
    }

    fft.forward(NL_n, NL_n_F);
    fft.forward(NL_c, NL_c_F);

    // Calculate mean-field density n_mf
    //fft.forward(psi, psi_F);
    //for (size_t idx = 0, N = psiMF_F.size(); idx < N; idx++) {
      //psiMF_F[idx] = filterMF[idx] * psi_F[idx];
    //}
    //fft.backward(psiMF_F, psiMF);

    // Calculate the nonlinear part of the evolution equation in a real space
    for (size_t idx = 0, N = n_F.size(); idx < N; idx++) {
    	n_F[idx] = opL_n[idx] * n_F[idx] + opN_n[idx] * NL_n_F[idx];
    	c_F[idx] = opL_c[idx] * c_F[idx] + opN_c[idx] * NL_c_F[idx];
    }

    // Inverse Fourier transform result back to real space
    fft.backward(n_F, n);
    fft.backward(c_F, c);

    // Check does psi has any NaNs and abort the calculation if NaNs are
    // detected. This macro is enabled with compile option 'NAN_CHECK_ENABLED',
    // which is enabled when build type is 'Debug', i.e.
    // -DCMAKE_BUILD_TYPE=Debug. In normal production mode, use
    // -DCMAKE_BUILD_TYPE=Release, which turns on all the optimizations and
    // disables NaN checks and other debug mode checks which may cause any
    // overhead to the actual simulation.
    CHECK_AND_ABORT_IF_NANS(n);
    CHECK_AND_ABORT_IF_NANS(c);
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
  j.at("c0").get_to(p.c0);
  j.at("k_alpha").get_to(p.k_alpha);
  j.at("k_beta").get_to(p.k_beta);
  j.at("Amp").get_to(p.Amp);
  j.at("T").get_to(p.T);
  j.at("Mn").get_to(p.Mn);
  j.at("omega").get_to(p.omega);
  j.at("T_a").get_to(p.T_a);
  j.at("T_b").get_to(p.T_b);
  j.at("Tc").get_to(p.Tc);
  j.at("sigma").get_to(p.sigma);
  j.at("p3").get_to(p.p3);
  j.at("p4").get_to(p.p4);

}

/*
Sometimes, one need to get access to the simulator during stepping. This can be
done by overriding the following function. The default implementation just runs
m.step(t) so if there's no need to access the simulator, it's not necessary to
override this function.
*/
void step(Simulator &s, Tungsten &m) {
#ifdef TUNGSTEN_DEBUG
  if (m.rank0) cout << "Performing Tungsten step" << endl;
#endif
  double t = s.get_time().get_current();
  m.step(t);
  // perform some extra logic after the step, which can access both simulator
  // and model
}

int main(int argc, char *argv[]) {
  cout << std::fixed;
  cout.precision(3);
  App<Tungsten> app(argc, argv);
  return app.main();
}
