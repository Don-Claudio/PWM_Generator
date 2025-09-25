This guide explains how to compile and simulate the PWM Generator using ModelSim.

## Prerequisites

ModelSim (Intel/Quartus or Mentor edition) installed.

Source files located in your repo folder:

pwm-verilog/
├─ rtl/      → pwm.v          (design)
├─ tb/       → pwm_tb.v       (testbench)

## Open ModelSim and Set Up a Library

Launch ModelSim.

From the console, create a working library

vlib work
vmap work work

## Compile the Source Files
vlog ../rtl/pwm.v
vlog ../tb/pwm_tb.v

## Start the Simulation
vsim pwm_tb

## Add Signals to the Waveform Viewer
add wave *

## Run the Simulation
run 30000