#!/bin/bash
output_dir=/home/SJ/HotSpot-6.0/graduate
FREQ=("4GHz" "4.1GHz" "4.2GHz" "4.3GHz" "4.4GHz" "4.5GHz" "4.6GHz" "4.7GHz" "4.8GHz" "4.9GHz" "5GHz")
cooling=("aa" "pv" "av" "l")
temp=("310" "320" "330" "340" "350" "360" "370")
BENCHMARK=("gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
cooling_i=0
freq_i=0
bench_i=0
temp_i=0

best=M3D_Best_8High_First
worst=M3D_Worst_8High_First

rm ${output_dir}/temp_result_heon_M3D_Best.txt
rm ${output_dir}/temp_result_heon_M3D_Worst.txt

while [ ${freq_i} -ne 1 ]
do
while [ ${cooling_i} -ne 4 ]
do
while [ ${bench_i} -ne 7 ]
do

awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==30{ print a, b,"1", $2 >> "graduate/temp_result_heon_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==30{ printf "%.0f", ($2)/10 >> "graduate/temp_result_heon_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
echo '0' >> "graduate/temp_result_heon_M3D_Best.txt" 


awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==164{ print a, b,"2", $2 >> "graduate/temp_result_heon_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==164{ printf "%.0f", ($2)/10 >> "graduate/temp_result_heon_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
echo '0' >> "graduate/temp_result_heon_M3D_Best.txt" 


awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==302{ print a, b,"3", $2 >> "graduate/temp_result_heon_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==302{ printf "%.0f", ($2)/10 >> "graduate/temp_result_heon_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
echo '0' >> "graduate/temp_result_heon_M3D_Best.txt" 




awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==30{ print a, b,"1", $2 >> "graduate/temp_result_heon_M3D_Worst.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==30{ printf "%.0f", ($2)/10 >> "graduate/temp_result_heon_M3D_Worst.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
echo '0' >> "graduate/temp_result_heon_M3D_Worst.txt" 


awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==164{ print a, b,"2", $2 >> "graduate/temp_result_heon_M3D_Worst.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==164{ printf "%.0f", ($2)/10 >> "graduate/temp_result_heon_M3D_Worst.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
echo '0' >> "graduate/temp_result_heon_M3D_Worst.txt" 


awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==302{ print a, b,"3", $2 >> "graduate/temp_result_heon_M3D_Worst.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==302{ printf "%.0f", ($2)/10 >> "graduate/temp_result_heon_M3D_Worst.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
echo '0' >> "graduate/temp_result_heon_M3D_Worst.txt" 

#awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==38{ print c, a,"pv",b,$2 >> "graduate/temp_result_heon.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${FREQ[$[freq_i]]}_2D_${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}_${temp[$[temp_i]]}.steady

#awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==38{ print c, a,"av",b,$2 >> "graduate/temp_result_heon.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${FREQ[$[freq_i]]}_2D_${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}_${temp[$[temp_i]]}.steady

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

sed -i 's/410/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/410/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/420/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/420/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/430/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/430/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/440/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/440/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/450/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/450/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/460/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/460/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/470/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/470/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/480/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/480/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/490/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/490/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/500/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/500/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/510/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/510/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/520/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/520/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/530/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/530/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/540/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/540/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/550/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/550/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/560/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/560/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/570/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/570/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/580/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/580/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/590/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/590/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/600/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/600/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/610/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/610/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/620/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/620/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/630/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/630/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/640/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/640/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/650/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/650/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/660/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/660/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/670/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/670/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/680/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/680/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/690/400/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/690/400/g' ${output_dir}/temp_result_heon_M3D_Worst.txt

