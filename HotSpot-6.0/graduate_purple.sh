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


best=M3D_Best_8High_After3
worst=M3D_Worst_8High_After3
tsv=TSV_8High_After3

temp=("310" "320" "330" "340" "350" "360")
cooling=("aa" "pv" "av" "l")
BENCHMARK=("povray" "gcc" "hmmer" "lbm" "mcf" "sjeng" "soplex")
bench_i=0
temp_i=0
cooling_i=0
freq_i=0

FREQ=5GHz
bench_i=2
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${best}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${best}.steady
FREQ=5GHz
bench_i=5
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${best}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${best}.steady





FREQ2=4.1GHz
bench_i=5
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${worst}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${worst}.steady
FREQ2=3.9GHz
bench_i=0
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${worst}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${worst}.steady
FREQ2=4.1GHz
bench_i=0
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_${worst}.ptrace -model_type grid -grid_layer_file G8M3D_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ2[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_${worst}.steady





	
	
FREQ3=3.6GHz
bench_i=6
	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${tsv}.ptrace -model_type grid -grid_layer_file G8TSV_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${tsv}.steady

FREQ3=3.8GHz
bench_i=6
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_${tsv}.ptrace -model_type grid -grid_layer_file G8TSV_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_${tsv}.steady

FREQ3=3.3GHz
bench_i=2
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${tsv}.ptrace -model_type grid -grid_layer_file G8TSV_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${tsv}.steady

FREQ3=3.5GHz
bench_i=2
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_${tsv}.ptrace -model_type grid -grid_layer_file G8TSV_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_${tsv}.steady

FREQ3=3.9GHz
bench_i=2
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_act.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_${tsv}.ptrace -model_type grid -grid_layer_file G8TSV_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_${tsv}.steady

FREQ3=3.9GHz
bench_i=5

#./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_act.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_${tsv}.ptrace -model_type grid -grid_layer_file G8TSV_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_${tsv}.steady

FREQ3=3GHz
bench_i=0
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_aa.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${tsv}.ptrace -model_type grid -grid_layer_file G8TSV_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_${tsv}.steady

FREQ3=3.2GHz
bench_i=0
#	./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_passive.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_${tsv}.ptrace -model_type grid -grid_layer_file G8TSV_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_${tsv}.steady

FREQ3=3.7GHz
bench_i=0

#./hotspot -c ${config_dir}/config/${BENCHMARK[$[bench_i]]}/${BENCHMARK[$[bench_i]]}_vapor_act.config -f G_HBM_BASE.flp -p ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_${tsv}.ptrace -model_type grid -grid_layer_file G8TSV_HBM.lcf -detailed_3D on -steady_file ${output_dir2}/${FREQ3[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_${tsv}.steady

	
	



