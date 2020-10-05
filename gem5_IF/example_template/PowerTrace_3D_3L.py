#!/usr/bin/python

import sys
import string
import operator
import re
import numpy as np

file_name = sys.argv[1]
output_file_3D_3L = sys.argv[2]

core_power_2nd = float("0")
core_power_3rd = float("0")
LLC_power = float("0")
SA_power = float("0")

f = open(file_name, 'r')
lines = [line.strip() for line in f.readlines()]
for i, line in enumerate(lines):
# Calculate LLC Power
	if i == 2 :
		item = line.split(" ")
		LLC_power = float(item[2])
# Calculate SA Power
	if i == 3 :
		item = line.split(" ")
		SA_power = float(item[2])

# Calculate Core Power
	if i == 5 :
		item = line.split(" ")
		core_power_2nd = float(item[2])
	if i == 7 :
		item = line.split(" ")
		core_power_3rd = float(item[2])
f.close()

o_3D_3L = open(output_file_3D_3L, 'w')
o_3D_3L.write('SA_0\tSA_1\tSA_2\tCACHE\tL2_GPU\tL2_CORE_0\tL2_CORE_1\tL2_CORE_2\tL2_CORE_3\tL3_GPU\tL3_CORE_0\tL3_CORE_1\tL3_CORE_2\tL3_CORE_3\n')
o_3D_3L.write(str(float(SA_power)*0.868) + '\t' + str(float(SA_power)*0.066) + '\t' + str(float(SA_power)*0.066) + '\t'+ str(float(LLC_power)) + '\t' + "0" + '\t' + str(float(core_power_2nd)/4) + '\t' + str(float(core_power_2nd)/4) + '\t' + str(float(core_power_2nd)/4) + '\t' +     str(float(core_power_2nd)/4) + '\t' + "0" + '\t' + str(float(core_power_3rd)/4) + '\t' + str(float(core_power_3rd)/4) + '\t' + str(float(core_power_3rd)/4) + '\t' + str(float(core_power_3rd)/4) + '\n')
o_3D_3L.close()

