#!/bin/bash
gem5_base= #your_gem5_IF_directory

gem5_dir=${gem5_base}/output
Leakage_File=${gem5_base}/example_template/Get_Leakage_From_McPAT.py

FREQ=("4GHz")
BENCHMARK=("gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")

bench_i=0
freq_i=0

order=zero

val=330

while [ ${freq_i} -ne 1 ]
do
#For M3D_Best
while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_M3D_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_aggressive.txt

bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_M3D_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_aggressive.txt
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_M3D_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_aggressive.txt
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_M3D_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_aggressive_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_aggressive.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_aggressive.txt
bench_i=$((bench_i+1))
done
bench_i=0

#For_M3D_Worst
while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_M3D_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_conservative_degradation.txt
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_M3D_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_conservative_degradation.txt
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_M3D_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_conservative_degradation.txt
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_M3D_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_conservative_degradation.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}_conservative_degradation.txt
bench_i=$((bench_i+1))
done
bench_i=0

#For_TSV-3D
while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_LekagePower_TSV_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}.txt
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_LekagePower_TSV_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}.txt
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_LekagePower_TSV_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}.txt
bench_i=$((bench_i+1))
done
bench_i=0

while [ ${bench_i} -ne 7 ]
do
python ${Leakage_File} ${gem5_dir}/${FREQ[$[freq_i]]}/power_povray_Leakage_${val}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_LekagePower_TSV_3L_${BENCHMARK[$[bench_i]]}_New_Thermal_${order}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}.txt ${gem5_dir}/${FREQ[$[freq_i]]}/power_core_Leakage_${val}.txt
bench_i=$((bench_i+1))
done
bench_i=0
freq_i=$((freq_i+1))
done
