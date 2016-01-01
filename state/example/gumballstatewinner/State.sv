interface class State;
   // TODO CANT DO THIS
   // pure virtual function new(GumballMachine gumballMachine);
   pure virtual function void insertQuarter();
	 pure virtual function void ejectQuarter();
	 pure virtual function void turnCrank();
	 pure virtual function void dispense();
	 pure virtual function void refill();
	 // TODO ADDED THIS
   pure virtual function string toString();
endclass
