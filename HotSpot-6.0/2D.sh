#!/bin/bash
output_dir=/home/SJ/HotSpot-6.0/ResultHotSpot
config_dir=/home/SJ/HotSpot-6.0/config
hotspot_home=/home/SJ/HotSpot-6.0
FREQ=("5.6GHz" "6.8GHz" "5.3GHz" "5.4GHz" "5.5GHz" "5.6GHz" "5.7GHz" "5.8GHz" "5.9GHz" "6GHz" "6.1GHz" "6.2GHz" "6.3GHz" "6.4GHz" "6.5GHz" "6.6GHz" "6.7GHz" "6.8GHz" "6.9GHz" "7GHz" "7.1GHz" "7.2GHz" "7.3GHz" "7.4GHz" "7.5GHz" "7.6GHz" "7.7GHz" "7.8GHz" "7.9GHz" "8GHz")
BENCHMARK=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
TEMP=("320" "330" "340" "350" "360")
bench_i=4
temp_i=0
freq_i=0

while [ ${freq_i} -ne 1 ] 
do
	bench_i=0

	while [ ${bench_i} -ne 9 ]
	do
		temp_i=0
		while [ ${temp_i} -ne 5 ]
		do
					$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${TEMP[$[temp_i]]}_2D_heon.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${TEMP[$[temp_i]]}_2D_cpu_aa_200525.steady -model_type block 
					$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${TEMP[$[temp_i]]}_2D_heon.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${TEMP[$[temp_i]]}_2D_cpu_liquid_200525.steady -model_type block 
						$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${TEMP[$[temp_i]]}_2D_heon.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${TEMP[$[temp_i]]}_2D_cpu_vapor_passive_200525.steady -model_type block 
						$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_act.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${TEMP[$[temp_i]]}_2D_heon.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${TEMP[$[temp_i]]}_2D_cpu_vapor_active_200525.steady -model_type block 
				
temp_i=$((temp_i+1))
	done
		bench_i=$((bench_i+1))
	done
	freq_i=$((freq_i+1))
done

