import numpy as np
import matplotlib.pyplot as plt
import os
import json

plt.rcParams['figure.figsize']=(12,6)

#print("Run Name (sigXpXX_vXpXX_gXpXXXXXX): ")
#run = input()

print("Start Number: ")
low = int(input())-1
print("End Number: ")
high = int(input())

param_file = '/home/rk015/dev/XPFC_2d/XPFC_2d.json'
file = open(param_file, 'r')
parameters=json.load(file)
Nx = parameters['Lx']
Ny = parameters['Ly']

Nz = parameters['Lz']
dx = parameters['dx']
dy = parameters['dy']
dz = parameters['dz']

'''
if Ny > 1024:
    mode = 1
else:
    mode = 2


Nz = parameters['Lz']
dx = parameters['dx']
dy = parameters['dy']

kkx = np.fft.fftfreq(Nx) * 2 * np.pi/dx
kky = np.fft.fftfreq(Ny) * 2 * np.pi/dy

kx,ky = np.meshgrid(kkx,kky)

k2 = ky**2 + kx**2

filt = np.exp(-k2/(2*0.05*0.05))

#boundary = np.loadtxt('/home/rk015/scratch/rk015/{}/boundary_position.txt'.format(run))
dt=2
t = np.arange(len(boundary))*dt
boundary = np.floor(boundary[::500]/dx)'''

for k in np.arange(low,high):
    print("Plot number: ", k)
    #ind_left = int(boundary[k]%int(Nx))
    #ind_right = ind_left + int(np.floor(51/dx)%int(Nx))
    n = np.fromfile('/home/rk015/scratch/rk015/XPFC_2d/data/density/density_{}.bin'.format(k)).reshape(Ny,Nx)
    conc = np.fromfile('/home/rk015/scratch/rk015/XPFC_2d/data/concentration/concentration_{}.bin'.format(k)).reshape(Ny,Nx)

    #n = np.roll(n, -ind_left, axis=-1)
    #temp = np.roll(temp, -ind_left, axis=-1)
        
    if os.path.isdir('/home/rk015/dev/XPFC_2d/images')==False:
        os.mkdir('/home/rk015/dev/XPFC_2d/images')

    outfile = '/home/rk015/dev/XPFC_2d/images/image_{}.png'.format(k)

    ind = np.abs(conc[Ny//2,:] - 0.6).argmax()

    '''if mode == 2:

        fig, axs = plt.subplots(2,1)
        im0 = axs[0].imshow(n, origin='lower')
        axs[0].set_title("Density")
        axs[0].axhline(Ny//2)
        #im1 = axs[1].imshow(np.abs(amp), origin='lower')
        im1 = axs[1].plot(temp[Ny//2,:])
        #axs[1].set_ylim(-0.25,0.25)
        axs[1].set_title("Temperature Slice")
        fig.suptitle("Frame: {}".format(k))
        #cb0 = fig.colorbar(im0, ax=axs[0], orientation='horizontal')
        #cb1 = fig.colorbar(im1, ax=axs[1], orientation='vertical')
    else:
        fig, axs = plt.subplots()
        im0 = axs.imshow(n, origin='lower')
        axs.set_title("Density")
        axs.axvline(ind)
        fig.suptitle("Frame: {}".format(k))
        cb0 = fig.colorbar(im0, ax=axs, orientation='vertical')


        '''

    fig, axs = plt.subplots(1,2)
    im0 = axs[0].imshow(n, cmap='jet', origin='lower')  # Plotting the real part
    axs[0].set_title("Density")
    cb0 = fig.colorbar(im0, ax = axs[0], label='Number Density Difference')
    axs[0].set_xlabel('X')
    axs[0].set_ylabel('Y')
    fig.suptitle('PHASE FIELD CRYSTAL MODEL IN FOURIER SPACE, time = {}'.format(k))
            
    im1 = axs[1].imshow(conc, cmap='jet', origin='lower')  # Plotting the real part
    cb1 = fig.colorbar(im1, ax=axs[1], label='Concentration field')
    axs[1].set_xlabel('X')
    axs[1].set_ylabel('Y')
    axs[1].set_title('Concentration')   
    
    plt.savefig(outfile, dpi=450)
    plt.clf()
    plt.close(fig)
