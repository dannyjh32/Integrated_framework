#!/bin/bash
Parser_home=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master
McPat_home=/home/SJ/mcpat-master/obj_opt
gem5_dir=/home/SJ/gem5-master/G_heon
gem5_dir2=/home/SJ/gem5-master/G_heon
Scaling_File_2D=/home/SJ/gem5-master/NewScript/SCALING_McPAT.py
Scaling_File_3D_2L=/home/SJ/gem5-master/NewScript/Scale_3D.py
#FREQ=4.59GHz
FREQ=4.2GHz
BENCHMARK_1=("hmmer" "povray" "sjeng")
BENCHMARK_2=("gcc" "lbm" "mcf" "soplex")

SCALING_FACTOR_1=("0.965249" "1.161018" "1.214759")
SCALING_FACTOR_2=("1.184953" "1.23082" "1.110465" "1.004897")
PCIE_SCALING_2=23.59995
PCIE_SCALING_1=23.43191
bench_i=0

order=After1

while [ ${bench_i} -ne 3 ]
do

	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir2}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/aa_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir2}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/aa_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir2}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/pv_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir2}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/pv_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir2}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/av_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir2}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/av_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir2}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/l_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir2}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/l_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt

	bench_i=$((bench_i+1))

done

bench_i=0

while [ ${bench_i} -ne 4 ]
do
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir2}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/aa_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir2}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/aa_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir2}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/pv_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir2}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/pv_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir2}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/av_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir2}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/av_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir2}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/l_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir2}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/l_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt

	bench_i=$((bench_i+1))

done

bench_i=0



while [ ${bench_i} -ne 3 ]
do

	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir2}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/aa_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir2}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/aa_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir2}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/pv_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir2}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/pv_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir2}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/av_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir2}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/av_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir2}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/l_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir2}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/l_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt

	bench_i=$((bench_i+1))

done

bench_i=0

while [ ${bench_i} -ne 4 ]
do
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir2}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/aa_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir2}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/aa_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir2}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/pv_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir2}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/pv_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir2}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/av_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir2}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/av_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir2}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/l_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir2}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/l_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt

	bench_i=$((bench_i+1))

done
