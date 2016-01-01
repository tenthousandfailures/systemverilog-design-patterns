class MiniDuckSimulator;
    static function void main();
        MallardDuck mallard = new();
        RubberDuck rubberDuckie = new();
        DecoyDuck decoy = new();
        ModelDuck model = new();
        
        $display("\nmallard:");
        mallard.display();
        mallard.performFly();
        mallard.performQuack();
        $display("\ndecoy:");
        decoy.display();
        decoy.performFly();
        decoy.performQuack();
        $display("\nrubberDuckie:");
        rubberDuckie.display();
        rubberDuckie.performFly();
        rubberDuckie.performQuack();
        $display("\nmodel:");
        model.display();
        model.performFly();
        model.performQuack();

    endfunction // main
endclass // MiniDuckSimulator

module top;
    MiniDuckSimulator mds;
    
    initial begin
        mds = new();
        mds.main();
        #1;
        $finish();
    end
    
endmodule // tb
