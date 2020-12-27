#!/bin/bash
output_dir=/home/SJ/HotSpot-6.0/HWAN
FREQ=("4.7GHz" "4.2GHz" "5.3GHz" "3.2GHz" "3.6GHz" "3.7GHz" "3.9GHz" "4.1GHz" "4.2GHz" "4.6GHz" "4.9GHz" "5.4GHz" "3.5GHz" "3.8GHz" "5.3GHz")
cooling=("aa" "pv" "av" "l")
temp=("310" "320" "330" "340" "350" "360" "370")
BENCHMARK=("gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
cooling_i=0

freq_i=0

bench_i=0
temp_i=0

best=M3D_Best_8High_After2
worst=M3D_Worst_8High_First

cp ${output_dir}/temp_result_heon_M3D_Best.txt ${output_dir}/temp_result_heon_M3D_Best.txt.backup
cp ${output_dir}/temp_result_heon_M3D_Worst.txt ${output_dir}/temp_result_heon_M3D_Worst.txt.backup
rm ${output_dir}/temp_result_heon_M3D_Worst.txt
rm ${output_dir}/temp_result_heon_M3D_Best.txt
freq_i=0
while [ ${freq_i} -ne 1 ]
do
cooling_i=0
while [ ${cooling_i} -ne 4 ]
do
bench_i=0
while [ ${bench_i} -ne 7 ]
do

awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==2{ print a, b,"1", $2 >> "temp_result_heon_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==2{ printf "%.0f", ($2)/10 >> "temp_result_heon_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
echo '0' >> "temp_result_heon_M3D_Best.txt" 


awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==8{ print a, b,"2", $2 >> "temp_result_heon_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==8{ printf "%.0f", ($2)/10 >> "temp_result_heon_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
echo '0' >> "temp_result_heon_M3D_Best.txt" 


awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==14{ print a, b,"3", $2 >> "temp_result_heon_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==14{ printf "%.0f", ($2)/10 >> "temp_result_heon_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
echo '0' >> "temp_result_heon_M3D_Best.txt" 




awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==2{ print a, b,"1", $2 >> "temp_result_heon_M3D_Worst.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==2{ printf "%.0f", ($2)/10 >> "temp_result_heon_M3D_Worst.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
echo '0' >> "temp_result_heon_M3D_Worst.txt" 


awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==8{ print a, b,"2", $2 >> "temp_result_heon_M3D_Worst.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==8{ printf "%.0f", ($2)/10 >> "temp_result_heon_M3D_Worst.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
echo '0' >> "temp_result_heon_M3D_Worst.txt" 


awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==14{ print a, b,"3", $2 >> "temp_result_heon_M3D_Worst.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==14{ printf "%.0f", ($2)/10 >> "temp_result_heon_M3D_Worst.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
echo '0' >> "temp_result_heon_M3D_Worst.txt" 

#awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==38{ print c, a,"pv",b,$2 >> "WAN/temp_result_heon.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${FREQ[$[freq_i]]}_2D_${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}_${temp[$[temp_i]]}.steady

#awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==38{ print c, a,"av",b,$2 >> "HWAN/temp_result_heon.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${FREQ[$[freq_i]]}_2D_${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}_${temp[$[temp_i]]}.steady

bench_i=$((bench_i+1))
done
bench_i=0
cooling_i=$((cooling_i+1))
done
cooling_i=0
freq_i=$((freq_i+1))
done

sed -i 's/n/m/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/n/m/g' ${output_dir}/temp_result_heon_M3D_Worst.txt

sed -i 's/310/320/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/310/320/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/300/320/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/300/320/g' ${output_dir}/temp_result_heon_M3D_Worst.txt

sed -i 's/400/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/400/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/390/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/390/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/380/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/380/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt

sed -i 's/410/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/410/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/420/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/420/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/430/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/430/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/440/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/440/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/450/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/450/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/460/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/460/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/470/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/470/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/480/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/480/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/490/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/490/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/500/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/500/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/510/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/510/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/520/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/520/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/530/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/530/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/540/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/540/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/550/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/550/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/560/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/560/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/570/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/570/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/580/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/580/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/590/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/590/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/600/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/600/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/610/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/610/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/620/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/620/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/630/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/630/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/640/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/640/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/650/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/650/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/660/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/660/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/670/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/670/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/680/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/680/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/690/370/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/690/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt

