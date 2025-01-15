#!/bin/bash
#SBATCH --mail-user=ravneetkaur24191508@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --job-name=ravneetnewcoolproject
#SBATCH --time=00:30:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=40
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=400M  ## <- max amount of memory, 240000/128 = 937.5
#SBATCH --output=/home/rk015/dev/XPFC_2d/output.log

echo "Simulation started: `date`"
module load fftw
srun /home/rk015/dev/XPFC_2d/build/XPFC_2d_executable /home/rk015/dev/XPFC_2d/XPFC_2d.json
echo "Simulation ended: `date`"
# seff $SLURM_JOBID
