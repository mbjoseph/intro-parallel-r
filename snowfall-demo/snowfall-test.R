library("Rmpi")
library("snowfall")

# initialization
np <- Rmpi::mpi.universe.size()
print(paste('There are', np, 'cores'))
sfInit(parallel = TRUE, cpus = np - 1, type = "MPI")

# use monte carlo integration to approximate pi with varying MC sample sizes
approx_pi <- function(n) {
  # approximates pi via MC integration of unit disk
  x <- runif(n, min = -1, max = 1)
  y <- runif(n, min = -1, max = 1)
  V <- 4
  f_hat <- ifelse(x^2 + y^2 <= 1, 1, 0)
  V * sum(f_hat) / n
}

n <- seq(10, 1E7, length.out = 50)
result <- sfSapply(n, approx_pi)
result

# shut down and quit
sfStop()
mpi.quit()

