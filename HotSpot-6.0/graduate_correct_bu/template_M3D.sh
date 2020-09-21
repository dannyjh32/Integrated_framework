#!/bin/bash
HotSpot_dir=/home/SJ/HotSpot-6.0/graduate_correct
gem5_dir=/home/SJ/gem5-master/Result_SPEC2006
PowerTrace_File=/home/SJ/gem5-master/NewScript
FREQ=4GHz
BENCHMARK=("gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
COOLING=("aa" "pv" "av" "l") 
bench_i=0
cooling_i=0
freq_i=0

#FREQ=("4GHz" "4.2GHz" "3.5GHz" "3.6GHz" "3.7GHz" "3.8GHz" "3.9GHz" "4.1GHz" "4.3GHz" "4.4GHz" "4.5GHz" "4.6GHz" "4.7GHz" "4.8GHz" "4.9GHz" "5GHz" "5.1GHz" "5.2GHz" "5.3GHz" "5.4GHz")

while [ ${freq_i} -ne 1 ]
do
while [ ${bench_i} -ne 7 ]
do
#	mkdir ${HotSpot_dir}/${FREQ[$[freq_i]]}
#   mkdir ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}
	cooling_i=0
	while [ ${cooling_i} -ne 4 ]
	do
		cp ${HotSpot_dir}/template_M3D.ptrace ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_M3D_Best_8High_First.ptrace
		cp ${HotSpot_dir}/template_M3D.ptrace ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_M3D_Worst_8High_First.ptrace
		cp ${HotSpot_dir}/template_M3D.ptrace ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_M3D_Best_8High_After1.ptrace
		cp ${HotSpot_dir}/template_M3D.ptrace ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_M3D_Worst_8High_After1.ptrace
		cp ${HotSpot_dir}/template_M3D.ptrace ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_M3D_Best_8High_After2.ptrace
		cp ${HotSpot_dir}/template_M3D.ptrace ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_M3D_Worst_8High_After2.ptrace
		cp ${HotSpot_dir}/template_M3D.ptrace ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_M3D_Best_8High_After3.ptrace
		cp ${HotSpot_dir}/template_M3D.ptrace ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_M3D_Worst_8High_After3.ptrace

#		rm  ${HotSpot_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_M3D_Worst_8High_First.ptrace
		cooling_i=$((cooling_i+1))
	done
	bench_i=$((bench_i+1))
done
	bench_i=0
	freq_i=$((freq_i+1))
done
