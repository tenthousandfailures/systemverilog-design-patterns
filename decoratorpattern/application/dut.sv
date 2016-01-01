package layer;

   typedef enum {READ, WRITE} rw_t;

class addr_txn;
   rand bit [31:0] addr;
   rand int size;

   constraint c_size { size inside {1,2,4}; }

   function void rprint();
      this.randomize();
      print();
   endfunction

   virtual function void print();
      $display("  addr=%h size=%0d", this.addr, this.size);
   endfunction

endclass

virtual class addr_txnDecorator extends addr_txn;
endclass

class addr_permit extends addr_txnDecorator;
   rand addr_txn txn;

   function new(addr_txn txn);
      this.txn = txn;
   endfunction

   constraint c_addr_permit {
      // addr inside {['h00000000 : 'h0000FFFF - size]} ||
      // addr inside {['h10000000 : 'h1FFFFFFF - size]};
      addr inside {['h0 : 'hF]};
   }
   constraint addr_permit_c {
      txn.addr == addr;
   }

endclass

class addr_prohibit extends addr_txnDecorator;
   rand addr_txn txn;

   function new(addr_txn txn);
      this.txn = txn;
   endfunction

   constraint c_addr_prohibit {
      addr inside {['hF : 'hFF]};
      // !(addr inside {['h0 : 'h5]});
      // !(addr inside {['h00000000 : 'h00000FFF - size]});
   }
   constraint addr_prohibit_c {
      txn.addr == addr;
   }
endclass

endpackage

module top;

   import layer::*;

   layer::addr_txn txn;
   layer::addr_permit addr_permit;
   layer::addr_prohibit addr_prohibit;

   initial begin

`ifdef PREFERRED

      // TODO why is virtual not working or are we killing it?
      $display("RUNNING PREFERRED");
      txn       = layer::addr_txn::new; txn.rprint();
      txn       = layer::addr_prohibit::new(txn); txn.rprint();
      txn       = layer::addr_permit::new(txn); txn.rprint();

      // DOES NOT WORK NOT SURE IF IT SHOULD ANYWAYS
      // $display("ALTERNATIVE");
      // txn       = layer::addr_permit::new(layer::addr_prohibit::new(layer::addr_txn::new));
      // txn.rprint();

`else

      // synopsys / cadence has yet to implement "Typed Constructor Calls"
      // synopsys STAR NUMBER issue
      // the below is functionally equivalent to the above
      $display("RUNNING COMPATIBILITY");

      txn       = new;
      txn.rprint();

      addr_permit  = new(txn);
      txn          = new addr_permit;
      txn.rprint();

      addr_prohibit  = new(txn);
      txn            = new addr_prohibit;
      txn.rprint();

`endif

      #1;
      $finish();
   end

endmodule
