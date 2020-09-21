#!/bin/bash
output_dir=/home/SJ/HotSpot-6.0/HWAN
config_dir=/home/SJ/HotSpot-6.0/config
hotspot_home=/home/SJ/HotSpot-6.0
BENCHMARK=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
FREQ=("3.8GHz" "3GHz" "3.2GHz" "3.2GHz" "3.6GHz" "3.7GHz" "3.9GHz" "4.1GHz" "4.2GHz" "4.6GHz" "4.9GHz" "5.4GHz" "3.5GHz" "3.8GHz" "5.3GHz")
bench_i=0
freq_i=0
#order=First
order=After3
while [ ${freq_i} -ne 1 ]
do
bench_i=0
while [ ${bench_i} -ne 9 ]
 do
	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_TSV_8High_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_TSV_8High_${order}.steady -model_type grid -grid_layer_file $hotspot_home/D_3D_CPU_2L.lcf
	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_TSV_8High_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_TSV_8High_${order}.steady -model_type grid -grid_layer_file $hotspot_home/D_3D_CPU_2L.lcf
	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_TSV_8High_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_TSV_8High_${order}.steady -model_type grid -grid_layer_file D_3D_CPU_2L.lcf
	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_act.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_TSV_8High_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_TSV_8High_${order}.steady -model_type grid -grid_layer_file $hotspot_home/D_3D_CPU_2L.lcf

	bench_i=$((bench_i+1))
done
freq_i=$((freq_i+1))
done
