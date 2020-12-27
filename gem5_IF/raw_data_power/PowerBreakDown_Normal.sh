#!/bin/bash
Parser_home=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master
McPat_home=/home/SJ/mcpat-master/obj_opt
gem5_dir=/home/SJ/gem5-master/Result_SPEC2006
Scaling_File_3D_2L=/home/SJ/gem5-master/NewScript/PowerBreakDown.py
FREQ=4GHz
BENCHMARK_1=("bzip2" "calculix" "hmmer" "povray" "sjeng")
BENCHMARK_2=("gcc" "lbm" "mcf" "soplex")

SCALING_FACTOR_1=("1.07524" "1.184953" "0.965249" "1.161018" "1.214759")
SCALING_FACTOR_2=("1.184953" "1.23082" "1.110465" "1.004897")
PCIE_SCALING_2=23.59995
PCIE_SCALING_1=23.43191
bench_i=0

while [ ${bench_i} -ne 5 ]
do
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_1[$[bench_i]]}_Additional.txt ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/LeakagePower_TSV3D_2L_${BENCHMARK_1[$[bench_i]]}_Additional.txt ${SCALING_FACTOR_1[$[bench_i]]} $PCIE_SCALING_1 ${gem5_dir}/${FREQ}/${BENCHMARK_1[$[bench_i]]}_${FREQ}/BreakDown_TSV-3D_${BENCHMARK_1[$[bench_i]]}_Additional.txt
	bench_i=$((bench_i+1))

done

bench_i=0

while [ ${bench_i} -ne 4 ]
do
	python ${Scaling_File_3D_2L} ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/DynamicPower_3D_${BENCHMARK_2[$[bench_i]]}_Additional.txt ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/aa_Scaled_LekagePower_TSV3D_2L_${BENCHMARK_2[$[bench_i]]}_Additional.txt ${SCALING_FACTOR_2[$[bench_i]]} $PCIE_SCALING_2 ${gem5_dir}/${FREQ}/${BENCHMARK_2[$[bench_i]]}_${FREQ}/aa_BreakDown_TSV-3D_${BENCHMARK_2[$[bench_i]]}_Additional.txt
	bench_i=$((bench_i+1))

done
