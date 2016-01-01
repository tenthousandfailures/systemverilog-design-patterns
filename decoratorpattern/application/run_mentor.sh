rm -rf work
vlib work

vlog -sv -pedanticerrors \
     +define+PREFERRED \
     dut.sv

vsim -c top -do "run -all" -sv_seed random -solvefaildebug 
# -solveverbose
