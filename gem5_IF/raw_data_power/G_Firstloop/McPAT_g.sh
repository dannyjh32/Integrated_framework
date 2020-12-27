#!/bin/bash
Parser_home=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master
McPat_home=/home/SJ/mcpat-master/obj_opt
gem5_dir=/home/SJ/gem5-master/heon_result/validation
gem5_dir2=/home/SJ/gem5-master/Result_SPEC2006

template_dir=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master/template/Thermal
FREQ=("4GHz" "4.1GHz" "4.2GHz" "4.3GHz" "4.4GHz" "4.5GHz" "4.6GHz" "4.7GHz" "4.8GHz" "4.9GHz" "5GHz")
BENCHMARK_330=("bzip2" "calculix" "hmmer" "povray" "sjeng")
BENCHMARK_320=("gcc" "lbm" "mcf" "soplex")
BENCHMARK=("lbm" "calculix" "gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
BENCHMARK2=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "sjeng" "soplex")
bench_i=0
freq_i=0
#Liquid

while [ ${freq_i} -ne 1 ]
do


while [ ${bench_i} -ne 1 ]
do
	echo "hwan ${BENCHMARK[$[bench_i]]}"
	echo "Start Parsing the Gem5 Result"
#	cp ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt.backup
	sed -i 's/switch_cpus_10/cpu0/g' ${gem5_dir}/heon32_mcf_4.5GHz/stats.txt
	sed -i 's/switch_cpus_11/cpu1/g' ${gem5_dir}/heon32_mcf_4.5GHz/stats.txt
	sed -i 's/switch_cpus_12/cpu2/g' ${gem5_dir}/heon32_mcf_4.5GHz/stats.txt
	sed -i 's/switch_cpus_13/cpu3/g' ${gem5_dir}/heon32_mcf_4.5GHz/stats.txt
#	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir2}/${FREQ[$[freq_i]]}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir}/heon32_mcf_4.5GHz/stats.txt -t ${template_dir}/template_${FREQ[$[freq_i]]}_350.xml -o ${gem5_dir}/heon32_mcf_4.5GHz/mcpat_input_${BENCHMARK[$[bench_i]]}_350_FirstLoop_heon.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
	$McPat_home/mcpat -infile ${gem5_dir}/heon32_mcf_4.5GHz/mcpat_input_${BENCHMARK[$[bench_i]]}_350_FirstLoop_heon.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/heon32_mcf_4.5GHz/power_${BENCHMARK[$[bench_i]]}_350_FirstLoop_heon.txt

	sed -i 's/switch_cpus_10/cpu0/g' ${gem5_dir}/heon128_mcf_4.5GHz/stats.txt
	sed -i 's/switch_cpus_11/cpu1/g' ${gem5_dir}/heon128_mcf_4.5GHz/stats.txt
	sed -i 's/switch_cpus_12/cpu2/g' ${gem5_dir}/heon128_mcf_4.5GHz/stats.txt
	sed -i 's/switch_cpus_13/cpu3/g' ${gem5_dir}/heon128_mcf_4.5GHz/stats.txt
#	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir2}/${FREQ[$[freq_i]]}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir}/heon128_mcf_4.5GHz/stats.txt -t ${template_dir}/template_${FREQ[$[freq_i]]}_350.xml -o ${gem5_dir}/heon128_mcf_4.5GHz/mcpat_input_${BENCHMARK[$[bench_i]]}_350_FirstLoop_heon.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
#	$McPat_home/mcpat -infile ${gem5_dir}/heon128_mcf_4.5GHz/mcpat_input_${BENCHMARK[$[bench_i]]}_350_FirstLoop_heon.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/heon128_mcf_4.5GHz/power_${BENCHMARK[$[bench_i]]}_350_FirstLoop_heon.txt

	bench_i=$((bench_i+1))
done
bench_i=0
freq_i=$((freq_i+1))
done
