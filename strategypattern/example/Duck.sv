virtual class Duck;
    FlyBehavior flyBehavior;
    QuackBehavior quackBehavior;
    
    function void setFlyBehavior(FlyBehavior fb);
        flyBehavior = fb;
    endfunction // setFlyBehavior

    function void setQuackBehavior(QuackBehavior qb);
        quackBehavior = qb;
    endfunction // setQuackBehavior
    
    virtual function void display();
    endfunction // display

    function void performFly();
        flyBehavior.fly();
    endfunction // performFly

    function void performQuack();
        quackBehavior.quack();
    endfunction // performQuack
    
    function void swim();
        $display("All ducks float, even decoys!");
    endfunction // swim
    
endclass // Duck
