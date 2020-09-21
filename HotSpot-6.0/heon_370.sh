#!/bin/bash
output_dir=/home/SJ/HotSpot-6.0_hwan/supercom
config_dir=/home/SJ/HotSpot-6.0_hwan/config
hotspot_home=/home/SJ/HotSpot-6.0_hwan
FREQ=5GHz
temp=("370")
BENCHMARK=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
bench_i=0
temp_i=0

while [ ${temp_i} -ne 1 ]
do
 while [ ${bench_i} -ne 9 ]
 do
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/${temp[$[temp_i]]}_2D_heon.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_aa_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal_${temp[$[temp_i]]}.steady -model_type block 
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/${temp[$[temp_i]]}_2D_heon.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_l_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal_${temp[$[temp_i]]}.steady -model_type block 
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/${temp[$[temp_i]]}_2D_heon.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_pv_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal_${temp[$[temp_i]]}.steady -model_type block 
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_act.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/${temp[$[temp_i]]}_2D_heon.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_av_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal_${temp[$[temp_i]]}.steady -model_type block 
	bench_i=$((bench_i+1))
done
bench_i=0
temp_i=$((temp_i+1))
done


