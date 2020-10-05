# Integrated_framework


![Integrated_framework](https://user-images.githubusercontent.com/71616589/93767115-76456a80-fc52-11ea-897a-8caef8d0c007.jpg)

This is the integrated framework for the thermal feasibility study of the microprocessors (M3D, 2D, and TSV-3D), which reflects off-the-shelf cooling solutions.

Through the integrated framework, uses can evaluate the steady state temperature, energy consumption, maximum clock frequency, and system performance of the different microprocessor configurations

- Steady state temperature
1) Run the performance simulation and then feed the performance results to the power simulation (❶). 
2) Extract the power traces of key components (four CPU cores, integrated GPU, LLC, and system agent) from the power simulation and then feed them to the thermal simulation (❷). 
 * Since there is an interdependence between leakage power consumption and temperature, a closed-loop simulation is required.
3) Run the closed-loop power and thermal simulations until on-chip temperature converges to a stable state (❸), and then obtain steady state temperature (❹). 
 * Note for TSV3D and M3D, run the closed-loop simulation for all the layers.
 
 - Energy consumption (energy consumption of microprocessor added by cooling energy)
1) Extract the power consumption of our target cooling solutions (❻). 
 * We consider the following four off-the-shelf cooling solutions: 1) Active Air Cooling with a heat sink and fan (denoted as AAC), 2) Passive air cooling with a Vapor Chamber (denoted as PVC), 3) Active air cooling with a Vapor Chamber and two fans (denoted as AVC), and 4) Liquid Cooled cold plate based cooling with a pump, radiator and two fans (denoted as LC). According to our measurements, the power consumptions of AAC, PVC, AVC, and LC are 1.3W, 0W, 4.6W, and 6.2W, respectively;  
2) Obtain the energy consumption based on power consumption (both microprocessor and cooling solution) and execution time extracted from the performance simulation (❼).

- Maximum clock frequency (the maximum clock frequency is the highest clock frequency satisfying both design and thermal constraints)
1) Run the performance simulation at 0.8GHz (which is the clock frequency in the idle state of our baseline) and then extract steady state temperature (❽) in the order following ❶ to ❸. 
2) Increase the clock frequency by 0.1GHz (❾) and then repeat the step ❶, ❷, ❸, and ❽, until the clock frequency reaches the upper bound (design constraint) or steady state temperature reaches the threshold temperature (thermal constraint).
 * Design constraint: each microprocessor configuration has its own upper bound of the clock frequency; the upper bounds for 2D, TSV3D, M3D_Worst, and M3D_Best are 4.0GHz, 4.0GHz, 4.2GHz, and 5.4GHz, respectively.
 * Thermal constraint: each microprocessor configuration operating at the maximum clock frequency must sustain steady state temperature below the threshold temperature (90℃).
3) Obtain the maximum clock frequency satisfying both design and thermal constraints (❿). 

- System performance 
1) Run the performance simulation at the maximum clock frequency

For sample configurations and scripts, please refer to followings.
1) running scripts for gem5 and McPAT
 : gem5_IF/example_script
2) running scripts for HotSpot
 : hotspot_IF/example_script
3) cooling solution parameters
 : hotspot_IF/config
4) VF pairs for each microprocessor configuration
 : gem5_IF/example_template/2D and gem5_IF/example_template/M3D
