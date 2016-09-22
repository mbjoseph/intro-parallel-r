#! /bin/bash
#SBATCH --job-name rmpi-test
#SBATCH --time 00:00:30
#SBATCH --nodes 2
#SBATCH --output results.out
#SBATCH --qos=janus-debug

ml gcc/5.1.0
ml R/3.2.0
ml Rmpi/0.6-5

mpirun -np 1 R --vanilla -f rmpi-test.R

# clean up logfiles
rm node*.log
