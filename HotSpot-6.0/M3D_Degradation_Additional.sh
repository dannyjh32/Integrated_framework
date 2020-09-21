#!/bin/bash
output_dir=/home/SJ/HotSpot-6.0/ResultHotSpot
config_dir=/home/SJ/HotSpot-6.0/config
hotspot_home=/home/SJ/HotSpot-6.0
FREQ=5GHz
BENCHMARK=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
bench_i=3

 while [ ${bench_i} -ne 4 ]
 do
	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_2L_M3D_conservative_degradation_Additional.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_cpu_aa_3D_2L_${BENCHMARK[$[bench_i]]}_${FREQ}_M3D_conservative_degradation_Additional.steady -model_type grid -grid_layer_file $hotspot_home/M_3D_CPU_2L.lcf
	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_2L_M3D_conservative_degradation_Additional.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_cpu_liquid_3D_2L_${BENCHMARK[$[bench_i]]}_${FREQ}_M3D_conservative_degradation_Additional.steady -model_type grid -grid_layer_file $hotspot_home/M_3D_CPU_2L.lcf
	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_2L_M3D_conservative_degradation_Additional.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_cpu_vapor_passive_3D_2L_${BENCHMARK[$[bench_i]]}_${FREQ}_M3D_conservative_degradation_Additional.steady -model_type grid -grid_layer_file M_3D_CPU_2L.lcf
	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_act.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_2L_M3D_conservative_degradation_Additional.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_cpu_vapor_act_3D_2L_${BENCHMARK[$[bench_i]]}_${FREQ}_M3D_conservative_degradation_Additional.steady -model_type grid -grid_layer_file $hotspot_home/M_3D_CPU_2L.lcf

	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_2L_M3D_aggressive_degradation_Additional.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_cpu_aa_3D_2L_${BENCHMARK[$[bench_i]]}_${FREQ}_M3D_aggressive_degradation_Additional.steady -model_type grid -grid_layer_file $hotspot_home/M_3D_CPU_2L.lcf
	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_2L_M3D_aggressive_degradation_Additional.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_cpu_liquid_3D_2L_${BENCHMARK[$[bench_i]]}_${FREQ}_M3D_aggressive_degradation_Additional.steady -model_type grid -grid_layer_file $hotspot_home/M_3D_CPU_2L.lcf
	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_2L_M3D_aggressive_degradation_Additional.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_cpu_vapor_passive_3D_2L_${BENCHMARK[$[bench_i]]}_${FREQ}_M3D_aggressive_degradation_Additional.steady -model_type grid -grid_layer_file M_3D_CPU_2L.lcf
	$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_act.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_2L_M3D_aggressive_degradation_Additional.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_cpu_vapor_act_3D_2L_${BENCHMARK[$[bench_i]]}_${FREQ}_M3D_aggressive_degradation_Additional.steady -model_type grid -grid_layer_file $hotspot_home/M_3D_CPU_2L.lcf
	bench_i=$((bench_i+1))
done
