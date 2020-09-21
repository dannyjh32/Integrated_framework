#!/bin/bash
output_dir=/home/SJ/HotSpot-6.0/ResultHotSpot
output_dir2=/home/SJ/HotSpot-6.0/graduate
config_dir=/home/SJ/HotSpot-6.0/config
hotspot_home=/home/SJ/HotSpot-6.0
FREQ=4GHz

best=M3D_Best_8High_After1
worst=M3D_Worst_8High_After1

temp=("310" "320" "330" "340" "350" "360")
cooling=("aa" "pv" "av" "l")
BENCHMARK=("povray" "gcc" "hmmer" "lbm" "mcf" "sjeng" "soplex")
bench_i=0
temp_i=0
cooling_i=0

 while [ ${bench_i} -ne 7 ]
 do
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/aa_${best}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/aa_${best}.steady
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/aa_${worst}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/aa_${worst}.steady

	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/pv_${best}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/pv_${best}.steady
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/pv_${worst}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/pv_${worst}.steady

	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_active.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/av_${best}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/av_${best}.steady
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_active.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/av_${worst}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/av_${worst}.steady

	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/l_${best}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/l_${best}.steady
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/l_${worst}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/l_${worst}.steady


	bench_i=$((bench_i+1))
done
bench_i=0


