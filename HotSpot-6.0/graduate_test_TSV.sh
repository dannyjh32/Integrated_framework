#!/bin/bash
output_dir=/home/SJ/HotSpot-6.0/ResultHotSpot
output_dir2=/home/SJ/HotSpot-6.0/graduate
config_dir=/home/SJ/HotSpot-6.0/config
hotspot_home=/home/SJ/HotSpot-6.0
FREQ=4GHz
temp=("310" "320" "330" "340" "350" "360")
BENCHMARK=("mcf" "calculix" "gcc" "hmmer" "lbm" "mcf" "bzip2" "sjeng" "soplex")
bench_i=0
temp_i=0

while [ ${temp_i} -ne 1 ]
do
 while [ ${bench_i} -ne 1 ]
 do
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f G_HBM_BASE.flp -p ${output_dir}/4GHz/mcf/pv_TSV-3D2L_New_Thermal.ptrace -model_type grid -grid_layer_file D_3D_CPU_2L.lcf -steady_file ${output_dir2}/4GHz/${BENCHMARK[$[bench_i]]}/cpu_pvc_TSV3D_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal_${temp[$[temp_i]]}.steady
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f G_HBM_BASE.flp -p GTSV_250W_30.ptrace -model_type grid -grid_layer_file GTSV_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/4GHz/${BENCHMARK[$[bench_i]]}/2.5_cpu_pvc_TSV3D_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal_${temp[$[temp_i]]}.steady

#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f D_2D_CPU.flp -p G_250W_30.ptrace -model_type grid -detailed_3D on -grid_layer_file G_HBM.lcf -steady_file ${output_dir2}/test/${BENCHMARK[$[bench_i]]}/cpu_l_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal_${temp[$[temp_i]]}.steady -model_type block 
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f D_2D_CPU.flp -p G_250W_30.ptrace -model_type grid -detailed_3D on -grid_layer_file G_HBM.lcf -steady_file ${output_dir2}/test/${BENCHMARK[$[bench_i]]}/cpu_pv_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal_${temp[$[temp_i]]}.steady -model_type block 
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_act.config -f D_2D_CPU.flp -p G_250W_30.ptrace -model_type grid -detailed_3D on -grid_layer_file G_HBM.lcf -steady_file ${output_dir2}/test/${BENCHMARK[$[bench_i]]}/cpu_av_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal_${temp[$[temp_i]]}.steady -model_type block 
	bench_i=$((bench_i+1))
done
bench_i=0
temp_i=$((temp_i+1))
done


