#!/bin/bash
HotSpot_dir=/home/SJ/HotSpot-6.0/graduate
gem5_dir=/home/SJ/gem5-master/Result_SPEC2006
PowerTrace_File=/home/SJ/gem5-master/NewScript
FREQ=4.2GHz
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
		python ${PowerTrace_File}/PowerTrace_heon.py ${gem5_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/ScaledPower_2D_${BENCHMARK[$[bench_i]]}_${COOLING[$[cooling_i]]}_FirstLoop_aggressive.txt ${HotSpot_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_2D_aggressive.ptrace ${HotSpot_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_M3D_Best_8High_First.ptrace ${HotSpot_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_3D_3L_temp_aggressive.ptrace
		python ${PowerTrace_File}/PowerTrace_heon.py ${gem5_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/ScaledPower_2D_${BENCHMARK[$[bench_i]]}_${COOLING[$[cooling_i]]}_FirstLoop_conservative_degradation.txt ${HotSpot_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_2D_aggressive.ptrace ${HotSpot_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_M3D_Worst_8High_First.ptrace ${HotSpot_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_3D_3L_temp_aggressive.ptrace

		cooling_i=$((cooling_i+1))
	done
	echo "${BENCHMARK[$[bench_i]]} creating Ptrace finished"
	bench_i=$((bench_i+1))
done
