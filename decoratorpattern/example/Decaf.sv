class Decaf extends Beverage;

	 function new();
      description = "Decaf Coffee";
	 endfunction

	 virtual function real cost();
		  return 1.05;
	 endfunction

endclass
