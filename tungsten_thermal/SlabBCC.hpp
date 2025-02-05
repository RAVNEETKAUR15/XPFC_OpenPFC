#ifndef SLABBCC_HPP
#define SLABBCC_HPP

#include <array>
#include <iostream>
#include <openpfc/openpfc.hpp>
#include <openpfc/ui.hpp>
#include <openpfc/field_modifier.hpp>
#include <openpfc/initial_conditions/seed.hpp>
#include <random>

using json = nlohmann::json;
using namespace pfc;

/**
 * @brief SlabBCC is a FieldModifier that seeds the model with a slab of BCC seeds.
 *
 */
class SlabBCC : public FieldModifier {
private:
  int m_Ny = 2;
  int m_Nz = 1;
  double m_X0;
  double m_amplitude;
  double m_fluctuation;
  double m_rho;
  double m_rseed;

public:
  SlabBCC() = default;

  SlabBCC(int Ny, int Nz, double X0, double amplitude, double fluctuation, double rho, double rseed)
      : m_Ny(Ny), m_Nz(Nz), m_X0(X0), m_amplitude(amplitude), m_fluctuation(fluctuation), m_rho(rho), m_rseed(rseed) {}

  // getters
  int get_Ny() const { return m_Ny; }
  int get_Nz() const { return m_Nz; }
  double get_X0() const { return m_X0; }
  double get_amplitude() const { return m_amplitude; }
  double get_fluctuation() const { return m_fluctuation; }
  double get_rho() const { return m_rho; }
  double get_rseed() const { return m_rseed; }

  // setters
  void set_Ny(int Ny) { m_Ny = Ny; }
  void set_Nz(int Nz) { m_Nz = Nz; }
  void set_X0(double X0) { m_X0 = X0; }
  void set_amplitude(double amplitude) { m_amplitude = amplitude; }
  void set_fluctuation(double fluctuation) { m_fluctuation = fluctuation; }
  void set_rho(double rho) { m_rho = rho; }
  void set_rseed(double rseed) { m_rseed = rseed; }

  /**
   * @brief Apply the initial condition to the model.
   *
   * @param m is the model to apply the initial condition to.
   */
  void apply(Model &m, double) override {
    const World &w = m.get_world();
    const Decomposition &decomp = m.get_decomposition();
    Field &field = m.get_real_field("psi");
    Vec3<int> low = decomp.inbox.low;
    Vec3<int> high = decomp.inbox.high;

    // auto Lx = w.Lx;
    auto Ly = w.Ly;
    auto Lz = w.Lz;
    auto dx = w.dx;
    auto dy = w.dy;
    auto dz = w.dz;
    auto x0 = w.x0;
    auto y0 = w.y0;
    auto z0 = w.z0;

    std::vector<Seed> seeds;

    int Ny = m_Ny;
    int Nz = m_Nz;
    double rseed = m_rseed;

    double rho = get_rho();
    double amplitude = get_amplitude();
    double fluctuation = get_fluctuation();

    double X0 = m_X0;
    double Dy = dy * Ly / Ny;
    double Y0 = Dy / 2.0;
    double Dz = dz * Lz / Nz;
    double Z0 = Dz / 2.0;
    int nseeds = Ny * Nz;

    double radius = 1.;

    std::cout << "Generating " << nseeds << " random seeds up to distance " << X0  << "\n";

    std::mt19937_64 re(rseed);
    std::uniform_real_distribution<double> rt(-0.2 * radius, 0.2 * radius);
    std::uniform_real_distribution<double> rr(0.0, 8.0 * atan(1.0));
    std::uniform_real_distribution<double> ra(-fluctuation, fluctuation);

    for (int j = 0; j < Ny; j++) {
      for (int k = 0; k < Nz; k++) {
        const std::array<double, 3> location = {X0 + rt(re), Y0 + Dy * j + rt(re), Z0 + Dz * k + rt(re)};
        const std::array<double, 3> orientation = {rr(re), rr(re), rr(re)};
        const Seed seed(location, orientation, radius, rho, amplitude);
        seeds.push_back(seed);
      }
    }

    long int idx = 0;
    for (int k = low[2]; k <= high[2]; k++) {
      for (int j = low[1]; j <= high[1]; j++) {
        for (int i = low[0]; i <= high[0]; i++) {
          const double x = x0 + i * dx;
          const double y = y0 + j * dy;
          const double z = z0 + k * dz;
          const std::array<double, 3> X = {x, y, z};
          for (const auto &seed : seeds) {
            if (x < (X0 + ra(re) ) ) {
	      const int ns = floor(y / Dy);
              field[idx] = seeds[ns].get_value(X);
            }
          }
          idx += 1;
        }
      }
    }
  }
}; // SlabBCC

/**
 * @brief Configure SlabBCC object from a json file.
 *
 * @param params json object containing the parameters.
 * @param ic SlabBCC object to configure.
 * @return void
 *
 * Example json configuration:
 *
 * { "type": "slab_bcc", "X0": 130.0, "Ny": 2, "Nz": 1, 
 * "amplitude": 0.2, "fluctuation": 10.0, "rho": -0.036, "rseed": 42 }
 *
 * The "type" field is required and must be "seed_grid_fcc". The "rseed" field is
 * optional and defaults to 0. All other fields are required. The "Ny" and "Nz"
 * fields are the number of seeds in the y and z directions, respectively. The
 * "X0" field is the x-coordinate of the center of the first seed. The "radius"
 * field is the radius of the seeds. The "amplitude" field is the amplitude of
 * the seed. The "rho" field is the background density. The "rseed" field is the
 * random seed.
 *
 */
void from_json(const json &params, SlabBCC &ic) {
  std::cout << "Parsing SlabBCC from json" << std::endl;

  // check for required fields
  if (!params.contains("amplitude") || !params["amplitude"].is_number()) {
    throw std::invalid_argument("Reading SlabBCC failed: missing or invalid 'amplitude' field.");
  }
  if (!params.contains("fluctuation") || !params["fluctuation"].is_number()) {
    throw std::invalid_argument("Reading SlabBCC failed: missing or invalid 'amplitude' field.");
  }
  if (!params.contains("rho") || !params["rho"].is_number()) {
    throw std::invalid_argument("Reading SlabBCC failed: missing or invalid 'rho' field.");
  }
  if (!params.contains("Ny") || !params["Ny"].is_number()) {
    throw std::invalid_argument("Reading SlabBCC failed: missing or invalid 'Ny' field.");
  }
  if (!params.contains("Nz") || !params["Nz"].is_number()) {
    throw std::invalid_argument("Reading SlabBCC failed: missing or invalid 'Nz' field.");
  }
  if (!params.contains("X0") || !params["X0"].is_number()) {
    throw std::invalid_argument("Reading SlabBCC failed: missing or invalid 'X0' field.");
  }
  if (!params.contains("rseed") || !params["rseed"].is_number()) {
    std::cout << "No valid random seed detected, using default value 0." << std::endl;
  }

  ic.set_Ny(params["Ny"]);
  ic.set_Nz(params["Nz"]);
  ic.set_X0(params["X0"]);
  ic.set_amplitude(params["amplitude"]);
  ic.set_fluctuation(params["fluctuation"]);
  ic.set_rho(params["rho"]);
  if (params.contains("rseed") && params["rseed"].is_number()) ic.set_rseed(params["rseed"]);
}

#endif // SLABBCC_HPP
