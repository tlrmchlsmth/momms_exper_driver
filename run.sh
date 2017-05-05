#!/bin/bash

DRAMBW=$1

#Create output directory for experiments
mkdir -p ./out/$DRAMBW

#Pin the cpu frequency to 4200 MHz
./pin_cpu_freq.sh

#Make sure binaries for momms and the mkl driver are already built
source $HOME/.cargo/env
cargo build --release --features hsw --manifest-path ./momms/Cargo.toml
cargo build --release --manifest-path ./mkl_rust_driver/Cargo.toml

#Make sure MKL and BLIS use 4 threads
export OMP_NUM_THREADS=4

#Run mkl experiment
export LD_LIBRARY_PATH="/opt/intel/lib/intel64/:/opt/intel/mkl/lib/intel64/" 
echo "Running experiment mkl"
nice -n -20 ./mkl_rust_driver/target/release/mkl_rust_driver > ./out/$DRAMBW/mkl.out

#Run momms experiments
for exper in l3_packing l3 l3_shapes; do
    echo "Running experiment $exper"
    nice -n -20 ./momms/target/release/exper_$exper > ./out/$DRAMBW/$exper.out
done
