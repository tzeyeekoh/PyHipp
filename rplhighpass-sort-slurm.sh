#!/bin/bash

# Submit this script with: sbatch <this-filename>

#SBATCH --time=24:00:00   # walltime
#SBATCH --ntasks=1   # number of processor cores (i.e. tasks)
#SBATCH --nodes=1   # number of nodes
#SBATCH --cpus-per-task=1	# number of processors per task
<<<<<<< HEAD
#SBATCH -J "rplhps"   # job name

## /SBATCH -p general # partition (queue)
#SBATCH -o rplhps-slurm.%N.%j.out # STDOUT
#SBATCH -e rplhps-slurm.%N.%j.err # STDERR
=======
#SBATCH -J "rplhighpass"   # job name

## /SBATCH -p general # partition (queue)
#SBATCH -o rplhighpass-slurm.%N.%j.out # STDOUT
#SBATCH -e rplhighpass-slurm.%N.%j.err # STDERR
>>>>>>> 60057f6fcdd8bd8ae10d38f5c03540085a6f3e61

# LOAD MODULES, INSERT CODE, AND RUN YOUR PROGRAMS HERE
/data/miniconda3/bin/conda init
source ~/.bashrc
envarg=`/data/src/PyHipp/envlist.py`
conda activate $envarg

python -u -c "import PyHipp as pyh; \
import time; \
pyh.RPLHighPass(saveLevel=1); \
from PyHipp import mountain_batch; \
mountain_batch.mountain_batch(); \
from PyHipp import export_mountain_cells; \
export_mountain_cells.export_mountain_cells(); \
print(time.localtime());"

conda deactivate 
/data/src/PyHipp/envlist.py $envarg
<<<<<<< HEAD
=======

>>>>>>> 60057f6fcdd8bd8ae10d38f5c03540085a6f3e61
