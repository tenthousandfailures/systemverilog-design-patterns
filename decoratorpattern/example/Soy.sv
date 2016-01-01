class Soy extends CondimentDecorator;

   Beverage beverage;

	 function new(Beverage beverage);
      this.beverage = beverage;
      // $display({"DEBUG SOY: ", getDescription()});
   endfunction

	 virtual function string getDescription();
		  return {beverage.getDescription(), ", Soy"};
	 endfunction

   virtual function real cost();
      return (0.15 + beverage.cost());
	 endfunction

endclass
