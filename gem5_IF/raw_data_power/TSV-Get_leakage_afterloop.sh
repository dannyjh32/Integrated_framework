#!/bin/bash
Parser_home=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master
McPat_home=/home/SJ/mcpat-master/obj_opt
gem5_dir=/home/SJ/gem5-master/0819_real
gem5_dir2=/home/SJ/gem5-master/0819_real

hot_dir=/home/SJ/HotSpot-6.0/HWAN
Scaling_File_2D=/home/SJ/gem5-master/NewScript/SCALING_McPAT.py
Scaling_File_M3D_3=/home/SJ/gem5-master/NewScript/SCALING_McPAT_TSV_3D_3L.py
Leakage_File=/home/SJ/gem5-master/NewScript/Get_Leakage_From_McPAT.py
FREQ=("3.8GHz" "4.2GHz" "3GHz" "3.2GHz" "3.6GHz" "3.7GHz" "3.9GHz" "4.1GHz" "4.2GHz" "4.6GHz" "4.9GHz" "5.4GHz" "3.5GHz" "3.8GHz" "5.3GHz")
BENCHMARK=("gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
bench_i=0
cnt_i=0
freq_i=0
#Active Air Cooling

#order=First
order=After2

val=()
val2=()

filepath1=${hot_dir}/temp_result_heon_TSV.txt

IFS_backup="$IFS"
IFS='\n'

while read line
do
	val+=($line)
done < $filepath1

IFS="$IFS_backup"
freq_i=0
while [ ${freq_i} -ne 1 ]
do
bench_i=0
while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val[${cnt_i}+1]}.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_ThermalTSV_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val[${cnt_i}+3]}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val[${cnt_i}+5]}.txt

cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val[${cnt_i}+1]}.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_ThermalTSV_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val[${cnt_i}+3]}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val[${cnt_i}+5]}.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val[${cnt_i}+1]}.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_ThermalTSV_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val[${cnt_i}+3]}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val[${cnt_i}+5]}.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val[${cnt_i}+1]}.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_M3D_2L_${BENCHMARK[$[bench_i]]}_New_ThermalTSV_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val[${cnt_i}+3]}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val[${cnt_i}+5]}.txt
cnt_i=$((cnt_i+6))
bench_i=$((bench_i+1))
done
bench_i=0
freq_i=$((freq_i+1))
done
