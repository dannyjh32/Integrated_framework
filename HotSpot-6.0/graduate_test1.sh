#!/bin/bash
output_dir=/home/SJ/HotSpot-6.0/supercom
output_dir2=/home/SJ/HotSpot-6.0/graduate_correct
config_dir=/home/SJ/HotSpot-6.0/config
hotspot_home=/home/SJ/HotSpot-6.0
FREQ=4GHz
temp=("320" "330" "340")
BENCHMARK=("povray" "gcc" "hmmer" "lbm" "mcf" "sjeng" "soplex")
bench_i=0
temp_i=0

while [ ${temp_i} -ne 3 ]
do
 while [ ${bench_i} -ne 7 ]
 do
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/${temp[$[temp_i]]}_2D_heon.ptrace -model_type grid -detailed_3D on -grid_layer_file G8_HBM.lcf -steady_file ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/aa_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_${temp[$[temp_i]]}.steady
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/${temp[$[temp_i]]}_2D_heon.ptrace -model_type grid -detailed_3D on -grid_layer_file G8_HBM.lcf -steady_file ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/l_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_${temp[$[temp_i]]}.steady
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/${temp[$[temp_i]]}_2D_heon.ptrace -model_type grid -detailed_3D on -grid_layer_file G8_HBM.lcf -steady_file ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/pv_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_${temp[$[temp_i]]}.steady
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_act.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/${temp[$[temp_i]]}_2D_heon.ptrace -model_type grid -detailed_3D on -grid_layer_file G8_HBM.lcf -steady_file ${output_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}/av_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_${temp[$[temp_i]]}.steady
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f G_HBM_BASE.flp -p G8_250W_30_hbmpower.ptrace -model_type grid -detailed_3D on -grid_layer_file G8_HBM.lcf -steady_file ${output_dir2}/8hightest/${BENCHMARK[$[bench_i]]}/aa_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_${temp[$[temp_i]]}_yeshbm.steady 
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f G_HBM_BASE.flp -p G_250W_30.ptrace -model_type grid -detailed_3D on -grid_layer_file G_HBM.lcf -steady_file ${output_dir2}/4hightest/${BENCHMARK[$[bench_i]]}/aa_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_${temp[$[temp_i]]}_nohbm.steady
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f G_HBM_BASE.flp -p G_250W_30_hbmpower.ptrace -model_type grid -detailed_3D on -grid_layer_file G_HBM.lcf -steady_file ${output_dir2}/4hightest/${BENCHMARK[$[bench_i]]}/aa_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_${temp[$[temp_i]]}_yeshbm.steady 

	bench_i=$((bench_i+1))
done
bench_i=0
temp_i=$((temp_i+1))
done


