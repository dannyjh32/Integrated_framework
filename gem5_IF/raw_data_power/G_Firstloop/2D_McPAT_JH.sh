#!/bin/bash
Parser_home=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master
McPat_home=/home/SJ/mcpat-master/obj_opt
gem5_dir=/home/SJ/gem5-master/Result_SPEC2006
template_dir=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master/template/Thermal
FREQ=("5.6GHz" "6.8GHz" "5.3GHz" "5.4GHz" "5.5GHz" "5.6GHz" "5.7GHz" "5.8GHz" "5.9GHz" "6GHz" "6.1GHz" "6.2GHz" "6.3GHz" "6.4GHz" "6.5GHz" "6.6GHz" "6.7GHz" "6.8GHz" "6.9GHz" "7GHz""7.1GHz" "7.2GHz" "7.3GHz" "7.4GHz" "7.5GHz" "7.6GHz" "7.7GHz" "7.8GHz" "7.9GHz" "8GHz")
BENCHMARK_330=("bzip2" "calculix" "hmmer" "povray" "sjeng")
BENCHMARK_320=("gcc" "lbm" "mcf" "soplex")
BENCHMARK=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
BENCHMARK2=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "sjeng" "soplex")
bench_i=6
freq_i=0
#Liquid

freq_i=0
while [ ${freq_i} -ne 1 ] #30
do


while [ ${bench_i} -ne 7 ]
do
	echo "hwan ${BENCHMARK[$[bench_i]]}"
	echo "Start Parsing the Gem5 Result"
	cp ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt.backup
	sed -i 's/switch_cpus_10/cpu0/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
	sed -i 's/switch_cpus_11/cpu1/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
	sed -i 's/switch_cpus_12/cpu2/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
	sed -i 's/switch_cpus_13/cpu3/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
#mkdir only once!!
	mkdir ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}

	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ[$[freq_i]]}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt -t ${Parser_home}/template/M3D/M3D_200525/2D/320/template_${FREQ[$[freq_i]]}.xml -o ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_320_FirstLoop_heon.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_320_FirstLoop_heon.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK[$[bench_i]]}_320_FirstLoop_heon.txt
	bench_i=$((bench_i+1))
done
bench_i=6
freq_i=$((freq_i+1))

done
freq_i=0

while [ ${freq_i} -ne 1 ]
do


while [ ${bench_i} -ne 7 ]
do
	echo "hwan ${BENCHMARK[$[bench_i]]}"
	echo "Start Parsing the Gem5 Result"
	cp ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt.backup
	sed -i 's/switch_cpus_10/cpu0/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
	sed -i 's/switch_cpus_11/cpu1/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
	sed -i 's/switch_cpus_12/cpu2/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
	sed -i 's/switch_cpus_13/cpu3/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
#mkdir only once!!
	mkdir ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}

	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ[$[freq_i]]}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt -t ${Parser_home}/template/M3D/M3D_200525/2D/330/template_${FREQ[$[freq_i]]}.xml -o ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_330_FirstLoop_heon.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_330_FirstLoop_heon.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK[$[bench_i]]}_330_FirstLoop_heon.txt
	bench_i=$((bench_i+1))
done
bench_i=6
freq_i=$((freq_i+1))

done
freq_i=0
while [ ${freq_i} -ne 1 ]
do


while [ ${bench_i} -ne 7 ]
do
	echo "hwan ${BENCHMARK[$[bench_i]]}"
	echo "Start Parsing the Gem5 Result"
	cp ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt.backup
	sed -i 's/switch_cpus_10/cpu0/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
	sed -i 's/switch_cpus_11/cpu1/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
	sed -i 's/switch_cpus_12/cpu2/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
	sed -i 's/switch_cpus_13/cpu3/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
#mkdir only once!!
	mkdir ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}

	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ[$[freq_i]]}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt -t ${Parser_home}/template/M3D/M3D_200525/2D/340/template_${FREQ[$[freq_i]]}.xml -o ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_340_FirstLoop_heon.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_340_FirstLoop_heon.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK[$[bench_i]]}_340_FirstLoop_heon.txt
	bench_i=$((bench_i+1))
done
bench_i=6
freq_i=$((freq_i+1))

done
freq_i=0
while [ ${freq_i} -ne 1 ]
do


while [ ${bench_i} -ne 7 ]
do
	echo "hwan ${BENCHMARK[$[bench_i]]}"
	echo "Start Parsing the Gem5 Result"
	cp ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt.backup
	sed -i 's/switch_cpus_10/cpu0/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
	sed -i 's/switch_cpus_11/cpu1/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
	sed -i 's/switch_cpus_12/cpu2/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
	sed -i 's/switch_cpus_13/cpu3/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
#mkdir only once!!
	mkdir ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}

	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ[$[freq_i]]}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt -t ${Parser_home}/template/M3D/M3D_200525/2D/350/template_${FREQ[$[freq_i]]}.xml -o ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_350_FirstLoop_heon.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_350_FirstLoop_heon.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK[$[bench_i]]}_350_FirstLoop_heon.txt
	bench_i=$((bench_i+1))
done
bench_i=6
freq_i=$((freq_i+1))

done
freq_i=0
while [ ${freq_i} -ne 1 ]
do


while [ ${bench_i} -ne 7 ]
do
	echo "hwan ${BENCHMARK[$[bench_i]]}"
	echo "Start Parsing the Gem5 Result"
	cp ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt.backup
	sed -i 's/switch_cpus_10/cpu0/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
	sed -i 's/switch_cpus_11/cpu1/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
	sed -i 's/switch_cpus_12/cpu2/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
	sed -i 's/switch_cpus_13/cpu3/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
#mkdir only once!!
	mkdir ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}

	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ[$[freq_i]]}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt -t ${Parser_home}/template/M3D/M3D_200525/2D/360/template_${FREQ[$[freq_i]]}.xml -o ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_360_FirstLoop_heon.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_360_FirstLoop_heon.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK[$[bench_i]]}_360_FirstLoop_heon.txt
	bench_i=$((bench_i+1))
done
bench_i=6
freq_i=$((freq_i+1))

done
freq_i=0
while [ ${freq_i} -ne 1 ]
do


while [ ${bench_i} -ne 7 ]
do
	echo "hwan ${BENCHMARK[$[bench_i]]}"
	echo "Start Parsing the Gem5 Result"
	cp ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt.backup
	sed -i 's/switch_cpus_10/cpu0/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
	sed -i 's/switch_cpus_11/cpu1/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
	sed -i 's/switch_cpus_12/cpu2/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
	sed -i 's/switch_cpus_13/cpu3/g' ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt
#mkdir only once!!
	mkdir ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}

	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ[$[freq_i]]}/${FREQ[$[freq_i]]}/config.json -s ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/stats.txt -t ${Parser_home}/template/M3D/M3D_200525/2D/370/template_${FREQ[$[freq_i]]}.xml -o ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_370_FirstLoop_heon.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/mcpat_input_${BENCHMARK[$[bench_i]]}_370_FirstLoop_heon.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/${FREQ[$[freq_i]]}/${BENCHMARK[$[bench_i]]}_${FREQ[$[freq_i]]}/power_${BENCHMARK[$[bench_i]]}_370_FirstLoop_heon.txt
	bench_i=$((bench_i+1))
done
bench_i=4
freq_i=$((freq_i+1))

done
freq_i=0




"""
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
"""
