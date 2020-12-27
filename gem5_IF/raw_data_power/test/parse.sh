#!/bin/bash
Parser_home=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master
McPat_home=/home/SJ/mcpat-master/obj_opt
McPat_leakage=/home/SJ/mcpat-leakage/obj_opt
gem5_dir=/home/SJ/gem5-master/0819_real
gem5_dir2=/home/SJ/gem5-master/0819_real/test
gem5_dir3=/home/SJ/gem5-master/move2


M3D_template_dir=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master/template/M3D_heon_dualchannel
template_dir=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master/template/Thermal_heon_dualchannel
#FREQ=4GHz
FREQ=("5.4GHz" "3.5GHz" "3.9GHz" "4.2GHz" "5GHz" "5.3GHz" "5.4GHz" "3.9GHz" "4.1GHz" "4.2GHz" "4.6GHz" "4.9GHz" "5GHz" "5.3GHz" "5.4GHz")
#FREQ=("3.4GHz" "3.5GHz" "3.6GHz" "3.7GHz" "3.8GHz" "3.9GHz" "4GHz" "4.1GHz" "4.2GHz" "4.3GHz" "4.4GHz" "4.5GHz" "4.6GHz" "4.7GHz" "4.8GHz" "4.9GHz" "5GHz" "5.1GHz" "5.2GHz" "5.3GHz" "5.4GHz")

BENCHMARK=("povray" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
#BENCHMARK=("bzip2" "hmmer" "lbm" "mcf" "sjeng" "soplex")
#BENCHMARK=("gcc" "povray")
#BENCHMARK=("lbm")

#BENCHMARK=bzip2
#TEMP=330
TEMP=("360" "320" "340" "350" "360" "370")


bench_i=0
freq_i=0
temp_i=0
"""
while [ ${freq_i} -ne 1 ] #15
do

while [ ${bench_i} -ne 5 ] #7
do
	echo "Start Parsing the Gem5 Result"
	cp ${gem5_dir3}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt ${gem5_dir3}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt.backup
   sed -i 's/switch_cpus_10/cpu0/g' ${gem5_dir3}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
   sed -i 's/switch_cpus_11/cpu1/g' ${gem5_dir3}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
   sed -i 's/switch_cpus_12/cpu2/g' ${gem5_dir3}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
   sed -i 's/switch_cpus_13/cpu3/g' ${gem5_dir3}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt

#For Others
python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir3}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt -t ${M3D_template_dir}/template_${FREQ[$[freq_i]]}_aggressive.xml -o ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_aggressive_${TEMP}.xml
python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir3}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt -t ${M3D_template_dir}/template_${FREQ[$[freq_i]]}_conservative_degradation.xml -o ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_conservative_degradation_${TEMP}.xml

#For Others
	$McPat_home/mcpat -infile ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_aggressive_${TEMP}.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir2/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK[$[bench_i]]}_aa_FirstLoop_aggressive.txt
#FOr Core
	$McPat_home/mcpat -infile ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_conservative_degradation_${TEMP}.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir2/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK[$[bench_i]]}_aa_FirstLoop_conservative_degradation.txt
#FOr Core

	bench_i=$((bench_i+1))
done
	bench_i=1
	freq_i=$((freq_i+1))
done
	bench_i=1
	freq_i=0

"""


while [ ${freq_i} -ne 1 ] #15
do

while [ ${temp_i} -ne 1 ] #7
do
	echo "Start Parsing the Gem5 Result"
#For Others
#	cp ${gem5_dir3}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt ${gem5_dir3}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt.backup
#  sed -i 's/switch_cpus_10/cpu0/g' ${gem5_dir3}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
#   sed -i 's/switch_cpus_11/cpu1/g' ${gem5_dir3}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
#   sed -i 's/switch_cpus_12/cpu2/g' ${gem5_dir3}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
#   sed -i 's/switch_cpus_13/cpu3/g' ${gem5_dir3}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt

#python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir3}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt -t ${M3D_template_dir}/template_${FREQ[$[freq_i]]}_aggressive_${TEMP[$[temp_i]]}.xml -o ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_${TEMP[$[temp_i]]}_aggressive.xml

#For Others
#	$McPat_home/mcpat -infile ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_${TEMP[$[temp_i]]}.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir2/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${TEMP[$[temp_i]]}_${BENCHMARK[$[bench_i]]}_aa_FirstLoop.txt
	$McPat_home/mcpat -infile ${gem5_dir2}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_${TEMP[$[temp_i]]}_aggressive_many.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir2/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK[$[bench_i]]}_aa_FirstLoop_${TEMP[$[temp_i]]}_aggressive_many.txt
#	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_aggressive_${TEMP[$[temp_i]]}.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir2/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK[$[bench_i]]}_aa_FirstLoop_${TEMP[$[temp_i]]}_aggressive_nostat.txt

#FOr Core

	temp_i=$((temp_i+1))
done
	temp_i=0
	freq_i=$((freq_i+1))
done
	
