#!/bin/bash
output_dir=/home/SJ/HotSpot-6.0/ResultHotSpot
config_dir=/home/SJ/HotSpot-6.0/config
hotspot_home=/home/SJ/HotSpot-6.0
FREQ=4GHz
BENCHMARK=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
bench_i=0

 while [ ${bench_i} -ne 9 ]
 do
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/aa_2D.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_aa_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal.steady -model_type block 
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/l_2D.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_liquid_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal.steady -model_type block 
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/pv_2D.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_vapor_passive_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal.steady -model_type block 
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_act.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/av_2D.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_vapor_act_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal.steady -model_type block 

	bench_i=$((bench_i+1))
done
