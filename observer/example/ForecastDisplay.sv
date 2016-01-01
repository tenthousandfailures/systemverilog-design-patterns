class ForecastDisplay implements Observer, DisplayElement;
    
    protected shortreal currentPressure = 29.92;
    protected shortreal lastPressure;
    protected WeatherData weatherData;

    function new(WeatherData weatherData);
        this.weatherData = weatherData;
        weatherData.registerObserver(this);
    endfunction // new
    
    virtual function void update(shortreal temperature, shortreal humidity, shortreal pressure);
        lastPressure = currentPressure;
        currentPressure = pressure;
       
        display();
    endfunction // update
    
    virtual function void display();
        $display("Forecast:");

        if (currentPressure > lastPressure) begin
            $display("Improving weather on the way!");
        end else if (currentPressure == lastPressure) begin
            $display("More of the same");
        end else if (currentPressure < lastPressure) begin
            $display("Watch out for cooler, rainy weather");
        end
    endfunction // display
    
endclass // ForecastDisplay
