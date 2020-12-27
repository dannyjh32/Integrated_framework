#!/bin/bash
Parser_home=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master
McPat_home=/home/SJ/mcpat-master/obj_opt
gem5_dir=/home/SJ/gem5-master/Result_SPEC2006
template_dir=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master/template/Thermal
FREQ=4GHz
BENCHMARK_330=("bzip2" "calculix" "hmmer" "povray" "sjeng")
BENCHMARK_320=("gcc" "lbm" "mcf" "soplex")
BENCHMARK=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
BENCHMARK2=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "sjeng" "soplex")
bench_i=0
#Liquid
while [ ${bench_i} -ne 9 ]
do
	echo "hwan ${BENCHMARK[$[bench_i]]}"
	echo "Start Parsing the Gem5 Result"
	cp ${gem5_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/stats.txt ${gem5_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/stats.txt.backup
	sed -i 's/switch_cpus_10/cpu0/g' ${gem5_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/stats.txt
	sed -i 's/switch_cpus_11/cpu1/g' ${gem5_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/stats.txt
	sed -i 's/switch_cpus_12/cpu2/g' ${gem5_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/stats.txt
	sed -i 's/switch_cpus_13/cpu3/g' ${gem5_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/stats.txt
	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ}/${FREQ}/config.json -s ${gem5_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/stats.txt -t ${template_dir}/template_${FREQ}_310.xml -o ${gem5_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/mcpat_input_${BENCHMARK[$[bench_i]]}_l_FirstLoop.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/mcpat_input_${BENCHMARK[$[bench_i]]}_l_FirstLoop.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/${FREQ}/${BENCHMARK[$[bench_i]]}_${FREQ}/power_${BENCHMARK[$[bench_i]]}_l_FirstLoop.txt
	bench_i=$((bench_i+1))
done
bench_i=0

#Active Vapor Chamber
while [ ${bench_i} -ne 8 ]
do
	echo "hwan ${BENCHMARK2[$[bench_i]]}"
	cp $gem5_dir/${FREQ}/${BENCHMARK2[$[bench_i]]}_${FREQ}/power_${BENCHMARK2[$[bench_i]]}_l_FirstLoop.txt $gem5_dir/${FREQ}/${BENCHMARK2[$[bench_i]]}_${FREQ}/power_${BENCHMARK2[$[bench_i]]}_av_FirstLoop.txt

	bench_i=$((bench_i+1))
done
bench_i=0
	#Only Povray is Diffrenet With Liquid Cooling
	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ}/${FREQ}/config.json -s ${gem5_dir}/${FREQ}/povray_${FREQ}/stats.txt -t ${template_dir}/template_${FREQ}_320.xml -o ${gem5_dir}/${FREQ}/povray_${FREQ}/mcpat_input_povray_av_FirstLoop.xml
	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ}/povray_${FREQ}/mcpat_input_povray_av_FirstLoop.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/${FREQ}/povray_${FREQ}/power_povray_av_FirstLoop.txt

#Active Air Cooling
while [ ${bench_i} -ne 5 ]
do
	echo "hwan ${BENCHMARK_330[$[bench_i]]}"
	echo "Start Parsing the Gem5 Result"
	cp ${gem5_dir}/${FREQ}/${BENCHMARK_330[$[bench_i]]}_${FREQ}/stats.txt ${gem5_dir}/${FREQ}/${BENCHMARK_330[$[bench_i]]}_${FREQ}/stats.txt.backup
	sed -i 's/switch_cpus_10/cpu0/g' ${gem5_dir}/${FREQ}/${BENCHMARK_330[$[bench_i]]}_${FREQ}/stats.txt
	sed -i 's/switch_cpus_11/cpu1/g' ${gem5_dir}/${FREQ}/${BENCHMARK_330[$[bench_i]]}_${FREQ}/stats.txt
	sed -i 's/switch_cpus_12/cpu2/g' ${gem5_dir}/${FREQ}/${BENCHMARK_330[$[bench_i]]}_${FREQ}/stats.txt
	sed -i 's/switch_cpus_13/cpu3/g' ${gem5_dir}/${FREQ}/${BENCHMARK_330[$[bench_i]]}_${FREQ}/stats.txt
	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ}/${FREQ}/config.json -s ${gem5_dir}/${FREQ}/${BENCHMARK_330[$[bench_i]]}_${FREQ}/stats.txt -t ${template_dir}/template_${FREQ}_330.xml -o ${gem5_dir}/${FREQ}/${BENCHMARK_330[$[bench_i]]}_${FREQ}/mcpat_input_${BENCHMARK_330[$[bench_i]]}_aa_FirstLoop.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ}/${BENCHMARK_330[$[bench_i]]}_${FREQ}/mcpat_input_${BENCHMARK_330[$[bench_i]]}_aa_FirstLoop.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/${FREQ}/${BENCHMARK_330[$[bench_i]]}_${FREQ}/power_${BENCHMARK_330[$[bench_i]]}_aa_FirstLoop.txt
	bench_i=$((bench_i+1))
done

bench_i=0

while [ ${bench_i} -ne 4 ]
do
	echo "hwan ${BENCHMARK_320[$[bench_i]]}"
	echo "Start Parsing the Gem5 Result"
	cp ${gem5_dir}/${FREQ}/${BENCHMARK_320[$[bench_i]]}_${FREQ}/stats.txt ${gem5_dir}/${FREQ}/${BENCHMARK_320[$[bench_i]]}_${FREQ}/stats.txt.backup
	sed -i 's/switch_cpus_10/cpu0/g' ${gem5_dir}/${FREQ}/${BENCHMARK_320[$[bench_i]]}_${FREQ}/stats.txt
	sed -i 's/switch_cpus_11/cpu1/g' ${gem5_dir}/${FREQ}/${BENCHMARK_320[$[bench_i]]}_${FREQ}/stats.txt
	sed -i 's/switch_cpus_12/cpu2/g' ${gem5_dir}/${FREQ}/${BENCHMARK_320[$[bench_i]]}_${FREQ}/stats.txt
	sed -i 's/switch_cpus_13/cpu3/g' ${gem5_dir}/${FREQ}/${BENCHMARK_320[$[bench_i]]}_${FREQ}/stats.txt
	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ}/${FREQ}/config.json -s ${gem5_dir}/${FREQ}/${BENCHMARK_320[$[bench_i]]}_${FREQ}/stats.txt -t ${template_dir}/template_${FREQ}_320.xml -o ${gem5_dir}/${FREQ}/${BENCHMARK_320[$[bench_i]]}_${FREQ}/mcpat_input_${BENCHMARK_320[$[bench_i]]}_aa_FirstLoop.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ}/${BENCHMARK_320[$[bench_i]]}_${FREQ}/mcpat_input_${BENCHMARK_320[$[bench_i]]}_aa_FirstLoop.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/${FREQ}/${BENCHMARK_320[$[bench_i]]}_${FREQ}/power_${BENCHMARK_320[$[bench_i]]}_aa_FirstLoop.txt
	bench_i=$((bench_i+1))
done
bench_i=0

#Passive Vapor Chamber
while [ ${bench_i} -ne 5 ]
do
	echo "hwan ${BENCHMARK_330[$[bench_i]]}"
	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ}/${FREQ}/config.json -s ${gem5_dir}/${FREQ}/${BENCHMARK_330[$[bench_i]]}_${FREQ}/stats.txt -t ${template_dir}/template_${FREQ}_320.xml -o ${gem5_dir}/${FREQ}/${BENCHMARK_330[$[bench_i]]}_${FREQ}/mcpat_input_${BENCHMARK_330[$[bench_i]]}_pv_FirstLoop.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ}/${BENCHMARK_330[$[bench_i]]}_${FREQ}/mcpat_input_${BENCHMARK_330[$[bench_i]]}_pv_FirstLoop.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/${FREQ}/${BENCHMARK_330[$[bench_i]]}_${FREQ}/power_${BENCHMARK_330[$[bench_i]]}_pv_FirstLoop.txt
	bench_i=$((bench_i+1))
done

bench_i=0

while [ ${bench_i} -ne 4 ]
do
	echo "hwan ${BENCHMARK_320[$[bench_i]]}"
	cp $gem5_dir/${FREQ}/${BENCHMARK_320[$[bench_i]]}_${FREQ}/power_${BENCHMARK_320[$[bench_i]]}_aa_FirstLoop.txt $gem5_dir/${FREQ}/${BENCHMARK_320[$[bench_i]]}_${FREQ}/power_${BENCHMARK_320[$[bench_i]]}_pv_FirstLoop.txt
	bench_i=$((bench_i+1))
done

	cp $gem5_dir/${FREQ}/povray_${FREQ}/power_povray_aa_FirstLoop.txt $gem5_dir/${FREQ}/povray_${FREQ}/power_povray_pv_FirstLoop.txt

