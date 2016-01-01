rm -rf work
vlib work

vlog -sv -pedanticerrors \
     +define+PREFERRED \
     starbuzz.sv

vsim -c top -do "run -all" -sv_seed random -solvefaildebug
# -solveverbose
