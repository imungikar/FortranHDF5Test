program hdf5test
    use hdf5
    implicit none

    ! Variables
    integer(hid_t) :: file_id, dataset_id, dataspace_id  ! Handles for file, dataset, and dataspace
    integer :: error                             ! Error handling
    integer, parameter :: rank = 2                       ! Rank of the dataset (2D array)
    integer, dimension(2) :: dims = [4, 6]               ! Dimensions of the dataset
    real(8), dimension(4, 6) :: data                     ! Data to write to the dataset
    integer :: i, j

    ! Initialize the data array
    do i = 1, 4
        do j = 1, 6
            data(i, j) = real(i * j)
        end do
    end do

    ! Create a new HDF5 file using default properties
    file_id = h5fcreate('example.h5', H5F_ACC_TRUNC_F, H5P_DEFAULT_F, H5P_DEFAULT_F, error)

    ! Create the data space for the dataset
    dataspace_id = h5screate_simple(rank, dims, dims, error)

    ! Create the dataset
    dataset_id = h5dcreate_f(file_id, 'dset', H5T_NATIVE_DOUBLE, dataspace_id, H5P_DEFAULT_F, H5P_DEFAULT_F, H5P_DEFAULT_F, error)

    ! Write the data to the dataset
    call h5dwrite_f(dataset_id, H5T_NATIVE_DOUBLE, data, dims, error)

    ! Close the dataset and dataspace
    call h5dclose_f(dataset_id, error)
    call h5sclose_f(dataspace_id, error)

    ! Close the file
    call h5fclose_f(file_id, error)

    print *, 'HDF5 file created and dataset written successfully.'

end program hdf5test
