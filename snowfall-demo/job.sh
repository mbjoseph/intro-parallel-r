#! /bin/bash
#SBATCH --job-name snowfall-test
#SBATCH --time 00:00:30
#SBATCH --nodes 2
#SBATCH --output results.out
#SBATCH --ntasks-per-node 12
#SBATCH --qos=janus-debug

ml gcc/5.1.0
ml R/3.2.0
ml Rmpi/0.6-5
ml snow/0.3-13
ml snowfall/1.84-6

mpirun -np 1 R --vanilla -f snowfall-test.R

