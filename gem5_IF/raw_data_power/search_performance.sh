#!/bin/bash
output_dir=/home/SJ/gem5-master/move2
#FREQ=("5.4GHz" "4.2GHz" "4GHz")
cooling=("aa" "pv" "av" "l")
temp=("310" "320" "330" "340" "350" "360" "370")
BENCHMARK=("gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
cooling_i=0
FREQ=("2.9GHz" "3GHz" "3.1GHz" "3.2GHz" "3.3GHz" "3.4GHz" "3.5GHz" "3.6GHz" "3.7GHz" "3.8GHz" "3.9GHz" "4GHz" "4.1GHz" "4.2GHz" "4.3GHz" "4.4GHz" "4.5GHz" "4.6GHz" "4.7GHz" "4.8GHz" "4.9GHz" "5GHz" "5.1GHz" "5.2GHz" "5.3GHz" "5.4GHz")

freq_i=0
freq_i2=1
freq_i3=2

bench_i=0
temp_i=0

best=M3D_Best_8High_After4
worst=M3D_Worst_8High_After4
tsv=TSV_8High_After4

rm summary_performance.txt 


while [ ${freq_i} -ne 26 ]
do
while [ ${bench_i} -ne 7 ]
do

awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==4{ print c, a, $2 >> "summary_performance.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt

#awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==9{ print "Worst",c, a, b, $4 >> "summary.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/${cooling[$[cooling_i]]}_Scaled_M3D_${BENCHMARK[$[bench_i]]}_New_Thermal_conservative_degradation_After2.txt

#awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==9{ print "TSV",c, a, b, $4 >> "summary.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/${cooling[$[cooling_i]]}_Scaled_M3D_${BENCHMARK[$[bench_i]]}_New_Thermal_After2.txt

bench_i=$((bench_i+1))

done
bench_i=0
freq_i=$((freq_i+1))
done
freq_i=0 


