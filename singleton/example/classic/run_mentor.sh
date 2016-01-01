rm -rf work
vlib work

vlog -sv -pedanticerrors \
     Singleton.sv
# +define+PREFERRED \

vsim -c top -do "run -all" -sv_seed random -solvefaildebug
# -solveverbose
