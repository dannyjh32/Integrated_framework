#!/bin/bash
Parser_home=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master
McPat_home=/home/SJ/mcpat-master/obj_opt
gem5_dir=/home/SJ/gem5-master/Result_SPEC2006
Scaling_File_2D=/home/SJ/gem5-master/NewScript/SCALING_McPAT.py
Scaling_File_TSV3D_3=/home/SJ/gem5-master/NewScript/SCALING_McPAT_TSV_3D_3L.py
FREQ=("5.6GHz" "6.8GHz" "5.3GHz" "5.4GHz" "5.5GHz" "5.6GHz" "5.7GHz" "5.8GHz" "5.9GHz" "6GHz" "6.1GHz" "6.2GHz" "6.3GHz" "6.4GHz" "6.5GHz" "6.6GHz" "6.7GHz" "6.8GHz" "6.9GHz" "7GHz" "7.1GHz" "7.2GHz" "7.3GHz" "7.4GHz" "7.5GHz" "7.6GHz" "7.7GHz" "7.8GHz" "7.9GHz" "8GHz")
BENCHMARK_1=("bzip2" "calculix" "hmmer" "povray" "sjeng")
BENCHMARK_2=("gcc" "lbm" "mcf" "soplex")

SCALING_FACTOR_1=("1.07524" "1.184953" "0.965249" "1.161018" "1.214759")
SCALING_FACTOR_2=("1.184953" "1.23082" "1.110465" "1.004897")
PCIE_SCALING_2=23.59995
PCIE_SCALING_1=23.43191
bench_i=0
freq_i=0
COOLING=("310" "320" "330" "340" "350" "360")

while [ ${freq_i} -ne 1 ] #30
do
	bench_i=0
	while [ ${bench_i} -ne 5 ]
	do	
		echo "${BENCHMARK[$[bench_i]]} scaling started"
#For 2D
		cooling_i=0
		while [ ${cooling_i} -ne 6 ]
		do
		python ${Scaling_File_2D} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK_1[$[bench_i]]}_${COOLING[$[cooling_i]]}_FirstLoop_heon.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_1[$[bench_i]]}_${FREQ[$[freq_i]]}/ScaledPower_2D_${BENCHMARK_1[$[bench_i]]}_${COOLING[$[cooling_i]]}_FirstLoop_heon.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1
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
		python ${Scaling_File_2D} ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK_2[$[bench_i]]}_${COOLING[$[cooling_i]]}_FirstLoop_heon.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK_2[$[bench_i]]}_${FREQ[$[freq_i]]}/ScaledPower_2D_${BENCHMARK_2[$[bench_i]]}_${COOLING[$[cooling_i]]}_FirstLoop_heon.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2
		cooling_i=$((cooling_i+1))
		done
	echo "${BENCHMARK_2[$[bench_i]]} scaling finished"
	bench_i=$((bench_i+1))
	done
	freq_i=$((freq_i+1))

done
