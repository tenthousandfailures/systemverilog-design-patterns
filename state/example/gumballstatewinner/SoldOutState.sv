class SoldOutState implements State;
   GumballMachine gumballMachine;

   function new(GumballMachine gumballMachine);
      this.gumballMachine = gumballMachine;
   endfunction

   virtual function void insertQuarter();
		  $display("You can't insert a quarter, the machine is sold out");
   endfunction

   virtual function void ejectQuarter();
      $display("You can't eject, you haven't inserted a quarter yet");
	 endfunction

   virtual function void turnCrank();
		  $display("You turned, but there are no gumballs");
	 endfunction

   virtual function void dispense();
		  $display("No gumball dispensed");
   endfunction

   virtual function void refill();
		  gumballMachine.setState(gumballMachine.getNoQuarterState());
	 endfunction

   virtual function string toString();
		  return "sold out";
	 endfunction
endclass
