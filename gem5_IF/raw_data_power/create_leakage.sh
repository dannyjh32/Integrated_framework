#!/bin/bash
Parser_home=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master
McPat_home=/home/SJ/mcpat-master/obj_opt
McPat_leakage=/home/SJ/mcpat-leakage/obj_opt
gem5_dir=/home/SJ/gem5-master/0819_real
gem5_dir2=/home/SJ/gem5-master/0819_real

template_dir=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master/template/M3D_heon_dualchannel
#template_dir=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master/template/Thermal_heon_dualchannel
#FREQ=("3.4GHz" "3.5GHz" "3.6GHz" "3.7GHz" "3.8GHz" "3.9GHz" "4GHz" "4.1GHz" "4.2GHz" "4.3GHz" "4.4GHz" "4.5GHz" "4.6GHz" "4.7GHz" "4.8GHz" "4.9GHz" "5GHz" "5.1GHz" "5.2GHz" "5.3GHz" "5.4GHz")
FREQ=("4.3GHz" "4.4GHz" "4.5GHz" "5GHz" "5.1GHz" "5.2GHz" "5.3GHz")

BENCHMARK=povray
TEMP=("320" "330" "340" "350" "360" "370")
bench_i=0
freq_i=0

while [ ${freq_i} -ne 7 ] #21
do

while [ ${bench_i} -ne 6 ] #6
do
	echo "Start Parsing the Gem5 Result"
#For Others
python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir}/${FREQ[$[freq_i]]}/stats.txt -t ${template_dir}/template_${FREQ[$[freq_i]]}_aggressive_${TEMP[$[bench_i]]}.xml -o ${gem5_dir2}/${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK}_Leakage_aggressive_${TEMP[$[bench_i]]}.xml
python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir}/${FREQ[$[freq_i]]}/stats.txt -t ${template_dir}/template_${FREQ[$[freq_i]]}_aggressive_${TEMP[$[bench_i]]}.xml -o ${gem5_dir2}/${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK}_core_Leakage_aggressive_${TEMP[$[bench_i]]}.xml
#python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir}/${FREQ[$[freq_i]]}/stats.txt -t ${template_dir}/template_${FREQ[$[freq_i]]}_conservative_degradation_${TEMP[$[bench_i]]}.xml -o ${gem5_dir2}/${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK}_Leakage_conservative_degradation_${TEMP[$[bench_i]]}.xml
#python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir}/${FREQ[$[freq_i]]}/stats.txt -t ${template_dir}/template_${FREQ[$[freq_i]]}_conservative_degradation_${TEMP[$[bench_i]]}.xml -o ${gem5_dir2}/${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK}_core_Leakage_conservative_degradation_${TEMP[$[bench_i]]}.xml

#For Others
	$McPat_home/mcpat -infile ${gem5_dir2}/${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK}_Leakage_aggressive_${TEMP[$[bench_i]]}.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir2/${FREQ[$[freq_i]]}/power_${BENCHMARK}_Leakage_${TEMP[$[bench_i]]}_aggressive.txt
#FOr Core
	$McPat_leakage/mcpat -infile ${gem5_dir2}/${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK}_core_Leakage_aggressive_${TEMP[$[bench_i]]}.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir2/${FREQ[$[freq_i]]}/power_core_Leakage_${TEMP[$[bench_i]]}_aggressive.txt
#	$McPat_home/mcpat -infile ${gem5_dir2}/${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK}_Leakage_conservative_degradation_${TEMP[$[bench_i]]}.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir2/${FREQ[$[freq_i]]}/power_${BENCHMARK}_Leakage_${TEMP[$[bench_i]]}_conservative_degradation.txt
#FOr Core
#	$McPat_leakage/mcpat -infile ${gem5_dir2}/${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK}_core_Leakage_conservative_degradation_${TEMP[$[bench_i]]}.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir2/${FREQ[$[freq_i]]}/power_core_Leakage_${TEMP[$[bench_i]]}_conservative_degradation.txt

	bench_i=$((bench_i+1))
done
	bench_i=0
	freq_i=$((freq_i+1))
done
	bench_i=0
	freq_i=0



"""
while [ ${freq_i} -ne 1 ] #21
do

while [ ${bench_i} -ne 6 ] #6
do
	echo "Start Parsing the Gem5 Result"
#For Others
python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir}/${FREQ[$[freq_i]]}/stats.txt -t ${template_dir}/template_${FREQ[$[freq_i]]}_${TEMP[$[bench_i]]}.xml -o ${gem5_dir2}/${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK}_Leakage_${TEMP[$[bench_i]]}.xml
python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir}/${FREQ[$[freq_i]]}/stats.txt -t ${template_dir}/template_${FREQ[$[freq_i]]}_${TEMP[$[bench_i]]}.xml -o ${gem5_dir2}/${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK}_core_Leakage_${TEMP[$[bench_i]]}.xml

#For Others
	$McPat_home/mcpat -infile ${gem5_dir2}/${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK}_Leakage_${TEMP[$[bench_i]]}.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir2/${FREQ[$[freq_i]]}/power_${BENCHMARK}_Leakage_${TEMP[$[bench_i]]}.txt
#FOr Core
	$McPat_leakage/mcpat -infile ${gem5_dir2}/${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK}_core_Leakage_${TEMP[$[bench_i]]}.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir2/${FREQ[$[freq_i]]}/power_core_Leakage_${TEMP[$[bench_i]]}.txt

	bench_i=$((bench_i+1))
done
	bench_i=0
	freq_i=$((freq_i+1))
done
"""
