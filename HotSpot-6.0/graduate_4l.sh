#!/bin/bash
output_dir=/home/SJ/HotSpot-6.0/HWAN
config_dir=/home/SJ/HotSpot-6.0/config
hotspot_home=/home/SJ/HotSpot-6.0
BENCHMARK=("povray" )
FREQ=("4GHz")
bench_i=0
freq_i=0
order=o3
while [ ${freq_i} -ne 1 ]
do
bench_i=0
while [ ${bench_i} -ne 1 ]
 do
	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/4Layer_aa_M3D_Best_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/4Layer_aa_M3D_Best_8High_${order}.steady -model_type grid -grid_layer_file $hotspot_home/M_3D_CPU_3L.lcf
	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/4Layer_l_M3D_Best_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/4Layer_l_M3D_Best_8High_${order}.steady -model_type grid -grid_layer_file $hotspot_home/M_3D_CPU_3L.lcf
	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/4Layer_pv_M3D_Best_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/4Layer_pv_M3D_Best_8High_${order}.steady -model_type grid -grid_layer_file M_3D_CPU_3L.lcf
	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_act.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/4Layer_av_M3D_Best_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/4Layer_av_M3D_Best_8High_${order}.steady -model_type grid -grid_layer_file $hotspot_home/M_3D_CPU_3L.lcf

#	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_M3D_Worst_8High_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_M3D_Worst_8High_${order}.steady -model_type grid -grid_layer_file $hotspot_home/M_3D_CPU_2L.lcf
#	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_M3D_Worst_8High_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_M3D_Worst_8High_${order}.steady -model_type grid -grid_layer_file $hotspot_home/M_3D_CPU_2L.lcf
#	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_M3D_Worst_8High_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_M3D_Worst_8High_${order}.steady -model_type grid -grid_layer_file M_3D_CPU_2L.lcf
#	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_act.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_M3D_Worst_8High_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_M3D_Worst_8High_${order}.steady -model_type grid -grid_layer_file $hotspot_home/M_3D_CPU_2L.lcf
	bench_i=$((bench_i+1))
done
freq_i=$((freq_i+1))
done
