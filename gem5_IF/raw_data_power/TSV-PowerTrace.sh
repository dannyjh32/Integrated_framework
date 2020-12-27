#!/bin/bash
HotSpot_dir=/home/SJ/HotSpot-6.0/HWAN
gem5_dir=/home/SJ/gem5-master/0819_real
PowerTrace_File=/home/SJ/gem5-master/NewScript
#FREQ=4.2GHz
FREQ=("3.8GHz" "3GHz" "3.2GHz" "3.2GHz" "3.6GHz" "3.7GHz" "3.9GHz" "4.1GHz" "4.2GHz" "4.6GHz" "4.9GHz" "5.4GHz" "3.5GHz" "3.8GHz" "5.3GHz")
BENCHMARK=("gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
bench_i=0
freq_i=0
#order=First
order=After2
order2=After3

while [ ${freq_i} -ne 1 ]
do
while [ ${bench_i} -ne 7 ]
do
	echo "${BENCHMARK[$[bench_i]]} creating Ptrace started"
	mkdir ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}
	python ${PowerTrace_File}/PowerTrace_3D_3L.py ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/aa_Scaled_M3D_${BENCHMARK[$[bench_i]]}_New_ThermalTSV_${order}.txt ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/aa_TSV_8High_${order2}.ptrace
	python ${PowerTrace_File}/PowerTrace_3D_3L.py ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/pv_Scaled_M3D_${BENCHMARK[$[bench_i]]}_New_ThermalTSV_${order}.txt ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/pv_TSV_8High_${order2}.ptrace
	python ${PowerTrace_File}/PowerTrace_3D_3L.py ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/av_Scaled_M3D_${BENCHMARK[$[bench_i]]}_New_ThermalTSV_${order}.txt ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/av_TSV_8High_${order2}.ptrace
	python ${PowerTrace_File}/PowerTrace_3D_3L.py ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/l_Scaled_M3D_${BENCHMARK[$[bench_i]]}_New_ThermalTSV_${order}.txt ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/l_TSV_8High_${order2}.ptrace

#	python ${PowerTrace_File}/PowerTrace_3D_3L.py ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/ScaledPower_M3D_3L_${BENCHMARK[$[bench_i]]}_New_ThermalTSV.txt ${HotSpot_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}/M3D_3L_New_ThermalTSV.ptrace

	echo "${BENCHMARK[$[bench_i]]} creating Ptrace finished"
	bench_i=$((bench_i+1))
done

bench_i=0

freq_i=$((freq_i+1))
bench_i=0

done
