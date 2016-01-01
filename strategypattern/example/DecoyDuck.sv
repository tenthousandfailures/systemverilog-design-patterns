class DecoyDuck extends Duck;
    function new();
        FlyNoWay f = new();
        MuteQuack q = new();
        setFlyBehavior(f);
        setQuackBehavior(q);
    endfunction // DecoyDuck

    virtual function void display();
        $display("I'm a duck Decoy");
    endfunction // display
    
endclass // DecoyDuck
