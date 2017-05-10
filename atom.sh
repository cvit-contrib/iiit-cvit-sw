#!/bin/sh

export http_proxy="http://proxy.iiit.ac.in:8080"
export ftp_proxy="http://proxy.iiit.ac.in:8080"
export https_proxy="http://proxy.iiit.ac.in:8080"

# Utilities

apt-get install -y aptitude
##apt-get install -y xinit
##apt-get install -y firefox
#
## C 
#
apt-get install -y git
apt-get install -y binutils binutils-static build-essential
apt-get install -y gcc gcc-multilib libgomp1
apt-get install -y gcc-4.6 gcc-4.6-multilib libgomp1
apt-get install -y gcc-4.7 gcc-4.7-multilib libgomp1
apt-get install -y gcc-4.8 gcc-4.8-multilib libgomp1
apt-get install -y gcc-4.9 gcc-4.9-multilib libgomp1
#
## C++
#
apt-get install -y g++ g++-multilib libgomp1
apt-get install -y g++-4.6 g++-4.6-multilib libgomp1
apt-get install -y g++-4.7 g++-4.7-multilib libgomp1
apt-get install -y g++-4.8 g++-4.8-multilib libgomp1
apt-get install -y g++-4.9 g++-4.9-multilib libgomp1
#
## Java
#
apt-get install -y python-software-properties
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get install -y oracle-java8-installer

## Fortran
apt-get install -y gfortran 

## OpenBLAS (compiled)
apt-get build-dep -y libblas-dev
apt-get source --compile libblas-dev 
dpkg -i libblas3_1.2.20110419-7_amd64.deb
dpkg -i libblas3gf_1.2.20110419-7_all.deb
dpkg -i libblas-dev_1.2.20110419-7_amd64.deb
dpkg -i libblas-test_1.2.20110419-7_amd64.deb
dpkg -i libblas-doc_1.2.20110419-7_all.deb
apt-get build-dep -y libopenblas-base libopenblas-dev
apt-get source --compile libopenblas-base libopenblas-dev 
dpkg -i libopenblas-dev_0.2.8-6ubuntu1_amd64.deb
dpkg -i libopenblas-base_0.2.8-6ubuntu1_amd64.deb  

## Boost
apt-get install -y libboost-all-dev

## OpenMPI
## installed as dependency of slurm

## Eigen
apt-get install -y libeigen3-dev

## Armadillo
apt-get install -y libarmadillo-dev

## ARPACK
## installed as dependency of Armadillo

## OpenCV
apt-get install -y libopencv-dev opencv-data opencv-doc python-opencv opencv-data opencv-doc

## Leptonica
apt-get install -y libleptonica-dev leptonica-progs
apt-get install -y tesseract libtesseract-dev tesseract-ocr-*
#
### NetCDF
apt-get install -y libnetcdf-dev netcdf-bin
#
### Matlab dependencies
##apt-get install -y libxt6 libxmu6 libsm6 libsm6 libice6 libxtst6 libxi6
#
### ImageMagick
apt-get install -y imagemagick imagemagick-doc
#
### System
apt-get install -y tree htop lm-sensors psmisc tmux screen

### Debugging
apt-get install -y gdb ddd valgrind cgdb 

## Python
 
apt-get install -y python libpython-dev
apt-get install -y python3 libpython3-dev 

#apt-get install -y python-setuptools python-pip
#apt-get install -y python3-setuptools python3-pip

## Compilation

apt-get install -y cmake cmake-curses-gui

## Open SSL
apt-get install -y openssl
apt-get install -y libssl-dev

## Editors
apt-get install -y emacs
apt-get install -y vim vim-python

## Julia
apt-get install -y julia

## Scala
apt-get install -y scala

## Ruby
apt-get install -y ruby

## Octave
apt-get install -y octave 
apt-get install -y octave-vlfeat 

## Vlfeat
apt-get install -y libvlfeat-dev libvlfeat0

## Clang
apt-get install -y clang

## XML
apt-get install -y libxml2-dev libxslt-dev

## For OpenCV
apt-get install -y libcanberra-gtk-module libcanberra-dev

# HDF5
apt-get install -y hdf5-tools libhdf5-dev

# R
apt-get install -y r-base-core r-base-dev


#####################################################################

##sudo apt-get remove --purge gridengine-client gridengine-common gridengine-drmaa1.0 gridengine-drmaa-dev gridengine-master gridengine-qmon gridengine-exec
##sudo apt-get install nfs-kernel-server

#client
sudo apt-get install nis
sudo apt-get install sysv-rc-conf
sudo apt-get install nfslock netfs portmap nfs
sudo apt-get -y install libxerces-c-dev libxerces-c-doc libxerces-c-samples
