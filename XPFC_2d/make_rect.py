import numpy as np
import matplotlib.pyplot as plt
cos = np.cos
sq = np.sqrt
RES = 8
NLAMBDA = 128
Nx = NLAMBDA * RES
Ny = NLAMBDA * RES
k_alpha = 2*np.pi
k_beta = 2.25*np.pi
q = k_alpha
a = (2*np.pi)/q
Lx = NLAMBDA * a
Ly = NLAMBDA * a
dx = a/RES
dy = a/RES
dt = 1
x = np.arange(0, Nx)*dx
y = np.arange(0, Ny)*dy
Amp = 0.32864
X, Y = np.meshgrid(x, y)
no = 0.05
Am = 0.32864
center_x, center_y = Lx/2, Ly/2
n = no + 2*Amp*(cos(q * (X)) + 2*cos((q*(X))/2) * cos((sq(3)*q*(Y))/2))

c = np.ones([Nx, Ny])
cS = 0.22
cL = 0.36
Cav = 0.3
T = 0.22
co = 0.5
total_area = Lx*Ly
rect_area = Ly/4 * Lx
fs = rect_area/total_area
fL = 1 - fs
cL_s = ((Cav - cS)/fL) + cS

n[X > Lx/4] = no
c[X <= Lx/4] = cS
c[X > Lx/4] = cL_s
c.tofile('/home/rk015/dev/XPFC_2d/initial/c_init.bin')
n.tofile('/home/rk015/dev/XPFC_2d/initial/n_init.bin')

fig, axs = plt.subplots(1,2)
#axs[0].axhline(Ly//2, c='r')
im0 = axs[0].imshow(n, cmap='jet', origin='lower')  # Plotting the real part
axs[0].set_title("Density")
cb0 = fig.colorbar(im0, ax = axs[0], label='Number Density Difference, $n_o$ = 0.05')
axs[0].set_xlabel('X')
axs[0].set_ylabel('Y')
fig.suptitle('PHASE FIELD CRYSTAL MODEL IN FOURIER SPACE, time = 0')

im1 = axs[1].imshow(c, cmap='jet', origin='lower')  # Plotting the real part
cb1 = fig.colorbar(im1, ax=axs[1], label='Concentration field')
axs[1].set_xlabel('X')
axs[1].set_ylabel('Y')
axs[1].set_title('Concentration')

outfile = '/home/rk015/dev/XPFC_2d/IC.png'
plt.savefig(outfile, dpi=450)
plt.clf()
plt.close(fig)
