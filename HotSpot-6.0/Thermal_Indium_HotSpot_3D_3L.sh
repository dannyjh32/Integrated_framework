#!/bin/bash
output_dir=/home/SJ/HotSpot-6.0/ResultHotSpot
config_dir=/home/SJ/HotSpot-6.0/config
hotspot_home=/home/SJ/HotSpot-6.0
FREQ=3.4GHz
BENCHMARK=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
Cooling=("aa" "pv" "av" "l")
cooling_i=0
bench_i=0

 while [ ${bench_i} -ne 9 ]
 do
# We Need This For 3D_3L (temp)
#	./hotspot -c ${config_dir}/leakage/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/3D_3L_temp.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_aa_3D_3L_${BENCHMARK[$[bench_i]]}_${FREQ}_temp.steady -model_type grid -grid_layer_file D_3D_CPU_3L.lcf
#	./hotspot -c ${config_dir}/leakage/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/3D_3L_temp.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_cpu_aa_3D_3L_${BENCHMARK[$[bench_i]]}_${FREQ}_temp.steady -model_type grid -grid_layer_file M_3D_CPU_3L.lcf
#	./hotspot -c ${config_dir}/leakage/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/3D_3L_temp.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_liquid_3D_3L_${BENCHMARK[$[bench_i]]}_${FREQ}_temp.steady -model_type grid -grid_layer_file D_3D_CPU_3L.lcf
#	./hotspot -c ${config_dir}/leakage/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/3D_3L_temp.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_cpu_liquid_3D_3L_${BENCHMARK[$[bench_i]]}_${FREQ}_temp.steady -model_type grid -grid_layer_file M_3D_CPU_3L.lcf
#	./hotspot -c ${config_dir}/leakage/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/3D_3L_temp.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_vapor_passive_3D_3L_${BENCHMARK[$[bench_i]]}_${FREQ}_temp.steady -model_type grid -grid_layer_file D_3D_CPU_3L.lcf
#	./hotspot -c ${config_dir}/leakage/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/3D_3L_temp.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_cpu_vapor_passive_3D_3L_${BENCHMARK[$[bench_i]]}_${FREQ}_temp.steady -model_type grid -grid_layer_file M_3D_CPU_3L.lcf
#	./hotspot -c ${config_dir}/leakage/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_act.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/3D_3L_temp.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_vapor_act_3D_3L_${BENCHMARK[$[bench_i]]}_${FREQ}_temp.steady -model_type grid -grid_layer_file D_3D_CPU_3L.lcf
#	./hotspot -c ${config_dir}/leakage/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_act.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/3D_3L_temp.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/M3D_cpu_vapor_act_3D_3L_${BENCHMARK[$[bench_i]]}_${FREQ}_temp.steady -model_type grid -grid_layer_file M_3D_CPU_3L.lcf

# We Need This For 3D_3L (thermal)
		./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/INDIUM_aa_TSV-3D_3L_Thermal.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/INDIUM_cpu_aa_3D_3L_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal.steady -model_type grid -grid_layer_file D_3D_CPU_3L_INDIUM.lcf

		./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/INDIUM_l_TSV-3D_3L_Thermal.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/INDIUM_cpu_liquid_3D_3L_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal.steady -model_type grid -grid_layer_file D_3D_CPU_3L_INDIUM.lcf

		./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/INDIUM_pv_TSV-3D_3L_Thermal.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/INDIUM_cpu_vapor_passive_3D_3L_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal.steady -model_type grid -grid_layer_file D_3D_CPU_3L_INDIUM.lcf

		./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_act.config -f D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/INDIUM_av_TSV-3D_3L_Thermal.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/INDIUM_cpu_vapor_act_3D_3L_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal.steady -model_type grid -grid_layer_file D_3D_CPU_3L_INDIUM.lcf

		bench_i=$((bench_i+1))
done
