class Mocha extends CondimentDecorator;

   Beverage beverage;

   function new(Beverage beverage);
      this.beverage = beverage;
   endfunction

	 virtual function string getDescription();
      return {beverage.getDescription(), ", Mocha"};
	 endfunction

	 virtual function real cost();
		  return (0.20 + beverage.cost());
	 endfunction

endclass
