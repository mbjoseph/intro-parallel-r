#! /bin/bash
#SBATCH --job-name snow-test
#SBATCH --time 00:00:30
#SBATCH --nodes 2
#SBATCH --output results.out
#SBATCH --ntasks-per-node 12
#SBATCH --qos=janus-debug

ml gcc/5.1.0
ml R/3.2.0
ml Rmpi/0.6-5
ml snow/0.3-13

mpirun -np 1 R --vanilla -f snow-test.R

