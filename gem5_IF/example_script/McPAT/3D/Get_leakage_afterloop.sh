#!/bin/bash
gem5_base= #your_gem5_IF_directory
hot_base= #your_HotSpot_IF_directory

gem5_dir=${gem5_base}/output
Leakage_File=${gem5_base}/example_template/Get_Leakage_From_McPAT.py

FREQ=("4GHz")
BENCHMARK=("gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")

bench_i=0
cnt_i=0
freq_i=0

order=first

val=()
val2=()
val3=()

filepath1=${hot_base}/example_script/temp_result_M3D_Best.txt
filepath2=${hot_base}/example_script/temp_result_M3D_Worst.txt
filepath3=${hot_base}/example_script/temp_result_TSV.txt

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

while read line
do
	val3+=($line)
done < $filepath3

IFS="$IFS_backup"


#For M3D_Best
freq_i=0
while [ ${freq_i} -ne 1 ]
do
bench_i=0
while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val[${cnt_i}+1]}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_M3D_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val[${cnt_i}+3]}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val[${cnt_i}+5]}_aggressive.txt

cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val[${cnt_i}+1]}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_M3D_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val[${cnt_i}+3]}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val[${cnt_i}+5]}_aggressive.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val[${cnt_i}+1]}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_M3D_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val[${cnt_i}+3]}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val[${cnt_i}+5]}_aggressive.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val[${cnt_i}+1]}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_M3D_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val[${cnt_i}+3]}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val[${cnt_i}+5]}_aggressive.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0
freq_i=$((freq_i+1))
done


#For M3D_worst
cnt_i=0
freq_i=0
bench_i=0
while [ ${freq_i} -ne 1 ]
do
while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val2[${cnt_i}+1]}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_M3D_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val2[${cnt_i}+3]}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val2[${cnt_i}+5]}_conservative_degradation.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val2[${cnt_i}+1]}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_M3D_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val2[${cnt_i}+3]}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val2[${cnt_i}+5]}_conservative_degradation.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val2[${cnt_i}+1]}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_M3D_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val2[${cnt_i}+3]}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val2[${cnt_i}+5]}_conservative_degradation.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val2[${cnt_i}+1]}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_M3D_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val2[${cnt_i}+3]}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val2[${cnt_i}+5]}_conservative_degradation.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0
freq_i=$((freq_i+1))
done



#For TSV-3D
cnt_i=0
freq_i=0
bench_i=0
while [ ${freq_i} -ne 1 ]
do
while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val3[${cnt_i}+1]}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_TSV_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val3[${cnt_i}+3]}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val3[${cnt_i}+5]}.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val3[${cnt_i}+1]}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_TSV_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val3[${cnt_i}+3]}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val3[${cnt_i}+5]}.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val3[${cnt_i}+1]}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_TSV_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val3[${cnt_i}+3]}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val3[${cnt_i}+5]}.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val3[${cnt_i}+1]}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_TSV_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val3[${cnt_i}+3]}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val3[${cnt_i}+5]}.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0
freq_i=$((freq_i+1))
done
