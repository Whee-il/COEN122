vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib  \
"../../../../CPU.gen/sources_1/bd/CPU/sim/CPU.v" \


vlog -work xil_defaultlib \
"glbl.v"

