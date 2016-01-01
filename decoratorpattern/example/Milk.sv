class Milk extends CondimentDecorator;

	 Beverage beverage;

	 function new(Beverage beverage);
      this.beverage = beverage;
	 endfunction

	 virtual function string getDescription();
      return {beverage.getDescription(), ", Milk"};
   endfunction

	 virtual function real cost();
      return (0.10 + beverage.cost());
   endfunction

endclass
