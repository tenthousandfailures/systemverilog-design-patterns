package gumballstatewinner;
   // TODO had to declare these classes early
   typedef class SoldOutState;
   typedef class NoQuarterState;
   typedef class HasQuarterState;
   typedef class SoldState;
   typedef class WinnerState;

`include "State.sv"
`include "GumballMachine.sv"
`include "HasQuarterState.sv"
`include "NoQuarterState.sv"
`include "WinnerState.sv"
`include "SoldOutState.sv"
`include "SoldState.sv"
endpackage

module top;

   import gumballstatewinner::*;
   GumballMachine gumballMachine;

   initial begin
      $display("HELLO");

      gumballMachine = new(10);

      $display(gumballMachine.toString());

      gumballMachine.insertQuarter();
      gumballMachine.turnCrank();
      gumballMachine.insertQuarter();
      gumballMachine.turnCrank();

      $display(gumballMachine.toString());
      gumballMachine.insertQuarter();
      gumballMachine.turnCrank();
      gumballMachine.insertQuarter();
      gumballMachine.turnCrank();

      $display(gumballMachine.toString());
      gumballMachine.insertQuarter();
      gumballMachine.turnCrank();
      gumballMachine.insertQuarter();
      gumballMachine.turnCrank();

      $display(gumballMachine.toString());
      gumballMachine.insertQuarter();
      gumballMachine.turnCrank();
      gumballMachine.insertQuarter();
      gumballMachine.turnCrank();

      $display(gumballMachine.toString());
      gumballMachine.insertQuarter();
      gumballMachine.turnCrank();
      gumballMachine.insertQuarter();
      gumballMachine.turnCrank();

      $display(gumballMachine.toString());

      #1;
      $finish();
   end

endmodule
