class FlyNoWay implements FlyBehavior;
    virtual function void fly();
        $display("I can't fly");
    endfunction // fly
endclass // FlyNoWay
