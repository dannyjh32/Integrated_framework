#!/bin/bash
Parser_home=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master
McPat_home=/home/SJ/mcpat-master/obj_opt
gem5_dir=/home/SJ/gem5-master/Result_SPEC2006
template_dir=/home/SJ/gem5-master/Gem5ToMcPAT-Parser-master/template/Thermal
FREQ=3.4GHz
BENCHMARK_330=("bzip2" "calculix" "hmmer" "povray" "sjeng")
BENCHMARK_320=("gcc" "lbm" "mcf" "soplex")
BENCHMARK=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "povray" "sjeng" "soplex")
BENCHMARK2=("bzip2" "calculix" "gcc" "hmmer" "lbm" "mcf" "sjeng" "soplex")
bench_i=0
cp $gem5_dir/${FREQ}/bzip2_${FREQ}/power_bzip2_pv_FirstLoop.txt $gem5_dir/${FREQ}/bzip2_${FREQ}/power_bzip2_aa_FirstLoop.txt
cp $gem5_dir/${FREQ}/calculix_${FREQ}/power_calculix_pv_FirstLoop.txt $gem5_dir/${FREQ}/calculix_${FREQ}/power_calculix_aa_FirstLoop.txt
cp $gem5_dir/${FREQ}/sjeng_${FREQ}/power_sjeng_pv_FirstLoop.txt $gem5_dir/${FREQ}/sjeng_${FREQ}/power_sjeng_aa_FirstLoop.txt
cp $gem5_dir/${FREQ}/hmmer_${FREQ}/power_hmmer_pv_FirstLoop.txt $gem5_dir/${FREQ}/hmmer_${FREQ}/power_hmmer_aa_FirstLoop.txt

