#!/bin/bash
Parser_home=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master
McPat_home=/home/SJ/mcpat-master/obj_opt
gem5_dir=/home/SJ/gem5-master/0819_real
gem5_dir2=/home/SJ/gem5-master/0819_real
Scaling_File_2D=/home/SJ/gem5-master/NewScript/SCALING_McPAT.py
Scaling_File_3D_2L=/home/SJ/gem5-master/NewScript/Scale_3D.py
#FREQ=4.59GHz
#FREQ=5.4GHz
FREQ=("5GHz" "4.7GHz" "5.3GHz" "3.2GHz" "3.6GHz" "3.7GHz" "3.9GHz" "4.1GHz" "4.2GHz" "4.6GHz" "4.9GHz" "5.4GHz" "3.5GHz" "3.8GHz" "5.3GHz")

BENCHMARK_1=("hmmer" "lbm" "mcf" "sjeng" "soplex")
BENCHMARK_2=("gcc" "povray")

SCALING_FACTOR_1=("1.042875" "1.282823" "1.146262" "1.23586" "1.051933")
SCALING_FACTOR_2=("1.203617" "1.187621")
PCIE_SCALING_1=23.59995
PCIE_SCALING_2=23.43191
bench_i=0
freq_i=0
order=zero

while [ ${freq_i} -ne 2 ]
do

while [ ${bench_i} -ne 5 ]
do

	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt

	bench_i=$((bench_i+1))

done

bench_i=0

while [ ${bench_i} -ne 2 ]
do
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt

	bench_i=$((bench_i+1))

done

bench_i=0



while [ ${bench_i} -ne 5 ]
do

	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt

	bench_i=$((bench_i+1))

done

bench_i=0

while [ ${bench_i} -ne 2 ]
do
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt

	bench_i=$((bench_i+1))

done
bench_i=0
freq_i=$((freq_i+1))
done
