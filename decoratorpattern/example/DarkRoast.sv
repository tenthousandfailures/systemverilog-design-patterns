class DarkRoast extends Beverage;
   
	 function new();
      description = "Dark Roast Coffee";
	 endfunction
 
	 virtual function real cost();
      return 0.99;
	 endfunction

endclass

