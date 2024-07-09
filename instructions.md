Building the Repository Locally
- Access your particular location for all of these files
- https://www.youtube.com/watch?v=ysqvDunaXNA
- Vim this file into your scratch folder
- module purge
- module load openmpi/gcc/4.1.2
- module load hdf5/gcc/openmpi-4.1.0/1.10.6
- gfortran -I${HDF5DIR}/include [filename] -o [exectuable] -L${HDF5DIR}/lib64 -lhdf5_fortran -lhdf5
- chmod a+x [executable]
- ./[executable]





Committing Changes Through VS Code
- go to source control (which looks like branches)
- Click the upper left check mark, but make sure to hit on commit and push
- enter your commit message on the first thing, and then click the check mark in the upper-right side of the screen



Project Goals
- .bin and .dat --> just clean up
- checkpoints and snapshots --> fix for efficiency
- get rid of MPI barriers, optimize the parallel processing
- (worth learning all the Git features from the command line later)
- On resume talk about how this is software is used by various companies, optimizes code by x%


Links
- https://docs.hdfgroup.org/archive/support/HDF5/doc/RM/RM_H5Front.html
https://docs.hdfgroup.org/archive/support/HDF5/doc/Intro/IntroExamples.html#CreateExample