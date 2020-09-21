#!/bin/bash
output_dir=/home/SJ/HotSpot-6.0_hwan/supercom
config_dir=/home/SJ/HotSpot-6.0_hwan/config
hotspot_home=/home/SJ/HotSpot-6.0_hwan
FREQ=5GHz
cooling=("aa" "pv" "av" "l")
temp=("310" "320" "330" "340" "350" "360")
BENCHMARK=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
bench_i=0
temp_i=0


while [ ${bench_i} -ne 9 ]
do
while [ ${temp_i} -ne 6 ]
do

echo ${BENCHMARK[$[bench_i]]}_aa_${temp[$[temp_i]]}  >> "temp_result_heon.txt" 
awk -v a="${BENCHMARK[$[bench_i]]}_aa_${temp[$[temp_i]]}" 'NR==3{ print a,$2 >> "temp_result_heon.txt" }' ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_aa_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal_${temp[$[temp_i]]}.steady
echo ${BENCHMARK[$[bench_i]]}_l_${temp[$[temp_i]]}  >> "temp_result_heon.txt" 
awk 'NR==3{ print $2 >> "temp_result_heon.txt" }' ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_l_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal_${temp[$[temp_i]]}.steady
echo ${BENCHMARK[$[bench_i]]}_pv_${temp[$[temp_i]]}  >> "temp_result_heon.txt" 
awk 'NR==3{ print $2 >> "temp_result_heon.txt" }' ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_pv_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal_${temp[$[temp_i]]}.steady
echo ${BENCHMARK[$[bench_i]]}_av_${temp[$[temp_i]]}  >> "temp_result_heon.txt" 
awk 'NR==3{ print $2 >> "temp_result_heon.txt" }' ${output_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}/cpu_av_2D_${BENCHMARK[$[bench_i]]}_${FREQ}_Thermal_${temp[$[temp_i]]}.steady

echo $string
temp_i=$((temp_i+1))
done
temp_i=0
bench_i=$((bench_i+1))
done



