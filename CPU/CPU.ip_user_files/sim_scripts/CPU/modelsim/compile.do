vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  -incr \
"../../../../CPU.gen/sources_1/bd/CPU/sim/CPU.v" \


vlog -work xil_defaultlib \
"glbl.v"

