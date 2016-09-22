library("Rmpi")

# spawn slaves, saving one process for the master
np <- mpi.universe.size()
mpi.spawn.Rslaves(nslaves = np - 1)

# have the slaves identify themselves
mpi.bcast.cmd(id <- mpi.comm.rank())
mpi.bcast.cmd(np <- mpi.comm.size())
mpi.bcast.cmd(host <- mpi.get.processor.name())
mpi.remote.exec(paste("I am", id, "of", np, "running on", host))

# close the slaves and quit
mpi.close.Rslaves(dellog = FALSE)
mpi.quit()

