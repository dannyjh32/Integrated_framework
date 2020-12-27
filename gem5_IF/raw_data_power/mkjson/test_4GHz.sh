#!/bin/bash
bmk_home=/home/SJ/sPEC_CPU_V1.1/spec_cpu2006/benchspec/CPU2006/bin
gem5_dir=/home/SJ/gem5-master
out_dir=/home/SJ/gem5-master/0819_real
FREQ=4GHz
#FF=500000000
#FF=1000000
FF=100000000
WARMUP=100000000
#MAXINST=1000000000
MAXINST=50

echo "bzip2 STARTED!!!"
${gem5_dir}/build/X86/gem5.opt \
	--outdir=${out_dir}/${FREQ} \
${gem5_dir}/configs/example/se.py \
	--num-cpus=4 \
	--cpu-clock=${FREQ} \
	--mem-size=16GB \
	--mem-type=DDR4_2400_8x8 \
	--cpu-type=DerivO3CPU \
	--caches \
	--l2cache \
	--l3cache \
	--cacheline_size=64 \
	--maxinsts=${MAXINST} \
    -c "${bmk_home}/bzip2_base.amd64-m64-gcc43-nn;${bmk_home}/bzip2_base.amd64-m64-gcc43-nn;${bmk_home}/bzip2_base.amd64-m64-gcc43-nn;${bmk_home}/bzip2_base.amd64-m64-gcc43-nn"\
	-o "${bmk_home}/input.source 280 Library_Path=${bmk_home};${bmk_home}/input.source 280 Library_Path=${bmk_home};${bmk_home}/input.source 280 Library_Path=${bmk_home};${bmk_home}/input.source 280 Library_Path=${bmk_home}"\
	| gzip -c > ${out_dir}/${FREQ}/stdout_bzip2.gz
echo "bzip2 FINISHED!!!"

