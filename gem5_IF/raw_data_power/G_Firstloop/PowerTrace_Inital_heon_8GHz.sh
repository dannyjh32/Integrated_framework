#!/bin/bash
HotSpot_dir=/home/SJ/HotSpot-6.0/ResultHotSpot
gem5_dir=/home/SJ/gem5-master/Result_SPEC2006
PowerTrace_File=/home/SJ/gem5-master/NewScript
FREQ=("5.6GHz" "6.8GHz" "5.3GHz" "5.4GHz"  "5.5GHz" "5.6GHz" "5.7GHz" "5.8GHz" "5.9GHz" "6GHz" "6.1GHz" "6.2GHz" "6.3GHz" "6.4GHz"  "6.5GHz" "6.6GHz" "6.7GHz" "6.8GHz" "6.9GHz" "7GHz" "7.1GHz" "7.2GHz" "7.3GHz" "7.4GHz"  "7.5GHz" "7.6GHz" "7.7GHz" "7.8GHz" "7.9GHz" "8GHz")


BENCHMARK=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
COOLING=("370" "320" "330" "340" "350" "360")
bench_i=0
cooling_i=0
freq_i=0

while [ ${freq_i} -ne 1 ]
do
bench_i=0
while [ ${bench_i} -ne 9 ]
do
	echo "${BENCHMARK[$[bench_i]]} creating Ptrace started"
	mkdir ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}
#For Thermal Ex
	cooling_i=0
	while [ ${cooling_i} -ne 6 ]
	do
		python ${PowerTrace_File}/PowerTrace.py ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/ScaledPower_2D_${BENCHMARK[$[bench_i]]}_${COOLING[$[cooling_i]]}_FirstLoop_heon.txt ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_2D_heon.ptrace ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_3D_2L_temp_heon.ptrace ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_3D_3L_temp_heon.ptrace
		cooling_i=$((cooling_i+1))
	done
	echo "${BENCHMARK[$[bench_i]]} creating Ptrace finished"
	bench_i=$((bench_i+1))
done
	freq_i=$((freq_i+1))

done
