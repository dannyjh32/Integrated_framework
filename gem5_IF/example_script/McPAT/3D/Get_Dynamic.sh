#!/bin/bash
gem5_base= #your_gem5_IF_directory

gem5_dir=${gem5_base}/output
Dynamic_File=${gem5_base}/example_template/Get_Dynamic_From_McPAT.py

FREQ=("4GHz")
BENCHMARK=("hmmer" "povray" "sjeng" "gcc" "lbm" "mcf" "soplex")

bench_i=0
freq_i=0

while [ ${freq_i} -ne 1 ]
do
#M3D_Best
while [ ${bench_i} -ne 7 ]
do
	python ${Dynamic_File} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK[$[bench_i]]}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive.txt
	bench_i=$((bench_i+1))

done
bench_i=0

#M3D_Worst
while [ ${bench_i} -ne 7 ]
do
	python ${Dynamic_File} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK[$[bench_i]]}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation.txt
	bench_i=$((bench_i+1))

done
bench_i=0

#TSV-3D
while [ ${bench_i} -ne 7 ]
do
	python ${Dynamic_File} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK[$[bench_i]]}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK[$[bench_i]]}_New_Thermal.txt
	bench_i=$((bench_i+1))

done
bench_i=0
freq_i=$((freq_i+1))

done

