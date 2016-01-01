package classic;
// NOTE: This is not thread safe!

class Singleton;
   local static Singleton uniqueInstance;

   local function new();
   endfunction

   // static here
   static function Singleton getInstance();
      if (uniqueInstance == null) begin
         uniqueInstance = new();
         $display("making new!");
      end
      return uniqueInstance;
   endfunction

   function string getDescription();
      $display("I'm a classic Singleton!");
   endfunction

endclass

endpackage

module top;

   import classic::*;
   Singleton singleton;

   initial begin
      $display("HELLO");

      // Error-[SV-ICMA] Illegal class method access
      // Singleton.sv, 41
      // Local method 'new' of class 'Singleton' is not visible to scope 'top'.
      // Please make sure that the above method is called only from its own class
      // properties as it is declared as local.
      //  singleton  = new();
      // GREAT ERROR - WORKS GREAT

      // running from this fork
      // this twice shows the "making new" message only showed up once! yes
      fork
         singleton  = Singleton::getInstance();
         singleton  = Singleton::getInstance();
         singleton  = Singleton::getInstance();
         singleton  = Singleton::getInstance();
         singleton  = Singleton::getInstance();
         singleton  = Singleton::getInstance();
         singleton  = Singleton::getInstance();
         singleton  = Singleton::getInstance();
      join
      singleton.getDescription();
      #1;
      $finish();
   end

endmodule

