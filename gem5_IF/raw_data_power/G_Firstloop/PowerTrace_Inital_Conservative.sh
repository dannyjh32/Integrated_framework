#!/bin/bash
HotSpot_dir=/home/SJ/HotSpot-6.0/ResultHotSpot
gem5_dir=/home/SJ/gem5-master/Result_SPEC2006
PowerTrace_File=/home/SJ/gem5-master/NewScript
FREQ=3.4GHz
BENCHMARK=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
COOLING=("aa" "pv" "av" "l")
bench_i=0
cooling_i=0

while [ ${bench_i} -ne 9 ]
do
	echo "${BENCHMARK[$[bench_i]]} creating Ptrace started"
	mkdir ${HotSpot_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}
#For Thermal Ex
	cooling_i=0
	while [ ${cooling_i} -ne 4 ]
	do
		python ${PowerTrace_File}/PowerTrace.py ${gem5_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/ScaledPower_2D_${BENCHMARK[$[bench_i]]}_${COOLING[$[cooling_i]]}_FirstLoop_conservative.txt ${HotSpot_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_2D_conservative.ptrace ${HotSpot_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_3D_2L_temp_conservative.ptrace ${HotSpot_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_3D_3L_temp_conservative.ptrace
		cooling_i=$((cooling_i+1))
	done
	echo "${BENCHMARK[$[bench_i]]} creating Ptrace finished"
	bench_i=$((bench_i+1))
done
