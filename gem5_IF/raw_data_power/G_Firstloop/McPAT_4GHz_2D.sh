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
cp $gem5_dir/${FREQ}/povray_${FREQ}/power_povray_av_FirstLoop.txt $gem5_dir/${FREQ}/povray_${FREQ}/power_povray_l_FirstLoop.txt
cp $gem5_dir/${FREQ}/calculix_${FREQ}/power_calculix_pv_FirstLoop.txt $gem5_dir/${FREQ}/calculix_${FREQ}/power_calculix_l_FirstLoop.txt

#Active Vapor Chamber
cp $gem5_dir/${FREQ}/gcc_${FREQ}/power_gcc_pv_FirstLoop.txt $gem5_dir/${FREQ}/gcc_${FREQ}/power_gcc_av_FirstLoop.txt
cp $gem5_dir/${FREQ}/bzip2_${FREQ}/power_bzip2_pv_FirstLoop.txt $gem5_dir/${FREQ}/bzip2_${FREQ}/power_bzip2_av_FirstLoop.txt
cp $gem5_dir/${FREQ}/calculix_${FREQ}/power_calculix_pv_FirstLoop.txt $gem5_dir/${FREQ}/calculix_${FREQ}/power_calculix_av_FirstLoop.txt
cp $gem5_dir/${FREQ}/sjeng_${FREQ}/power_sjeng_pv_FirstLoop.txt $gem5_dir/${FREQ}/sjeng_${FREQ}/power_sjeng_av_FirstLoop.txt
cp $gem5_dir/${FREQ}/soplex_${FREQ}/power_soplex_pv_FirstLoop.txt $gem5_dir/${FREQ}/soplex_${FREQ}/power_soplex_av_FirstLoop.txt
cp $gem5_dir/${FREQ}/hmmer_${FREQ}/power_hmmer_pv_FirstLoop.txt $gem5_dir/${FREQ}/hmmer_${FREQ}/power_hmmer_av_FirstLoop.txt

#Passive Vapor Chamber
cp $gem5_dir/${FREQ}/bzip2_${FREQ}/power_bzip2_aa_FirstLoop.txt $gem5_dir/${FREQ}/bzip2_${FREQ}/power_bzip2_pv_FirstLoop.txt
cp $gem5_dir/${FREQ}/calculix_${FREQ}/power_calculix_aa_FirstLoop.txt $gem5_dir/${FREQ}/calculix_${FREQ}/power_calculix_pv_FirstLoop.txt
cp $gem5_dir/${FREQ}/sjeng_${FREQ}/power_sjeng_aa_FirstLoop.txt $gem5_dir/${FREQ}/sjeng_${FREQ}/power_sjeng_pv_FirstLoop.txt
cp $gem5_dir/${FREQ}/hmmer_${FREQ}/power_hmmer_aa_FirstLoop.txt $gem5_dir/${FREQ}/hmmer_${FREQ}/power_hmmer_pv_FirstLoop.txt

	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ}/${FREQ}/config.json -s ${gem5_dir}/${FREQ}/gcc_${FREQ}/stats.txt -t ${template_dir}/template_${FREQ}_330.xml -o ${gem5_dir}/${FREQ}/gcc_${FREQ}/mcpat_input_gcc_aa_FirstLoop.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ}/gcc_${FREQ}/mcpat_input_gcc_aa_FirstLoop.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/${FREQ}/gcc_${FREQ}/power_gcc_aa_FirstLoop.txt
cp $gem5_dir/${FREQ}/gcc_${FREQ}/powergcc_aa_FirstLoop.txt $gem5_dir/${FREQ}/gcc_${FREQ}/power_gcc_pv_FirstLoop.txt

#Active Air Cooling
	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ}/${FREQ}/config.json -s ${gem5_dir}/${FREQ}/lbm_${FREQ}/stats.txt -t ${template_dir}/template_${FREQ}_330.xml -o ${gem5_dir}/${FREQ}/lbm_${FREQ}/mcpat_input_lbm_aa_FirstLoop.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ}/lbm_${FREQ}/mcpat_input_lbm_aa_FirstLoop.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/${FREQ}/lbm_${FREQ}/power_lbm_aa_FirstLoop.txt

	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ}/${FREQ}/config.json -s ${gem5_dir}/${FREQ}/mcf_${FREQ}/stats.txt -t ${template_dir}/template_${FREQ}_330.xml -o ${gem5_dir}/${FREQ}/mcf_${FREQ}/mcpat_input_mcf_aa_FirstLoop.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ}/mcf_${FREQ}/mcpat_input_mcf_aa_FirstLoop.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/${FREQ}/mcf_${FREQ}/power_mcf_aa_FirstLoop.txt

	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ}/${FREQ}/config.json -s ${gem5_dir}/${FREQ}/soplex_${FREQ}/stats.txt -t ${template_dir}/template_${FREQ}_330.xml -o ${gem5_dir}/${FREQ}/soplex_${FREQ}/mcpat_input_soplex_aa_FirstLoop.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ}/soplex_${FREQ}/mcpat_input_soplex_aa_FirstLoop.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/${FREQ}/soplex_${FREQ}/power_soplex_aa_FirstLoop.txt

	python ${Parser_home}/Gem5ToMcPAT-Parser.py -c ${gem5_dir}/${FREQ}/${FREQ}/config.json -s ${gem5_dir}/${FREQ}/povray_${FREQ}/stats.txt -t ${template_dir}/template_${FREQ}_340.xml -o ${gem5_dir}/${FREQ}/povray_${FREQ}/mcpat_input_povray_aa_FirstLoop.xml

	echo "Parsing and Making McPat input done!"
	echo "Start the McPat"
	$McPat_home/mcpat -infile ${gem5_dir}/${FREQ}/povray_${FREQ}/mcpat_input_povray_aa_FirstLoop.xml -print_level 5 -opt_for_clk 1 >  $gem5_dir/${FREQ}/povray_${FREQ}/power_povray_aa_FirstLoop.txt

