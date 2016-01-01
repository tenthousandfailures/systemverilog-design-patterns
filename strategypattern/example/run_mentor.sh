rm -rf work
vlib work

vlog -sv -mfcu -pedanticerrors \
     FlyBehavior.sv \
     FlyWithWings.sv \
     FlyNoWay.sv \
     QuackBehavior.sv \
     Quack.sv \
     MuteQuack.sv \
     Squeak.sv \
     Duck.sv \
     MallardDuck.sv \
     DecoyDuck.sv \
     RubberDuck.sv \
     ModelDuck.sv \
     MiniDuckSimulator.sv
# +define+PREFERRED \

vsim -c top -do "run -all" -sv_seed random -solvefaildebug
# -solveverbose
