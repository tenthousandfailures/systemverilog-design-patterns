package packet;

class Fields;
   rand logic [3:0] addr;
   rand logic [3:0] data;
   rand logic [2:0] cmd;
   rand logic reserved;
endclass

class Fields_V3 extends Fields;
   rand logic [4:0] addr;
endclass

interface class PackBehavior#(type F = Fields);
   pure virtual function logic [13:0] pack(F f);
   pure virtual function F unpack(logic [13:0] raw);
endclass

interface class CheckBehavior;
   pure virtual function logic [13:0] pack(logic [13:0] raw);
   pure virtual function bit unpack(logic [13:0] raw);
endclass

class Parity implements CheckBehavior;
   virtual         function logic [13:0] pack(logic [13:0] raw);
      logic [13:0] a;
      a[13:12]  = 2'b00;
      a[11:0]  = raw[11:0];
      return a;
   endfunction

   virtual         function bit unpack(logic [13:0] raw);
      return 1;
   endfunction
endclass

class Crc implements CheckBehavior;
   virtual         function logic [13:0] pack(logic [13:0] raw);
      logic [13:0] a;
      a[13:12]  = 2'b10;
      a[11:0]  = raw[11:0];
      return a;
   endfunction

   virtual         function bit unpack(logic [13:0] raw);
      return 1;
   endfunction
endclass


class base_packet#(
                   type TPackBehavior = PackBehavior,
                   type F = Fields
                   );

   rand F fields;
   TPackBehavior packBehavior;
   CheckBehavior checkBehavior;

   function new();
      fields  = new;
   endfunction

   function bit performUnpack(logic [13:0] raw);
      fields  = packBehavior.unpack(raw);
      return checkBehavior.unpack(raw);
   endfunction

   function logic [13:0] performPack();
      return checkBehavior.pack((packBehavior.pack(fields)));
   endfunction

   function void print();
      $display("  unpacked addr=%b data=%b cmd=%b", this.fields.addr, this.fields.data, this.fields.cmd);
   endfunction

   function void setPackBehavior(TPackBehavior pb);
      packBehavior = pb;
   endfunction

   function void setCheckBehavior(CheckBehavior cb);
      checkBehavior = cb;
   endfunction

endclass

class v1_pack implements PackBehavior;
   virtual     function logic [13:0] pack(Fields f);
      logic [13:0] a;
      a[13:12]  = 2'bxx;
      a[11]     = f.reserved;
      a[10:7]   = f.addr;
      a[6:3]    = f.data;
      a[2:0]    = f.cmd;
      return a;
   endfunction

   virtual         function Fields unpack(logic [13:0] raw);
      Fields fields    = new;
      fields.reserved  = raw[11];
      fields.addr      = raw[10:7];
      fields.data      = raw[6:3];
      fields.cmd       = raw[2:0];
      return fields;

   endfunction
endclass

class v1_packet extends base_packet;

   function new();
      v1_pack p = new();
      Crc c   = new();

      setPackBehavior(p);
      setCheckBehavior(c);
   endfunction
endclass

class v2_pack implements PackBehavior;
   virtual     function logic [13:0] pack(Fields f);
      logic [13:0] a;
      a[11]    = f.reserved;
      a[10:7]  = f.data;
      a[6:3]   = f.addr;
      a[2:0]   = f.cmd;
      return a;
   endfunction

   virtual         function Fields unpack(logic [13:0] raw);
      Fields fields    = new;
      fields.reserved  = raw[11];
      fields.data      = raw[10:7];
      fields.addr      = raw[6:3];
      fields.cmd       = raw[2:0];
      return fields;
   endfunction

endclass

class v2_packet extends base_packet;

   function new();
      v2_pack p = new();
      Parity c   = new();

      setPackBehavior(p);
      setCheckBehavior(c);
   endfunction
endclass

class v3_pack implements PackBehavior#(.F(Fields_V3));
   virtual         function logic [13:0] pack(Fields_V3 f);
      logic [13:0] a;
      a[13:12]  = 2'bxx;
      a[11:8]  = f.data;
      a[7:3]   = f.addr;
      a[2:0]   = f.cmd;
      return a;
   endfunction

   virtual         function Fields_V3 unpack(logic [13:0] raw);
      Fields_V3 fields = new;

      fields.data  = raw[11:8];
      fields.addr  = raw[7:3];
      fields.cmd   = raw[2:0];
      return fields;

   endfunction

endclass

class v3_packet extends base_packet#(
                                     .TPackBehavior(PackBehavior#(.F(Fields_V3))),
                                     .F(Fields_V3)
                                     );

   function new();
      v3_pack p  = new();
      Crc c   = new();
      setPackBehavior(p);
      setCheckBehavior(c);
   endfunction
endclass

endpackage

module top;

   initial begin

`ifdef PREFERRED

      automatic packet::v1_packet v1p  = new();
      automatic packet::v2_packet v2p  = new();
      automatic packet::v3_packet v3p  = new();

      $display("RUNNING PREFERRED");

      $display("");
      $display("STARTING V1");
      void'(v1p.performUnpack(14'b00_0_0101_1111_010));
      v1p.print();
      v1p.fields.addr  = 0;
      v1p.print();
      $display("  packed=%b", v1p.performPack());
      // can be randomized like the below
      // v1p.randomize();
      // v1p.print();

      $display("");
      $display("STARTING V2");
      void'(v2p.performUnpack(14'b00_0_0101_1111_010));
      v2p.print();
      v2p.fields.addr  = 0;
      v2p.print();
      $display("  packed=%b", v2p.performPack());

      $display("");
      $display("STARTING V3");
      void'(v3p.performUnpack(14'b00_1111_11111_110));
      v3p.print();
      v3p.fields.addr  = 0;
      v3p.print();
      $display("  packed=%b", v3p.performPack());

`else

`endif

      #1;
      $finish();
   end

endmodule
