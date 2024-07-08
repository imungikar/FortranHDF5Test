use h5fortran
!has to be done using cmake

use h5fortran? might be very easy


DO k=1, N_of_boundary_and_inner_objects
    historybo_filename = 'history_bo.h5'
    call h5f%open('history_bo.h5', action='w')
    call h5f%write('/value(k)', &
          & T_cntr, &
          & whole_object(k)%electron_hit_count , &
          & whole_object(k)%ion_hit_count(1:N_spec), &
          & whole_object(k)%electron_emit_count)
    call h5f%close()

program hdf5_for_history_files

add -g on makefile for debugging, use -02 for speed and debugging

DO NOT NEED TO REDEFINE A DATASPACE FOR EACH DATA H5Screate_simple
WHEN DOES PENN ADVANCE REGISTRSTION CLOSE FOR CLASSES
VECTOR THAT YOU KEEP APPENDING TO WITHIN hdf5
TIME STEP ARRAY THAT TELLS YOU WHEN THESE QUANTIIES WERE 
RUN SOME SMALL EXAMPLES TO GET USED TO HDF5--> MAKE SURE THAT WE CAN CREATE THESE DATA ON OUR OWN
      use hdf5
      use h5lt 

      integer(hid_t) :: file_id, group_id, error
      integer :: data_size= T_cntr
      real, dimension(data_size) :: data

      character(len=20) :: filename
      filename = 'history.h5'
      file_id = H5Fcreate(filename, H5F_ACC_TRUNC, H5P_DEFAULT, H5P_DEFAULT)

      

      DO k=1, N_of_boundary_and_inner_objects
            character(len=20) :: groupname
            groupname = '/boundary_obj' // convert_int_to_txt_string(k, 2)
            group_id = H5Gcreate(file_id, groupname, H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT)
            character(len=20) :: ehitcount
            
            !this process repeat x3 for emit count + ion hit count
            ehitcount = 'electron_hit_count' !create dataset
            ehitcountspaceid = H5Screate_simple(1, [data_size], [data_size])
            ehitcountsetid =  H5Dcreate(group_id, ehitcount, H5T_NATIVE_REAL, dataspace_id, H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT)
            call H5Dwrite(ehitcountsetid, H5T_NATIVE_REAL, H5S_ALL, H5S_ALL, H5P_DEFAULT, whole_object(k)%electron_hit_count) !would need to change this to edit just one indice of the array
            
            !character(len=20) :: eemitcount
            !character(len=20) :: ionhitcount
            !eemitcount = 'electron_emit_count'
            !ionhitcount = 'ion_hit_count'   
      END DO



      
      groupname = '/boundary_obj1'