class RubberDuck extends Duck;
    function new();
        FlyNoWay f = new();
        Squeak q = new();
        setFlyBehavior(f);
        setQuackBehavior(q);
    endfunction

    virtual function void display();
        $display("I'm a rubber duckie");
    endfunction // display
    
endclass // RubberDuck
