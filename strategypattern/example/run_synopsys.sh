rm -rf simv* csrc simv.daidir

vcs \
    -sverilog \
    -timescale="1ns/1ns" \
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

simv +ntb_random_seed_automatic
