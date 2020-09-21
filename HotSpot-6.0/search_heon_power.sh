#!/bin/bash
output_dir=/home/SJ/HotSpot-6.0_hwan/supercom
config_dir=/home/SJ/HotSpot-6.0_hwan/config
hotspot_home=/home/SJ/HotSpot-6.0_hwan
FREQ=("4GHz" "4.1GHz" "4.2GHz" "4.3GHz" "4.4GHz" "4.5GHz" "4.6GHz" "4.7GHz" "4.8GHz" "4.9GHz" "5GHz")
cooling=("aa" "pv" "av" "l")
temp=("310" "320" "330" "340" "350" "360")
BENCHMARK=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
freq_i=0
bench_i=0
temp_i=0

while [ ${freq_i} -ne 11 ]
do
while [ ${bench_i} -ne 9 ]
do
while [ ${temp_i} -ne 6 ]
do

awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${temp[$[temp_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==2{ for (i=1; i<=NF; i++) total += $i}; END {print c, a,"aa",b,total >> "power_result_heon_lbm.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${temp[$[temp_i]]}_2D_heon.ptrace
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${temp[$[temp_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==2{ for (i=1; i<=NF; i++) total += $i}; END {print c, a,"l",b,total >> "power_result_heon_lbm.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${temp[$[temp_i]]}_2D_heon.ptrace

awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${temp[$[temp_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==2{ for (i=1; i<=NF; i++) total += $i}; END {print c, a,"av",b,total >> "power_result_heon_lbm.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${temp[$[temp_i]]}_2D_heon.ptrace

awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${temp[$[temp_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==2{ for (i=1; i<=NF; i++) total += $i}; END {print c, a,"pv",b,total >> "power_result_heon_lbm.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${temp[$[temp_i]]}_2D_heon.ptrace


temp_i=$((temp_i+1))
done
temp_i=0
bench_i=$((bench_i+1))
done
bench_i=0
freq_i=$((freq_i+1))
done


