#!/bin/bash
Parser_home=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master
McPat_home=/home/SJ/mcpat-master/obj_opt
gem5_dir=/home/SJ/gem5-master/0819_real
gem5_dir2=/home/SJ/gem5-master/0819_real

hot_dir=/home/SJ/HotSpot-6.0/graduate
Scaling_File_2D=/home/SJ/gem5-master/NewScript/SCALING_McPAT.py
Scaling_File_M3D_3=/home/SJ/gem5-master/NewScript/SCALING_McPAT_TSV_3D_3L.py
Leakage_File=/home/SJ/gem5-master/NewScript/Get_Leakage_From_McPAT.py
#FREQ=5.4GHz
FREQ=("4.7GHz" "4GHz" "5.3GHz" "3.2GHz" "3.6GHz" "3.7GHz" "3.9GHz" "4.1GHz" "4.2GHz" "4.6GHz" "4.9GHz" "5.4GHz" "3.5GHz" "3.8GHz" "5.3GHz")

BENCHMARK=("gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
BENCHMARK_1=("bzip2" "calculix" "hmmer" "povray" "sjeng")
BENCHMARK_2=("gcc" "lbm" "mcf" "soplex")

SCALING_FACTOR_1=("1.07524" "1.184953" "0.965249" "1.161018" "1.214759")
SCALING_FACTOR_2=("1.184953" "1.23082" "1.110465" "1.004897")
PCIE_SCALING_2=23.59995
PCIE_SCALING_1=23.43191
bench_i=0
cnt_i=0
freq_i=0
#Active Air Cooling

order=zero

val=330
val2=330

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


while [ ${freq_i} -ne 1 ]
do
while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val}_aggressive.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_aggressive.txt

cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val}_aggressive.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_aggressive.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val}_aggressive.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_aggressive.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val}_aggressive.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_aggressive.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0




cnt_i=0
##Worst
while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val2}_conservative_degradation.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val2}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val2}_conservative_degradation.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val2}_conservative_degradation.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val2}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val2}_conservative_degradation.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val2}_conservative_degradation.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val2}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val2}_conservative_degradation.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val2}_conservative_degradation.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val2}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val2}_conservative_degradation.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0
freq_i=$((freq_i+1))
cnt_i=0
done
