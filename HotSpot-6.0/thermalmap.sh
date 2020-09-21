#!/bin/bash
output_dir=/home/SJ/HotSpot-6.0/ResultHotSpot
config_dir=/home/SJ/HotSpot-6.0/config
FREQ=
BENCHMARK=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
bench_i=6

 while [ ${bench_i} -ne 7 ]
 do
#	./hotspot -c cpu_d_liquid.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/2D_CPU.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_liquid_2D_${BENCHMARK[$[bench_i]]}_${FREQ}.steady -model_type block 
#	./hotspot -c cpu_d_liquid.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/3D_CPU_2L.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_liquid_3D_2L_${BENCHMARK[$[bench_i]]}_${FREQ}.steady -model_type grid -grid_layer_file D_3D_CPU_2L.lcf
#	./hotspot -c cpu_d_liquid.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/3D_CPU_3L.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_liquid_3D_3L_${BENCHMARK[$[bench_i]]}_${FREQ}.steady -model_type grid -grid_layer_file D_3D_CPU_3L.lcf

#	./hotspot -c cpu_d_vapor_passive.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/2D_CPU.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_vapor_passive_2D_${BENCHMARK[$[bench_i]]}_${FREQ}.steady -model_type block 
#	./hotspot -c cpu_d_vapor_passive.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/3D_CPU_2L.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_vapor_passive_3D_2L_${BENCHMARK[$[bench_i]]}_${FREQ}.steady -model_type grid -grid_layer_file D_3D_CPU_2L.lcf
#	./hotspot -c cpu_d_vapor_passive.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/3D_CPU_3L.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_vapor_passive_3D_3L_${BENCHMARK[$[bench_i]]}_${FREQ}.steady -model_type grid -grid_layer_file D_3D_CPU_3L.lcf
	
#	./hotspot -c cpu_d_vapor_act.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/2D_CPU.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_vapor_act_2D_${BENCHMARK[$[bench_i]]}_${FREQ}.steady -model_type block 
#	./hotspot -c cpu_d_vapor_act.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/3D_CPU_2L.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_vapor_act_3D_2L_${BENCHMARK[$[bench_i]]}_${FREQ}.steady -model_type grid -grid_layer_file D_3D_CPU_2L.lcf
#	./hotspot -c cpu_d_vapor_act.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/3D_CPU_3L.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_vapor_act_3D_3L_${BENCHMARK[$[bench_i]]}_${FREQ}.steady -model_type grid -grid_layer_file D_3D_CPU_3L.lcf
	
#	./hotspot -c ${config_dir}/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/2D_CPU.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_aa_2D_${BENCHMARK[$[bench_i]]}_${FREQ}.steady -model_type block 
#	./hotspot -c ${config_dir}/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/3D_CPU_2L.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_aa_3D_2L_${BENCHMARK[$[bench_i]]}_${FREQ}.steady -model_type grid -grid_layer_file D_3D_CPU_2L.lcf
	./hotspot -c ${config_dir}/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/3D_CPU_3L.ptrace -grid_steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_aa_3D_3L_${BENCHMARK[$[bench_i]]}_${FREQ}_2.grid -model_type grid -grid_layer_file D_3D_CPU_3L.lcf
#	./hotspot -c ${config_dir}/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/3D_CPU_2L.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_cpu_aa_3D_2L_${BENCHMARK[$[bench_i]]}_${FREQ}.steady -model_type grid -grid_layer_file M_3D_CPU_2L.lcf
#	./hotspot -c ${config_dir}/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/3D_CPU_3L.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_cpu_aa_3D_3L_${BENCHMARK[$[bench_i]]}_${FREQ}.steady -model_type grid -grid_layer_file M_3D_CPU_3L.lcf

	bench_i=$((bench_i+1))
done
