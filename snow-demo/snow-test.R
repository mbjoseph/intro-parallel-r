library("Rmpi")
library("snow")

# start up a cluster
np <- Rmpi::mpi.universe.size()
print(paste('There are', np, 'cores'))
cl <- makeCluster(np - 1, type = "MPI")

# have each cluster member say hello
greet <- function() {
  paste("I'm", Sys.info()['nodename'], 
        'with CPU type', Sys.info()['machine'])
}

clusterCall(cl, greet)

stopCluster(cl)
mpi.quit()

