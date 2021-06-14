#!/bin/bash
#SBATCH --qos=normal            # Quality of Service
#SBATCH --job-name=infercnv          # Job Name
#SBATCH --nodes=2              # Number of Nodes
#SBATCH --ntasks-per-node=2     # Number of tasks (MPI processes)
#SBATCH --cpus-per-task=8    # Number of threads per task (OMP threads)
#SBATCH --mail-type=ALL
#SBATCH --output=onscreenoutput.out
mail -s 'Your script has started' 'jyang10@tulane.edu'

module load jags/4.3.0
module unload gcc/4.7.4
module load gcc/6.3.0
export LD_LIBRARY_PATH=/share/apps/anaconda/3/5.1.0/lib:$LD_LIBRARY_PATH

Rscript start.R

mail -s 'Your script has finished' 'jyang10@tulane.edu'
