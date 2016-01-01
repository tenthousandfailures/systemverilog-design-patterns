rm -rf simv* csrc simv.daidir

vcs \
    -sverilog \
    -timescale="1ns/1ns" \
    GumballMachineTestDrive.sv

simv +ntb_random_seed_automatic
