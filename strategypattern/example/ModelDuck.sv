class ModelDuck extends Duck;
    function new();
        FlyNoWay f = new();
        Quack q = new();
        setFlyBehavior(f);
        setQuackBehavior(q);
    endfunction

    virtual function void display();
        $display("I'm a model duck");
    endfunction // display
    
endclass // ModelDuck
