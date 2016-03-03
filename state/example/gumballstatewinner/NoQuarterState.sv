class NoQuarterState implements State;
   GumballMachine gumballMachine;

   function new(GumballMachine gumballMachine);
      this.gumballMachine = gumballMachine;
   endfunction

   virtual function void insertQuarter();
      $display("You inserted a quarter");
      gumballMachine.setState(gumballMachine.getHasQuarterState());
   endfunction

   virtual function void ejectQuarter();
      $display("You haven't inserted a quarter");
   endfunction

   virtual function void turnCrank();
      $display("You turned, but there's no quarter");
   endfunction

   virtual function void dispense();
      $display("You need to pay first");
   endfunction

   virtual function void refill();
   endfunction

   virtual function string toString();
      return "waiting for quarter";
   endfunction

endclass
