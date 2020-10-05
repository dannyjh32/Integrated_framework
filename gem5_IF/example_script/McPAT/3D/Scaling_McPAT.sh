#!/bin/bash
gem5_base= #your_gem5_IF_directory

gem5_dir=${gem5_base}/output
Scaling_File_3D_3L=${gem5_base}/example_template/Scale_3D.py
FREQ=("4GHz")

BENCHMARK_1=("hmmer" "lbm" "mcf" "sjeng" "soplex")
BENCHMARK_2=("gcc" "povray")

SCALING_FACTOR_1=("1.042875" "1.282823" "1.146262" "1.23586" "1.051933")
SCALING_FACTOR_2=("1.203617" "1.187621")
PCIE_SCALING_1=23.59995
PCIE_SCALING_2=23.43191
bench_i=0
freq_i=0
order=zero

while [ ${freq_i} -ne 1 ]
do

#For M3D_Best
while [ ${bench_i} -ne 5 ]
do
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_M3D_3L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_M3D_3L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_M3D_3L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_M3D_3L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 2 ]
do
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_M3D_3L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_M3D_3L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_M3D_3L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_M3D_3L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order}.txt
	bench_i=$((bench_i+1))
done
bench_i=0


#For M3D_Worst
while [ ${bench_i} -ne 5 ]
do
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_M3D_3L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_M3D_3L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_M3D_3L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_M3D_3L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 2 ]
do
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_M3D_3L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_M3D_3L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_M3D_3L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_M3D_3L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_M3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt
	bench_i=$((bench_i+1))
done
bench_i=0

#For TSV-3D
while [ ${bench_i} -ne 5 ]
do
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_TSV_3L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_TSV_${BENCHMARK_1[$[bench_i]]}_New_Thermal_${order}.txt
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_TSV_3L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_TSV_${BENCHMARK_1[$[bench_i]]}_New_Thermal_${order}.txt
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_TSV_3L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_TSV_${BENCHMARK_1[$[bench_i]]}_New_Thermal_${order}.txt
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_TSV_3L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_${order}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_TSV_${BENCHMARK_1[$[bench_i]]}_New_Thermal_${order}.txt
	bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 2 ]
do
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_TSV_3L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_TSV_${BENCHMARK_2[$[bench_i]]}_New_Thermal_${order}.txt
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_TSV_3L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_TSV_${BENCHMARK_2[$[bench_i]]}_New_Thermal_${order}.txt
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_TSV_3L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_TSV_${BENCHMARK_2[$[bench_i]]}_New_Thermal_${order}.txt
	python ${Scaling_File_3D_3L} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_TSV_3L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_${order}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_TSV_${BENCHMARK_2[$[bench_i]]}_New_Thermal_${order}.txt
	bench_i=$((bench_i+1))
done
bench_i=0



freq_i=$((freq_i+1))
done
