class SoldState implements State;
    GumballMachine gumballMachine;

   function new(GumballMachine gumballMachine);
      this.gumballMachine = gumballMachine;
   endfunction

    virtual function void insertQuarter();
       $display("Please wait, we're already giving you a gumball");
	  endfunction

   virtual  function void ejectQuarter();
		  $display("Sorry, you already turned the crank");
	 endfunction

	 virtual function void turnCrank();
		  $display("Turning twice doesn't get you another gumball!");
	 endfunction

	 virtual function void dispense();
		  gumballMachine.releaseBall();
		  if (gumballMachine.getCount() > 0) begin
			   gumballMachine.setState(gumballMachine.getNoQuarterState());
		  end else begin
			 $display("Oops, out of gumballs!");
			 gumballMachine.setState(gumballMachine.getSoldOutState());
		end
	 endfunction

	 virtual function void refill();
   endfunction

	 virtual function string toString();
		  return "dispensing a gumball";
	 endfunction

endclass
