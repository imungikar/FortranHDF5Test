program hdf5p2
    use hdf5
    implicit none
    character(len=8), parameter :: filename = "dsetf.h5" 
    character(len=4), parameter :: dsetname = "dset"
    integer(hid_t) :: file_id
    integer(hid_t) :: dataset_id
    integer(hid_t) :: dataspace_id
    integer(hsize_t), dimension(2) :: dims = (/4,6/)
    integer :: rank =2
    integer :: error
    call h5open_f(error)
    call h5fcreate_f(filename, H5F_ACC_TRUNC_F, file_id, error)
    call h5screate_simple_f(rank, dims, dataspace_id, error)
    call h5dcreate_f(file_id, dsetname, H5T_NATIVE_INTEGER, dataspace_id, dataspace_id, error)
    call h5dclose_f(dataset_id, error)
    call h5sclose_f(dataspace_id, error)
    call h5fclose_f(file_id, error)
    call h5close_f(error)
end program hdf5p2