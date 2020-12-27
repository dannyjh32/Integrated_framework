#!/bin/bash
Parser_home=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master
McPat_home=/home/SJ/mcpat-master/obj_opt
gem5_dir=/home/SJ/gem5-master/Result_SPEC2006
gem5_dir2=/home/SJ/gem5-master/G_heon
Leakage_File=/home/SJ/gem5-master/NewScript/Get_Leakage_From_McPAT.py
Dynamic_File=/home/SJ/gem5-master/NewScript/Get_Dynamic_From_McPAT_3D_3L.py

FREQ=4GHz
#FREQ=("3.4GHz" "3.5GHz" "3.6GHz" "3.7GHz" "3.8GHz" "3.9GHz" "4GHz" "4.1GHz" "4.2GHz" "4.3GHz" "4.4GHz" "4.5GHz" "4.6GHz" "4.7GHz" "4.8GHz" "4.9GHz" "5GHz" "5.1GHz" "5.2GHz" "5.3GHz" "5.4GHz")

BENCHMARK_1=("bzip2" "calculix" "hmmer" "povray" "sjeng")

BENCHMARK_2=("gcc" "lbm" "mcf" "soplex")

bench_i=0
freq_i=0

while [ ${freq_i} -ne 1 ]
do
while [ ${bench_i} -ne 5 ]
do
	echo "${BENCHMARK[$[bench_i]]} scaling started"
	python ${Dynamic_File} ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK_1[$[bench_i]]}_aa_FirstLoop_aggressive.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_4l.txt
	echo "${BENCHMARK_1[$[bench_i]]} scaling finished"
	bench_i=$((bench_i+1))

done
bench_i=0
while [ ${bench_i} -ne 4 ]
do
	echo "${BENCHMARK[$[bench_i]]} scaling started"
	python ${Dynamic_File} ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK_2[$[bench_i]]}_aa_FirstLoop_aggressive.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_4l.txt
	echo "${BENCHMARK_2[$[bench_i]]} scaling finished"
	bench_i=$((bench_i+1))

done

bench_i=0

while [ ${bench_i} -ne 5 ]
do
	echo "${BENCHMARK[$[bench_i]]} scaling started"
	python ${Dynamic_File} ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK_1[$[bench_i]]}_aa_FirstLoop_conservative_degradation.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_4l.txt
	echo "${BENCHMARK_1[$[bench_i]]} scaling finished"
	bench_i=$((bench_i+1))

done
bench_i=0
while [ ${bench_i} -ne 4 ]
do
	echo "${BENCHMARK[$[bench_i]]} scaling started"
	python ${Dynamic_File} ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK_2[$[bench_i]]}_aa_FirstLoop_conservative_degradation.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_4l.txt
	echo "${BENCHMARK_2[$[bench_i]]} scaling finished"
	bench_i=$((bench_i+1))
done
bench_i=0
freq_i=$((freq_i+1))
done

