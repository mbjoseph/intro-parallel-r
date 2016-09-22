# snowfall demo on Janus

The `snowfall` R package wraps `snow` and `Rmpi`, and is bundled up in a module on Janus. 
The file `job.sh` is the slurm job script to be submitted, which calls `snowfall-test.R`. 

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

