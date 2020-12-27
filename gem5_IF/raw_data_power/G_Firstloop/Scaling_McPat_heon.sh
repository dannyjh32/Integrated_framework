#!/bin/bash
Parser_home=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master
McPat_home=/home/SJ/mcpat-master/obj_opt
gem5_dir=/home/SJ/gem5-master/0819_real
Scaling_File_2D=/home/SJ/gem5-master/NewScript/SCALING_McPAT.py
Scaling_File_TSV3D_3=/home/SJ/gem5-master/NewScript/SCALING_McPAT_TSV_3D_3L.py
FREQ=4GHz
BENCHMARK_1=("bzip2" "calculix" "hmmer" "povray" "sjeng")
BENCHMARK_2=("gcc" "lbm" "mcf" "soplex")

SCALING_FACTOR_1=("1.07524" "1.184953" "1.042875" "1.187621" "1.23586")
SCALING_FACTOR_2=("1.203617" "1.282823" "1.146262" "1.051933")
PCIE_SCALING_2=23.59995
PCIE_SCALING_1=23.43191
bench_i=0
COOLING=("320" "330" "340" "350" "360" "370")
while [ ${bench_i} -ne 5 ]
do
	echo "${BENCHMARK[$[bench_i]]} scaling started"
#For 2D
	cooling_i=0
	while [ ${cooling_i} -ne 6 ]
	do
	python ${Scaling_File_2D} ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/power_${COOLING[$[cooling_i]]}_${BENCHMARK_1[$[bench_i]]}_aa_FirstLoop.txt ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/ScaledPower_2D_${BENCHMARK_1[$[bench_i]]}_${COOLING[$[cooling_i]]}_FirstLoop_heon.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1
	cooling_i=$((cooling_i+1))
	done
	echo "${BENCHMARK_1[$[bench_i]]} scaling finished"
	bench_i=$((bench_i+1))

done
bench_i=0
while [ ${bench_i} -ne 4 ]
do
	echo "${BENCHMARK[$[bench_i]]} scaling started"
#For 2D
	cooling_i=0
	while [ ${cooling_i} -ne 6 ]
	do
	python ${Scaling_File_2D} ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/power_${COOLING[$[cooling_i]]}_${BENCHMARK_2[$[bench_i]]}_aa_FirstLoop.txt ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/ScaledPower_2D_${BENCHMARK_2[$[bench_i]]}_${COOLING[$[cooling_i]]}_FirstLoop_heon.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2
	cooling_i=$((cooling_i+1))

	done

	echo "${BENCHMARK_2[$[bench_i]]} scaling finished"
	bench_i=$((bench_i+1))

done
