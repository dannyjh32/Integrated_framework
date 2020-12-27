#!/bin/bash
Parser_home=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master
McPat_home=/home/SJ/mcpat-master/obj_opt
gem5_dir2=/home/SJ/gem5-master/0819_real
Scaling_File_2D=/home/SJ/gem5-master/NewScript/SCALING_McPAT.py
Scaling_File_TSV3D_3=/home/SJ/gem5-master/NewScript/SCALING_McPAT_TSV_3D_3L.py
Leakage_File=/home/SJ/gem5-master/NewScript/Get_Leakage_From_McPAT.py
Dynamic_File=/home/SJ/gem5-master/NewScript/Get_Dynamic_From_McPAT.py

#FREQ=4GHz
FREQ=("3.8GHz" "3GHz" "3.2GHz" "3.2GHz" "3.6GHz" "3.7GHz" "3.9GHz" "4.1GHz" "4.2GHz" "4.6GHz" "4.9GHz" "5.4GHz" "3.5GHz" "3.8GHz" "5.3GHz")

BENCHMARK_1=("bzip2" "calculix" "hmmer" "povray" "sjeng")
BENCHMARK_2=("gcc" "lbm" "mcf" "soplex")

SCALING_FACTOR_1=("1.07524" "1.184953" "0.965249" "1.161018" "1.214759")
SCALING_FACTOR_2=("1.184953" "1.23082" "1.110465" "1.004897")
PCIE_SCALING_2=23.59995
PCIE_SCALING_1=23.43191
bench_i=0
freq_i=0

while [ ${freq_i} -ne 3 ]
do
while [ ${bench_i} -ne 5 ]
do
	echo "${BENCHMARK[$[bench_i]]} scaling started"
	python ${Dynamic_File} ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK_1[$[bench_i]]}_aa_FirstLoop.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_New_ThermalTSV.txt
	echo "${BENCHMARK_1[$[bench_i]]} scaling finished"
	bench_i=$((bench_i+1))

done
bench_i=0
while [ ${bench_i} -ne 4 ]
do
	echo "${BENCHMARK[$[bench_i]]} scaling started"
	python ${Dynamic_File} ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK_2[$[bench_i]]}_aa_FirstLoop.txt ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_New_ThermalTSV.txt
	echo "${BENCHMARK_2[$[bench_i]]} scaling finished"
	bench_i=$((bench_i+1))

done

bench_i=0

freq_i=$((freq_i+1))
done

