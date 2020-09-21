#!/bin/bash
output_dir=/home/SJ/HotSpot-6.0/ResultHotSpot
output_dir2=/home/SJ/HotSpot-6.0/graduate_correct
config_dir=/home/SJ/HotSpot-6.0/config
hotspot_home=/home/SJ/HotSpot-6.0
FREQ=5.4GHz
FREQ2=4.2GHz
FREQ3=4GHz

#FREQ=("4.3GHz" "4.4GHz" "4.5GHz" "4.6GHz" "4.7GHz" "4.8GHz" "4.9GHz" "5GHz" "5.1GHz" "5.2GHz" "5.3GHz")
#FREQ2=("3.5GHz" "3.6GHz" "3.7GHz" "3.8GHz" "3.9GHz" "4.1GHz")


best=M3D_Best_8High_After4
worst=M3D_Worst_8High_After4
tsv=TSV_8High_After4

temp=("310" "320" "330" "340" "350" "360")
cooling=("aa" "pv" "av" "l")
BENCHMARK=("povray" "lbm")
bench_i=0
temp_i=0
cooling_i=0
freq_i=0


while [ ${freq_i} -ne 1 ]
do
 while [ ${bench_i} -ne 2 ]
 do
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${best}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${best}.steady
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${worst}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${worst}.steady

#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_${best}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_${best}.steady
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_${worst}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_${worst}.steady

	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_active.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_${best}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_${best}.steady
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_active.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_${worst}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_${worst}.steady

#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_${best}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_${best}.steady
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_${worst}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_${worst}.steady


	bench_i=$((bench_i+1))
done
bench_i=0
freq_i=$((freq_i+1))
done
freq_i=0





while [ ${freq_i} -ne 1 ]
do

 while [ ${bench_i} -ne 7 ]
 do
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${best}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${best}.steady
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${worst}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${worst}.steady

#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_${best}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_${best}.steady
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_${worst}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_${worst}.steady

#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_active.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_${best}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_${best}.steady
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_active.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_${worst}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_${worst}.steady

#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_${best}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_${best}.steady
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_${worst}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_${worst}.steady


	bench_i=$((bench_i+1))
done
bench_i=0
freq_i=$((freq_i+1))
done
freq_i=0


while [ ${freq_i} -ne 1 ]
do
 while [ ${bench_i} -ne 7 ]
 do
#./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${tsv}.ptrace -model_type grid -grid_layer_file G8TSV_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${tsv}.steady

#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_${tsv}.ptrace -model_type grid -grid_layer_file G8TSV_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_${tsv}.steady

#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_active.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_${tsv}.ptrace -model_type grid -grid_layer_file G8TSV_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_${tsv}.steady

#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_liquid.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_${tsv}.ptrace -model_type grid -grid_layer_file G8TSV_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_${tsv}.steady


	bench_i=$((bench_i+1))
done
bench_i=0
freq_i=$((freq_i+1))
done
freq_i=0

