#!/bin/bash
output_dir=/home/SJ/HotSpot-6.0/graduate_correct
FREQ=("5GHz")
FREQ2=("4.1GHz" "3.9GHz")
FREQ3=("3.6GHz" "3.8GHz" "3.3GHz" "3.5GHz" "3.9GHz" "3GHz" "3.2GHz" "3.7GHz")

cooling=("aa" "pv" "av" "l")
temp=("310" "320" "330" "340" "350" "360" "370")
BENCHMARK=("gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
cooling_i=0

freq_i=0
freq_i2=0
freq_i3=0

bench_i=0
temp_i=0

best=M3D_Best_8High_After3
worst=M3D_Worst_8High_After3
tsv=TSV_8High_After3

rm ${output_dir}/temp_result_heon_M3D_Best.txt
rm ${output_dir}/temp_result_heon_M3D_Worst.txt
rm ${output_dir}/temp_result_heon_TSV.txt

while [ ${cooling_i} -ne 4 ]
do
while [ ${bench_i} -ne 7 ]
do


while [ ${freq_i} -ne 1 ]
do
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==30{ print a, b,"1", $2, c >> "graduate_correct/temp_result_heon_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==30{ printf "%.0f", ($2)/10 >> "graduate_correct/temp_result_heon_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
echo '0' >> "graduate_correct/temp_result_heon_M3D_Best.txt" 


awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==164{ print a, b,"2", $2, c >> "graduate_correct/temp_result_heon_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==164{ printf "%.0f", ($2)/10 >> "graduate_correct/temp_result_heon_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
echo '0' >> "graduate_correct/temp_result_heon_M3D_Best.txt" 


awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==302{ print a, b,"3", $2, c >> "graduate_correct/temp_result_heon_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==302{ printf "%.0f", ($2)/10 >> "graduate_correct/temp_result_heon_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
echo '0' >> "graduate_correct/temp_result_heon_M3D_Best.txt" 
freq_i=$((freq_i+1))
done
freq_i=0



while [ ${freq_i2} -ne 2 ]
do

awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ2[$[freq_i2]]}" 'NR==30{ print a, b,"1", $2, c >> "graduate_correct/temp_result_heon_M3D_Worst.txt" }' ${output_dir}/${FREQ2[$[freq_i2]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ2[$[freq_i2]]}" 'NR==30{ printf "%.0f", ($2)/10 >> "graduate_correct/temp_result_heon_M3D_Worst.txt" }' ${output_dir}/${FREQ2[$[freq_i2]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
echo '0' >> "graduate_correct/temp_result_heon_M3D_Worst.txt" 


awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ2[$[freq_i2]]}" 'NR==164{ print a, b,"2", $2, c >> "graduate_correct/temp_result_heon_M3D_Worst.txt" }' ${output_dir}/${FREQ2[$[freq_i2]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ2[$[freq_i2]]}" 'NR==164{ printf "%.0f", ($2)/10 >> "graduate_correct/temp_result_heon_M3D_Worst.txt" }' ${output_dir}/${FREQ2[$[freq_i2]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
echo '0' >> "graduate_correct/temp_result_heon_M3D_Worst.txt" 


awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ2[$[freq_i2]]}" 'NR==302{ print a, b,"3", $2, c >> "graduate_correct/temp_result_heon_M3D_Worst.txt" }' ${output_dir}/${FREQ2[$[freq_i2]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ2[$[freq_i2]]}" 'NR==302{ printf "%.0f", ($2)/10 >> "graduate_correct/temp_result_heon_M3D_Worst.txt" }' ${output_dir}/${FREQ2[$[freq_i2]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
echo '0' >> "graduate_correct/temp_result_heon_M3D_Worst.txt" 
freq_i2=$((freq_i2+1))
done
freq_i2=0




while [ ${freq_i3} -ne 8 ]
do

awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ3[$[freq_i3]]}" 'NR==30{ print a, b,"1", $2, c >> "graduate_correct/temp_result_heon_TSV.txt" }' ${output_dir}/${FREQ3[$[freq_i3]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${tsv}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ3[$[freq_i3]]}" 'NR==30{ printf "%.0f", ($2)/10 >> "graduate_correct/temp_result_heon_TSV.txt" }' ${output_dir}/${FREQ3[$[freq_i3]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${tsv}.steady
echo '0' >> "graduate_correct/temp_result_heon_TSV.txt" 


awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ3[$[freq_i3]]}" 'NR==164{ print a, b,"2", $2, c >> "graduate_correct/temp_result_heon_TSV.txt" }' ${output_dir}/${FREQ3[$[freq_i3]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${tsv}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ3[$[freq_i3]]}" 'NR==164{ printf "%.0f", ($2)/10 >> "graduate_correct/temp_result_heon_TSV.txt" }' ${output_dir}/${FREQ3[$[freq_i3]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${tsv}.steady
echo '0' >> "graduate_correct/temp_result_heon_TSV.txt" 


awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ3[$[freq_i3]]}" 'NR==302{ print a, b,"3", $2, c >> "graduate_correct/temp_result_heon_TSV.txt" }' ${output_dir}/${FREQ3[$[freq_i3]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${tsv}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ3[$[freq_i3]]}" 'NR==302{ printf "%.0f", ($2)/10 >> "graduate_correct/temp_result_heon_TSV.txt" }' ${output_dir}/${FREQ3[$[freq_i3]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${tsv}.steady
echo '0' >> "graduate_correct/temp_result_heon_TSV.txt" 
freq_i3=$((freq_i3+1))
done
freq_i3=0



#awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==38{ print c, a,"pv",b,$2 >> "graduate_correct/temp_result_heon.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${FREQ[$[freq_i]]}_2D_${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}_${temp[$[temp_i]]}.steady

#awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==38{ print c, a,"av",b,$2 >> "graduate_correct/temp_result_heon.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${FREQ[$[freq_i]]}_2D_${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}_${temp[$[temp_i]]}.steady

bench_i=$((bench_i+1))
done
bench_i=0
cooling_i=$((cooling_i+1))
done
cooling_i=0

sed -i 's/n/m/g' ${output_dir}/temp_result_heon_M3D_Best.txt
sed -i 's/n/m/g' ${output_dir}/temp_result_heon_M3D_Worst.txt

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





sed -i 's/n/m/g' ${output_dir}/temp_result_heon_TSV.txt

sed -i 's/400/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/400/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/390/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/390/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/380/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/380/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt

sed -i 's/410/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/410/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/420/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/420/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/430/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/430/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/440/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/440/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/450/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/450/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/460/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/460/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/470/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/470/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/480/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/480/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/490/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/490/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/500/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/500/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/510/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/510/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/520/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/520/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/530/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/530/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/540/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/540/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/550/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/550/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/560/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/560/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/570/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/570/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/580/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/580/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/590/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/590/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/600/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/600/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/610/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/610/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/620/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/620/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/630/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/630/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/640/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/640/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/650/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/650/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/660/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/660/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/670/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/670/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/680/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/680/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt
sed -i 's/690/370/g' ${output_dir}/temp_result_heon_TSV.txt
sed -i 's/690/370/g' ${output_dir}/temp_result_heon_M3D_Worst.txt

