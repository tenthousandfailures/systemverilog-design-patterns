class WinnerState implements State;
   GumballMachine gumballMachine;

   function new(GumballMachine gumballMachine);
      this.gumballMachine = gumballMachine;
   endfunction

   virtual function void insertQuarter();
      $display("Please wait, we're already giving you a Gumball");
   endfunction

   virtual function void ejectQuarter();
      $display("Please wait, we're already giving you a Gumball");
   endfunction

   virtual function void turnCrank();
      $display("Turning again doesn't get you another gumball!");
   endfunction

   virtual function void dispense();
      gumballMachine.releaseBall();
      if (gumballMachine.getCount() == 0) begin
         gumballMachine.setState(gumballMachine.getSoldOutState());
      end else begin
         gumballMachine.releaseBall();
         $display("YOU'RE A WINNER! You got two gumballs for your quarter");
         if (gumballMachine.getCount() > 0) begin
            gumballMachine.setState(gumballMachine.getNoQuarterState());
         end else begin
            $display("Oops, out of gumballs!");
            gumballMachine.setState(gumballMachine.getSoldOutState());
         end
      end
   endfunction

   virtual function void refill();
   endfunction

   virtual function string toString();
      return "despensing two gumballs for your quarter, because YOU'RE A WINNER!";
   endfunction

endclass
