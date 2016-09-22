# snow demo on Janus

The `snow` R package provides simple parallel functionality with multiple backends, including MPI, and is bundled up in a module on Janus. 
The file `job.sh` is the slurm job script to be submitted, which calls `snow-test.R`. 

Usage:

This requires that you are logged in to Janus:

```
ssh -l $your_username login.rc.colorado.edu
```

Once you've logged in, load slurm and then use `sbatch` to submit the job to `janus-debug`: 

```
ml slurm
sbatch job.sh
```

