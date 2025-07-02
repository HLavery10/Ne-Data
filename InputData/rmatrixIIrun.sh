#!/bin/bash
# Runs R-Matrix II and puts the RMT input files into a directory called RMTInput
# Execute from the directory containing the R-Matrix II input file
# bash ./rmatrixIIrun.sh "input file"

#SBATCH --job-name=RMT_Input

#SBATCH --nodes=1

#SBATCH --ntasks-per-node=48

#SBATCH --ntasks=48

#SBATCH --time=01:30:00

#SBATCH --partition=k2-hipri

ulimit -s unlimited
~/Input/rmatrixII/build/bin/ang.x < "$1" > ang.out 2> ang.err
~/Input/rmatrixII/build/bin/rad.x < "$1" > rad.out 2> rad.err
~/Input/rmatrixII/build/bin/ham.x < "$1" > ham.out 2> ham.err
mkdir RMTinput
cp d ./RMTinput
cp d00 ./RMTinput
cp H ./RMTinput
cp Spline* ./RMTinput
tar -czvf RMTinput.tar RMTinput
