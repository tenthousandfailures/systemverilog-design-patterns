virtual class Beverage;
   string description = "Unknown Beverage";

	 virtual function string getDescription();
      return description;
   endfunction

	 virtual function real cost();
   endfunction

endclass

