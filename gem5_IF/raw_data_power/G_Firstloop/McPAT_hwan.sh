#!/bin/bash
Parser_home=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master
McPat_home=/home/SJ/mcpat-master/obj_opt
gem5_dir=/home/SJ/gem5-master/Result_SPEC2006
template_dir=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master/template/Thermal
FREQ=("3.4GHz" "4.1GHz" "4.2GHz" "4.3GHz" "4.4GHz" "4.5GHz" "4.6GHz" "4.7GHz" "4.8GHz" "4.9GHz" "5GHz")
BENCHMARK_330=("bzip2" "calculix" "hmmer" "povray" "sjeng")
BENCHMARK_320=("gcc" "lbm" "mcf" "soplex")
BENCHMARK=("hmmer" "povray" "sjeng" "soplex")
BENCHMARK2=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "sjeng" "soplex")
bench_i=1
freq_i=0
#Liquid

while [ ${freq_i} -ne 1 ]
do


while [ ${bench_i} -ne 2 ]
do
	echo "hwan ${BENCHMARK[$[bench_i]]}"
	echo "Start Parsing the Gem5 Result"
#	cp ${gem5_dir}/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_2/stats.txt ${gem5_dir}/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_2/stats.txt.backup
	sed -i 's/switch_cpus_10/cpu0/g' ${gem5_dir}/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_2/stats.txt
	sed -i 's/switch_cpus_11/cpu1/g' ${gem5_dir}/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_2/stats.txt
	sed -i 's/switch_cpus_12/cpu2/g' ${gem5_dir}/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_2/stats.txt
	sed -i 's/switch_cpus_13/cpu3/g' ${gem5_dir}/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_2/stats.txt
#	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ[$[freq_i]]}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir}/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_2/stats.txt -t ${template_dir}/template_${FREQ[$[freq_i]]}.xml -o ${gem5_dir}/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_2/mcpat_input_channel_2.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_2/mcpat_input_channel_2.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_2/power_channel_2.txt
#	cp ${gem5_dir}/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_1/stats.txt ${gem5_dir}/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_1/stats.txt.backup
	sed -i 's/switch_cpus_10/cpu0/g' ${gem5_dir}/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_1/stats.txt
	sed -i 's/switch_cpus_11/cpu1/g' ${gem5_dir}/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_1/stats.txt
	sed -i 's/switch_cpus_12/cpu2/g' ${gem5_dir}/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_1/stats.txt
	sed -i 's/switch_cpus_13/cpu3/g' ${gem5_dir}/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_1/stats.txt
	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ[$[freq_i]]}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir}/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_1/stats.txt -t ${template_dir}/template_${FREQ[$[freq_i]]}.xml -o ${gem5_dir}/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_1/mcpat_input_channel_1.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_1/mcpat_input_channel_1.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/${FREQ[$[freq_i]]}/povray_3.4GHz_mem_channel_1/power_channel_1.txt

bench_i=$((bench_i+1))
done
bench_i=0
freq_i=$((freq_i+1))

done

