class HasQuarterState implements State;
   GumballMachine gumballMachine;

   function new(GumballMachine gumballMachine);
      this.gumballMachine = gumballMachine;
   endfunction

   virtual function void insertQuarter();
      $display("You can't insert another quarter");
   endfunction

   virtual function void ejectQuarter();
      $display("Quarter returned");
      gumballMachine.setState(gumballMachine.getNoQuarterState());
   endfunction

   virtual function void turnCrank();
      int  winner;
      $display("You turned...");
      winner = $urandom % 10;
      if ((winner == 0) && (gumballMachine.getCount() > 1)) begin
         gumballMachine.setState(gumballMachine.getWinnerState());
      end else begin
         gumballMachine.setState(gumballMachine.getSoldState());
      end
   endfunction

   virtual function void dispense();
      $display("No gumball dispensed");
   endfunction

   virtual function void refill();
   endfunction

   virtual function string toString();
      return "waiting for turn of crank";
   endfunction

endclass
