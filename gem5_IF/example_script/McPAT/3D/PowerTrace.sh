#!/bin/bash
gem5_base= #your_gem5_IF_directory
hot_base= #your_HotSpot_IF_directory

HotSpot_dir=${hot_base}/output
gem5_dir=${gem5_base}/output
PowerTrace_File=${gem5_base}/example_template

FREQ=("4GHz")
BENCHMARK=("gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
bench_i=0
freq_i=0

order=zero

while [ ${freq_i} -ne 1 ]
do
#For M3D_Best
while [ ${bench_i} -ne 7 ]
do
	echo "${BENCHMARK[$[bench_i]]} creating Ptrace started"
	python ${PowerTrace_File}/PowerTrace_3D_3L.py ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_M3D_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_M3D_Best_${order}.ptrace
	python ${PowerTrace_File}/PowerTrace_3D_3L.py ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_M3D_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_M3D_Best_${order}.ptrace
	python ${PowerTrace_File}/PowerTrace_3D_3L.py ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_M3D_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_M3D_Best_${order}.ptrace
	python ${PowerTrace_File}/PowerTrace_3D_3L.py ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_M3D_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_M3D_Best_${order}.ptrace
	echo "${BENCHMARK[$[bench_i]]} creating Ptrace finished"
	bench_i=$((bench_i+1))
done
bench_i=0
#For M3D_Worst
while [ ${bench_i} -ne 7 ]
do
	echo "${BENCHMARK[$[bench_i]]} creating Ptrace started"
	python ${PowerTrace_File}/PowerTrace_3D_3L.py ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_M3D_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_M3D_Worst_${order}.ptrace
	python ${PowerTrace_File}/PowerTrace_3D_3L.py ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_M3D_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_M3D_Worst_${order}.ptrace
	python ${PowerTrace_File}/PowerTrace_3D_3L.py ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_M3D_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_M3D_Worst_${order}.ptrace
	python ${PowerTrace_File}/PowerTrace_3D_3L.py ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_M3D_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_M3D_Worst_${order}.ptrace
	echo "${BENCHMARK[$[bench_i]]} creating Ptrace finished"
	bench_i=$((bench_i+1))
done
bench_i=0
#For TSV-3D
while [ ${bench_i} -ne 7 ]
do
	echo "${BENCHMARK[$[bench_i]]} creating Ptrace started"
	python ${PowerTrace_File}/PowerTrace_3D_3L.py ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_TSV_${BENCHMARK[$[bench_i]]}_New_Thermal_${order}.txt ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_TSV_${order}.ptrace
	python ${PowerTrace_File}/PowerTrace_3D_3L.py ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_TSV_${BENCHMARK[$[bench_i]]}_New_Thermal_${order}.txt ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_TSV_${order}.ptrace
	python ${PowerTrace_File}/PowerTrace_3D_3L.py ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_TSV_${BENCHMARK[$[bench_i]]}_New_Thermal_${order}.txt ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_TSV_${order}.ptrace
	python ${PowerTrace_File}/PowerTrace_3D_3L.py ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_TSV_${BENCHMARK[$[bench_i]]}_New_Thermal_${order}.txt ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_TSV_${order}.ptrace
	echo "${BENCHMARK[$[bench_i]]} creating Ptrace finished"
	bench_i=$((bench_i+1))
done
bench_i=0

freq_i=$((freq_i+1))
done
