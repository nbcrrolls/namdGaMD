#!/bin/bash

# Compile and install NAMD prerequisites

if [ $# -ne 1 ]; then
    echo "Usage: $0 compiler"
    echo "    compiler can be gnu, intel or pgi (pgi is not tested for NBCR)"
    exit 0
fi 

if [ ! -d $NBCRDEVEL ]; then
    echo "Need to install roll 'nbcr' first"
    exit 1
fi

# set google url for dowloading sources
. $NBCRDEVEL/bootstrap-values.sh

# download sources
. $ROLLSROOT/etc/bootstrap-functions.sh

# NAMD distro NAMD_*.tar.gz is available on google drive on nbcr.ucsd@gmail.com 
# or from nbcrrolls/source private repo
echo ""
echo "WARNING: before making a roll download NAMD source from nbcr.ucsd@gmail.com goodledrive in privaterools/"
echo ""

# build and install fftw 
(cd src/fftw; make ROLLCOMPILER=$1 rpm; make ROLLCOMPILER=$1 clean)
rpm -i RPMS/x86_64/namdGaMD-fftw-$1*.rpm

# build and install tcl 
(cd src/tcl; make ROLLCOMPILER=$1 rpm; make ROLLCOMPILER=$1 clean)
rpm -i RPMS/x86_64/namdGaMD-tcl-$1*.rpm
