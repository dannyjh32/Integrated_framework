#!/usr/bin/python

import sys
import string
import operator
import re
import numpy as np

dynamic_name = sys.argv[1]
leakage_name = sys.argv[2]
output_file = sys.argv[5]
scaling_factor = sys.argv[3]
pcie_factor = sys.argv[4]

core_layer1_power = float("0")
core_layer2_power = float("0")
LLC_power = float("0")
SA_power = float("0")
PCIe_power = float("0")

f = open(dynamic_name, 'r')
lines = [line.strip() for line in f.readlines()]
#lines = f.readlines() 
#print ([line.rstrip() for line in lines if line.find('Total cores')])
#		if line.find("Total Cores: 4 cores") != -1:
for i, line in enumerate(lines):
# Calculate LLC Power
	if i == 2 :
		item = line.split(" ")
		LLC_power += float(item[2])
# Calculate SA Power w/o PCIe
	if i == 3 :
		item = line.split(" ")
		SA_power += float(item[2])
# Calculate PCIe Power
	if i == 4 :
		item = line.split(" ")
		PCIe_power += float(item[2])

# Calculate Core Dynamic
	if i == 6 :
		item = line.split(" ")
		core_layer1_power += float(item[2])
	if i == 8 :
		item = line.split(" ")
		core_layer2_power += float(item[2])
f.close()
f = open(leakage_name, 'r')
lines = [line.strip() for line in f.readlines()]
#lines = f.readlines() 
#print ([line.rstrip() for line in lines if line.find('Total cores')])
#		if line.find("Total Cores: 4 cores") != -1:
for i, line in enumerate(lines):
# Calculate LLC Power
	if i == 2 :
		item = line.split(" ")
		LLC_power += float(item[2])
# Calculate SA Power w/o PCIe
	if i == 3 :
		item = line.split(" ")
		SA_power += float(item[2])
# Calculate PCIe Power
	if i == 4 :
		item = line.split(" ")
		PCIe_power += float(item[2])

# Calculate Core Dynamic
	if i==6 :
		item = line.split(" ")
		core_layer1_power += float(item[2])
	if i==8 :
		item = line.split(" ")
		core_layer2_power += float(item[2])
f.close()
o = open(output_file, 'w')
core_layer1_power *= float(scaling_factor)
core_layer2_power *= float(scaling_factor)
LLC_power *= float(scaling_factor)
PCIe_power *= float(pcie_factor)
SA_power = float(scaling_factor) * SA_power + PCIe_power

print "After Scaling"
print "Layer 0"
#print "Core : " + str(core_power)
print "LLC : " + str(LLC_power)
print "SA w/ PCIe : " + str(SA_power)

o.write('Scale With Sacling Factor ' + str(scaling_factor) + '\n')
o.write('******** Layer 0 ********' +'\n')
o.write('LLC : ' + str(LLC_power) + '\n')
o.write('SA(w/PCIe) : ' + str(SA_power) + '\n')
o.write('******** Layer 1 ********' + '\n')
o.write('core : '+ str((core_layer1_power)) +'\n')						  
o.write('******** Layer 2 ********' + '\n')
o.write('core : '+ str((core_layer2_power)) +'\n')  
o.write('Total Power : ' + str(core_layer1_power + core_layer2_power + LLC_power + SA_power) + '\n')

o.close()
