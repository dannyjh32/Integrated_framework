#!/bin/bash
hot_base= #your_hotspot_IF_directory

output_dir=${hot_base}/output
config_dir=${hot_base}/config
hotspot_home=${hot_base}

BENCHMARK=("gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
FREQ=("4GHz")

bench_i=0
freq_i=0
order=zero

while [ ${freq_i} -ne 1 ]
do
bench_i=0
while [ ${bench_i} -ne 7 ]
 do
	$hotspot_home/hotspot -c ${config_dir}/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_M3D_Best_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_M3D_Best_${order}.steady -model_type grid -grid_layer_file $hotspot_home/M3D_CPU_3L.lcf
	$hotspot_home/hotspot -c ${config_dir}/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_l.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_M3D_Best_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_M3D_Best_${order}.steady -model_type grid -grid_layer_file $hotspot_home/M3D_CPU_3L.lcf
	$hotspot_home/hotspot -c ${config_dir}/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_pv.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_M3D_Best_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_M3D_Best_${order}.steady -model_type grid -grid_layer_file $hotspot_home/M3D_CPU_3L.lcf
	$hotspot_home/hotspot -c ${config_dir}/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_av.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_M3D_Best_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_M3D_Best_${order}.steady -model_type grid -grid_layer_file $hotspot_home/M3D_CPU_3L.lcf

	$hotspot_home/hotspot -c ${config_dir}/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_M3D_Worst_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_M3D_Worst_${order}.steady -model_type grid -grid_layer_file $hotspot_home/M3D_CPU_3L.lcf
	$hotspot_home/hotspot -c ${config_dir}/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_l.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_M3D_Worst_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_M3D_Worst_${order}.steady -model_type grid -grid_layer_file $hotspot_home/M3D_CPU_3L.lcf
	$hotspot_home/hotspot -c ${config_dir}/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_pv.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_M3D_Worst_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_M3D_Worst_${order}.steady -model_type grid -grid_layer_file $hotspot_home/M3D_CPU_3L.lcf
	$hotspot_home/hotspot -c ${config_dir}/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_av.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_M3D_Worst_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_M3D_Worst_${order}.steady -model_type grid -grid_layer_file $hotspot_home/M3D_CPU_3L.lcf

	$hotspot_home/hotspot -c ${config_dir}/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_TSV_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_TSV_${order}.steady -model_type grid -grid_layer_file $hotspot_home/TSV_3D_CPU_3L.lcf
	$hotspot_home/hotspot -c ${config_dir}/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_l.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_TSV_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_TSV_${order}.steady -model_type grid -grid_layer_file $hotspot_home/TSV_3D_CPU_3L.lcf
	$hotspot_home/hotspot -c ${config_dir}/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_pv.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_TSV_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_TSV_${order}.steady -model_type grid -grid_layer_file $hotspot_home/TSV_3D_CPU_3L.lcf
	$hotspot_home/hotspot -c ${config_dir}/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_av.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_TSV_${order}.ptrace -steady_file ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_TSV_${order}.steady -model_type grid -grid_layer_file $hotspot_home/TSV_3D_CPU_3L.lcf
	bench_i=$((bench_i+1))
done
freq_i=$((freq_i+1))
done
