class HouseBlend extends Beverage;

   function new();
      description = "House Blend Coffee";
	 endfunction

   virtual function real cost();
      return 0.89;
   endfunction

endclass
