rm -rf work
vlib work

vlog -sv -pedanticerrors \
     dut.sv
# +define+PREFERRED \


vsim -c top -do "run -all" -sv_seed random -solvefaildebug 
# -solveverbose
