#!/bin/bash
hot_base= #your_hotspot_IF_directory

output_dir=${hot_base}/output
FREQ=("4GHz")
cooling=("aa" "pv" "av" "l")
temp=("320" "330" "340" "350" "360" "370")
BENCHMARK=("gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")

cooling_i=0
freq_i=0
bench_i=0

best=M3D_Best_zero
worst=M3D_Worst_zero
tsv=TSV_zero

rm ${hot_base}/temp_result_M3D_Worst.txt
rm ${hot_base}/temp_result_M3D_Best.txt
rm ${hot_base}/temp_result_TSV.txt


freq_i=0
while [ ${freq_i} -ne 1 ]
do
cooling_i=0
while [ ${cooling_i} -ne 4 ]
do
bench_i=0
while [ ${bench_i} -ne 7 ]
do

awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==2{ print a, b,"1", $2 >> "temp_result_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==2{ printf "%.0f", ($2)/10 >> "temp_result_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
echo '0' >> "temp_result_M3D_Best.txt" 

awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==8{ print a, b,"2", $2 >> "temp_result_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==8{ printf "%.0f", ($2)/10 >> "temp_result_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
echo '0' >> "temp_result_M3D_Best.txt" 

awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==14{ print a, b,"3", $2 >> "temp_result_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==14{ printf "%.0f", ($2)/10 >> "temp_result_M3D_Best.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${best}.steady
echo '0' >> "temp_result_M3D_Best.txt" 




awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==2{ print a, b,"1", $2 >> "temp_result_M3D_Worst.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==2{ printf "%.0f", ($2)/10 >> "temp_result_M3D_Worst.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
echo '0' >> "temp_result_M3D_Worst.txt" 

awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==8{ print a, b,"2", $2 >> "temp_result_M3D_Worst.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==8{ printf "%.0f", ($2)/10 >> "temp_result_M3D_Worst.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
echo '0' >> "temp_result_M3D_Worst.txt" 

awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==14{ print a, b,"3", $2 >> "temp_result_M3D_Worst.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==14{ printf "%.0f", ($2)/10 >> "temp_result_M3D_Worst.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${worst}.steady
echo '0' >> "temp_result_M3D_Worst.txt" 



awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==2{ print a, b,"1", $2 >> "temp_result_TSV.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${tsv}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==2{ printf "%.0f", ($2)/10 >> "temp_result_TSV.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${tsv}.steady
echo '0' >> "temp_result_TSV.txt" 

awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==8{ print a, b,"2", $2 >> "temp_result_TSV.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${tsv}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==8{ printf "%.0f", ($2)/10 >> "temp_result_TSV.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${tsv}.steady
echo '0' >> "temp_result_TSV.txt" 

awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==14{ print a, b,"3", $2 >> "temp_result_TSV.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${tsv}.steady
awk -v a="${BENCHMARK[$[bench_i]]}" -v b="${cooling[$[cooling_i]]}" -v c="${FREQ[$[freq_i]]}" 'NR==14{ printf "%.0f", ($2)/10 >> "temp_result_TSV.txt" }' ${output_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/${cooling[$[cooling_i]]}_${tsv}.steady
echo '0' >> "temp_result_TSV.txt" 

bench_i=$((bench_i+1))
done
bench_i=0
cooling_i=$((cooling_i+1))
done
cooling_i=0
freq_i=$((freq_i+1))
done

sed -i 's/n/m/g' temp_result_M3D_Best.txt
sed -i 's/n/m/g' temp_result_M3D_Worst.txt
sed -i 's/n/m/g' temp_result_M3D_Best.txt


