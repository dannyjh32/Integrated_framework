#!/bin/bash

./hotspot -c cpu_d_aa.config -f D_2D_CPU.flp -p D_3D_CPU_2L_t.ptrace -steady_file test/test.steady -model_type grid -grid_layer_file D_3D_CPU_2L.lcf #-package_model_used 1 # -model_secondary 1  -model_type grid # -grid_layer_file TEC.lcf
#./hotspot -c cpu_d_aa.config -f D_2D_CPU.flp -p D_3D_CPU_3L.ptrace -steady_file 1011/cpu_aa_3L.steady -model_type grid -grid_layer_file D_3D_CPU_3L.lcf
