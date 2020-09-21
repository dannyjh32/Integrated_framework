#!/bin/bash
output_dir=/home/SJ/HotSpot-6.0/ResultHotSpot
config_dir=/home/SJ/HotSpot-6.0/config
hotspot_home=/home/SJ/HotSpot-6.0
FREQ=4GHz
BENCHMARK=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
Cooling=("aa" "pv" "av" "l")
Configuration=("conservative_degradation" "conservative" "aggressive" "aggressive_degradation")
cooling_i=0
configuration_i=0
bench_i=0

 while [ ${bench_i} -ne 9 ]
 do
	cooling_i=0
	while [ ${cooling_i} -ne 2 ]
	do
		configuration_i=0
		while [ ${configuration_i} -ne 4 ]
		do
			$hotspot_home/hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_${Cooling[$[cooling_i]]}.config -f $hotspot_home/D_2D_CPU.flp -p ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/4Layer_${Cooling[$[cooling_i]]}_3D_3L_New_Thermal_${Configuration[$[configuration_i]]}.ptrace -steady_file ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/4Layer_M3D_cpu_${Cooling[$[cooling_i]]}_3D_3L_${BENCHMARK[$[bench_i]]}_${FREQ}_${Configuration[$[configuration_i]]}_Thermal.steady -model_type grid -grid_layer_file $hotspot_home/M_3D_CPU_3L.lcf


		configuration_i=$((configuration_i+1))
		done

	cooling_i=$((cooling_i+1))
	done
	bench_i=$((bench_i+1))
done
