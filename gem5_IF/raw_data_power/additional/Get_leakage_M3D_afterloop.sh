#!/bin/bash
Parser_home=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master
McPat_home=/home/SJ/mcpat-master/obj_opt
gem5_dir=/home/SJ/gem5-master/G_heon
gem5_dir2=/home/SJ/gem5-master/G_heon

hot_dir=/home/SJ/HotSpot-6.0/graduate
Scaling_File_2D=/home/SJ/gem5-master/NewScript/SCALING_McPAT.py
Scaling_File_M3D_3=/home/SJ/gem5-master/NewScript/SCALING_McPAT_TSV_3D_3L.py
Leakage_File=/home/SJ/gem5-master/NewScript/Get_Leakage_From_McPAT.py
FREQ=4.2GHz

BENCHMARK=("gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
BENCHMARK_1=("bzip2" "calculix" "hmmer" "povray" "sjeng")
BENCHMARK_2=("gcc" "lbm" "mcf" "soplex")

SCALING_FACTOR_1=("1.07524" "1.184953" "0.965249" "1.161018" "1.214759")
SCALING_FACTOR_2=("1.184953" "1.23082" "1.110465" "1.004897")
PCIE_SCALING_2=23.59995
PCIE_SCALING_1=23.43191
bench_i=0
cnt_i=0

#Active Air Cooling

order=After1

val=()
val2=()

filepath1=${hot_dir}/temp_result_heon_M3D_Best.txt
filepath2=${hot_dir}/temp_result_heon_M3D_Worst.txt

IFS_backup="$IFS"
IFS='\n'

while read line
do
	val+=($line)
done < $filepath1

while read line
do
	val2+=($line)
done < $filepath2

IFS="$IFS_backup"

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_bzip2_Leakage_${val[${cnt_i}+1]}_aggressive.txt ${gem5_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/aa_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_core_Leakage_${val[${cnt_i}+3]}_aggressive.txt ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_core_Leakage_${val[${cnt_i}+5]}_aggressive.txt

cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_bzip2_Leakage_${val[${cnt_i}+1]}_aggressive.txt ${gem5_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/pv_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_core_Leakage_${val[${cnt_i}+3]}_aggressive.txt ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_core_Leakage_${val[${cnt_i}+5]}_aggressive.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_bzip2_Leakage_${val[${cnt_i}+1]}_aggressive.txt ${gem5_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/av_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_core_Leakage_${val[${cnt_i}+3]}_aggressive.txt ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_core_Leakage_${val[${cnt_i}+5]}_aggressive.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_bzip2_Leakage_${val[${cnt_i}+1]}_aggressive.txt ${gem5_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/l_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_core_Leakage_${val[${cnt_i}+3]}_aggressive.txt ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_core_Leakage_${val[${cnt_i}+5]}_aggressive.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0




cnt_i=0
##Worst
while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_bzip2_Leakage_${val2[${cnt_i}+1]}_conservative_degradation.txt ${gem5_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/aa_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_core_Leakage_${val2[${cnt_i}+3]}_conservative_degradation.txt ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_core_Leakage_${val2[${cnt_i}+5]}_conservative_degradation.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_bzip2_Leakage_${val2[${cnt_i}+1]}_conservative_degradation.txt ${gem5_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/pv_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_core_Leakage_${val2[${cnt_i}+3]}_conservative_degradation.txt ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_core_Leakage_${val2[${cnt_i}+5]}_conservative_degradation.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_bzip2_Leakage_${val2[${cnt_i}+1]}_conservative_degradation.txt ${gem5_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/av_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_core_Leakage_${val2[${cnt_i}+3]}_conservative_degradation.txt ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_core_Leakage_${val2[${cnt_i}+5]}_conservative_degradation.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_bzip2_Leakage_${val2[${cnt_i}+1]}_conservative_degradation.txt ${gem5_dir2}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/l_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_core_Leakage_${val2[${cnt_i}+3]}_conservative_degradation.txt ${gem5_dir}/${FREQ}/bzip2_${FREQ}/power_core_Leakage_${val2[${cnt_i}+5]}_conservative_degradation.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

