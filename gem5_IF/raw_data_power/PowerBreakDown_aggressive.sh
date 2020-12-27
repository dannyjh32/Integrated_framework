#!/bin/bash
Parser_home=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master
McPat_home=/home/SJ/mcpat-master/obj_opt
gem5_dir=/home/SJ/gem5-master/0819_real
Scaling_File_3D_2L=/home/SJ/gem5-master/NewScript/PowerBreakDown.py
FREQ=4GHz
BENCHMARK_1=("hmmer" "lbm" "mcf" "sjeng" "soplex")
BENCHMARK_2=("gcc" "povray")
 
SCALING_FACTOR_1=("1.042875" "1.282823" "1.146262" "1.23586" "1.051933")
SCALING_FACTOR_2=("1.203617" "1.187621")
PCIE_SCALING_1=23.59995
PCIE_SCALING_2=23.43191
bench_i=0
order1=After1
order2=After2
while [ ${bench_i} -ne 5 ]
do
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/aa_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order1}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/aa_BreakDown_M3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order2}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/pv_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order1}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/pv_BreakDown_TSV-3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order2}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/av_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order1}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/av_BreakDown_TSV-3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order2}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/l_Scaled_LekagePower_M3D_2L_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order1}.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/l_BreakDown_TSV-3D_${BENCHMARK_1[$[bench_i]]}_New_Thermal_aggressive_${order2}.txt

	bench_i=$((bench_i+1))

done

bench_i=0

while [ ${bench_i} -ne 2 ]
do
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/aa_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order1}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/aa_BreakDown_TSV-3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order2}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/pv_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order1}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/pv_BreakDown_TSV-3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order2}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/av_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order1}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/av_BreakDown_TSV-3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order2}.txt
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive.txt ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/l_Scaled_LekagePower_M3D_2L_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order1}.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/l_BreakDown_TSV-3D_${BENCHMARK_2[$[bench_i]]}_New_Thermal_aggressive_${order2}.txt

	bench_i=$((bench_i+1))

done
