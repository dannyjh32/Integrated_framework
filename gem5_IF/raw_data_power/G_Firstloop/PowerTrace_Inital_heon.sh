#!/bin/bash
HotSpot_dir=/home/SJ/HotSpot-6.0/graduate
gem5_dir=/home/SJ/gem5-master/Result_SPEC2006
PowerTrace_File=/home/SJ/gem5-master/NewScript
FREQ=4GHz
BENCHMARK=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
COOLING=("310" "320" "330" "340" "350" "360" "370") 
bench_i=0
cooling_i=0

while [ ${bench_i} -ne 9 ]
do
	echo "${BENCHMARK[$[bench_i]]} creating Ptrace started"
	mkdir ${HotSpot_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}
#For Thermal Ex
	cooling_i=0
	while [ ${cooling_i} -ne 7 ]
	do
		python ${PowerTrace_File}/PowerTrace_2D_heon.py ${gem5_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/ScaledPower_2D_${BENCHMARK[$[bench_i]]}_${COOLING[$[cooling_i]]}_FirstLoop_heon.txt ${HotSpot_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_2D_heon.ptrace
#		python ${PowerTrace_File}/PowerTrace_2D_heon.py ${gem5_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/ScaledPower_2D_${BENCHMARK[$[bench_i]]}_${COOLING[$[cooling_i]]}_FirstLoop_heon.txt ${HotSpot_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/template.ptrace

		cooling_i=$((cooling_i+1))
	done
	echo "${BENCHMARK[$[bench_i]]} creating Ptrace finished"
	bench_i=$((bench_i+1))
done
