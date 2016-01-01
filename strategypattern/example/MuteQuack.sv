class MuteQuack implements QuackBehavior;
    virtual function void quack();
        $display("<< Silence >>");
    endfunction // quack
endclass // MuteQuack
