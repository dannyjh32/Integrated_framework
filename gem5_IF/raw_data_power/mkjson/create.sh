#!/bin/bash
HotSpot_dir=/home/SJ/HotSpot-6.0/ResultHotSpot
gem5_dir=/home/SJ/gem5-master/0819_real
PowerTrace_File=/home/SJ/gem5-master/NewScript

#FREQ=4.1GHz
#FREQ=("3.4GHz" "3.5GHz" "3.6GHz" "3.7GHz" "3.8GHz" "3.9GHz" "4GHz" "4.1GHz" "4.2GHz" "4.9GHz" "5GHz" "5.1GHz" "5.2GHz" "5.3GHz" "5.4GHz") 

FREQ=("3GHz" "3.1GHz" "3.2GHz" "3.3GHz" "3.4GHz" "3.5GHz" "3.6GHz" "3.7GHz" "3.8GHz" "3.9GHz" "4GHz" "4.1GHz" "4.2GHz" "4.3GHz" "4.4GHz" "4.5GHz" "4.6GHz" "4.7GHz" "4.8GHz" "4.9GHz" "5GHz" "5.1GHz" "5.2GHz" "5.3GHz" "5.4GHz")

BENCHMARK=("bzip2" "gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
COOLING=("aa" "pv" "av" "l")
bench_i=0
cooling_i=0
freq_i=0

while [ ${freq_i} -ne 25 ] #17
do
	while [ ${bench_i} -ne 1 ]
	do
		cp test.sh test_${FREQ[$[freq_i]]}.sh
		sed -i "s/3GHz/${FREQ[$[freq_i]]}/g" test_${FREQ[$[freq_i]]}.sh

#For Thermal Ex
		bench_i=$((bench_i+1))
	done
	bench_i=0
	freq_i=$((freq_i+1))
done
