vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"../../../../CPU.gen/sources_1/bd/CPU/sim/CPU.v" \


vlog -work xil_defaultlib \
"glbl.v"

