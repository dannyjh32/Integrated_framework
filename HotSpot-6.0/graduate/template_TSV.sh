#!/bin/bash
HotSpot_dir=/home/SJ/HotSpot-6.0/graduate
gem5_dir=/home/SJ/gem5-master/Result_SPEC2006
PowerTrace_File=/home/SJ/gem5-master/NewScript
FREQ=4GHz
BENCHMARK=("gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
COOLING=("aa" "pv" "av" "l") 
bench_i=0
cooling_i=0

while [ ${bench_i} -ne 7 ]
do
	mkdir ${HotSpot_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}
	cooling_i=0
	while [ ${cooling_i} -ne 4 ]
	do
		cp ${HotSpot_dir}/template_TSV.ptrace ${HotSpot_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_M3D_Best_8High_First.ptrace
		cp ${HotSpot_dir}/template_TSV.ptrace ${HotSpot_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_M3D_Worst_8High_First.ptrace

#		rm  ${HotSpot_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_M3D_Worst_8High_First.ptrace
		cooling_i=$((cooling_i+1))
	done
	bench_i=$((bench_i+1))
done
