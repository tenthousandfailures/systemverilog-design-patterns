class GumballMachine;

   // TODO THIS IS NOT NEEDED WITH ::new syntax
   SoldOutState sOS;
   NoQuarterState nQS;
   HasQuarterState hQS;
   SoldState sS;
   WinnerState wS;

   State soldOutState;
   State noQuarterState;
   State hasQuarterState;
   State soldState;
   State winnerState;

   // State state = soldOutState;
   State state;

   int count = 0;

   function new(int numberGumballs);
      // Error-[SV-IIOIC] Illegal instantiation of interface class
      // GumballMachine.sv, 15
      // gumballstatewinner, "this.soldOutState = new();"
      //   Instantiation of the object 'soldOutState' can not be done because its type
      //   'State' is an interface class.
      //   Like abstract classes, an object of an interface class type shall not be
      //   constructed.

      // this is valid syntax but doesn't work in VCS? would make the below much shorter
      // OPENED SYNOPSYS CASE: 8000857354
      // State s = SoldOutState::new(this);

      sOS              = new(this);
      nQS              = new(this);
      hQS              = new(this);
      sS               = new(this);
      wS               = new(this);

      soldOutState     = sOS;
      noQuarterState   = nQS;
      hasQuarterState  = hQS;
      soldState        = sS;
      winnerState      = wS;

      this.count       = numberGumballs;
      if (numberGumballs > 0) begin
         state = noQuarterState;
      end
   endfunction

   function void insertQuarter();
      state.insertQuarter();
   endfunction

   function void ejectQuarter();
      state.ejectQuarter();
   endfunction

   function void turnCrank();
      state.turnCrank();
      state.dispense();
   endfunction

   function void setState(State state);
      this.state = state;
   endfunction

   function void releaseBall();
      $display("A gumball comes rolling out the slot...");
      if (count != 0) begin
         count  = count - 1;
      end
   endfunction

   function int getCount();
      return count;
   endfunction

   function void refill(int count);
      this.count += count;
      $display("The gumball machine was just refilled; it's new count is: %d", this.count);
      state.refill();
   endfunction

   function State getState();
      return state;
   endfunction

   function State getSoldOutState();
      return soldOutState;
   endfunction

   function State getNoQuarterState();
      return noQuarterState;
   endfunction

   function State getHasQuarterState();
      return hasQuarterState;
   endfunction

   function State getSoldState();
      return soldState;
   endfunction

   function State getWinnerState();
      return winnerState;
   endfunction

   function string toString();
      string result  = "";
      string t;

      result         = {result, "\nMighty Gumball, Inc."};
      result         = {result, "\nJava-enabled Standing Gumball Model #2004"};
      t.itoa(count);
      result         = {result, "\nInventory: ", t, " gumball"};
      if (count != 1) begin
         result = {result, "s"};
      end
      result  = {result, "\n"};
      t       = state.toString();
      result  = {result, "Machine is ", t, "\n"};
      return result;
   endfunction
endclass
