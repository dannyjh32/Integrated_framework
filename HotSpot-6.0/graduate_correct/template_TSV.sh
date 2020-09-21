#!/bin/bash
HotSpot_dir=/home/SJ/HotSpot-6.0/graduate_correct
gem5_dir=/home/SJ/gem5-master/Result_SPEC2006
PowerTrace_File=/home/SJ/gem5-master/NewScript
#FREQ=4GHz
FREQ=("2.7GHz" "2.8GHz" "2.9GHz" "3GHz" "3.1GHz" "3.2GHz" "3.3GHz" "3.4GHz" "3.5GHz" "3.6GHz" "3.7GHz" "3.8GHz" "3.9GHz" "4GHz")
BENCHMARK=("gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
COOLING=("aa" "pv" "av" "l") 
freq_i=0
bench_i=0
cooling_i=0

while [ ${freq_i} -ne 14 ]
do
while [ ${bench_i} -ne 7 ]
do
#   mkdir ${HotSpot_dir}/${FREQ[$[freq_i]]}
#   mkdir ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}
	cooling_i=0
	while [ ${cooling_i} -ne 4 ]
	do
		cp ${HotSpot_dir}/template_TSV.ptrace ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_TSV_8High_First.ptrace
		cp ${HotSpot_dir}/template_TSV.ptrace ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_TSV_8High_First.ptrace
		cp ${HotSpot_dir}/template_TSV.ptrace ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_TSV_8High_After1.ptrace
		cp ${HotSpot_dir}/template_TSV.ptrace ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_TSV_8High_After1.ptrace
		cp ${HotSpot_dir}/template_TSV.ptrace ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_TSV_8High_After2.ptrace
		cp ${HotSpot_dir}/template_TSV.ptrace ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_TSV_8High_After2.ptrace
		cp ${HotSpot_dir}/template_TSV.ptrace ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_TSV_8High_After3.ptrace
		cp ${HotSpot_dir}/template_TSV.ptrace ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${COOLING[$[cooling_i]]}_TSV_8High_After3.ptrace
	cooling_i=$((cooling_i+1))
	done
	bench_i=$((bench_i+1))
	done
	bench_i=0
	freq_i=$((freq_i+1))
done
	 

