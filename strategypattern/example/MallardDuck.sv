class MallardDuck extends Duck;
    function new();
        FlyWithWings f = new();
        Quack q = new();
        setFlyBehavior(f);
        setQuackBehavior(q);
    endfunction

    virtual function void display();
        $display("I'm a real Mallard duck");
    endfunction // display
    
endclass // MallardDuck
