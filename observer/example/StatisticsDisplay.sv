class StatisticsDisplay implements Observer, DisplayElement;
    
    protected shortreal maxTemp = 0.0;
    protected shortreal minTemp = 200;
    protected shortreal tempSum = 0.0;
    protected int       numReadings;
    protected WeatherData weatherData;

    function new(WeatherData weatherData);
        this.weatherData = weatherData;
        weatherData.registerObserver(this);
    endfunction // new
    
    virtual function void update(shortreal temperature, shortreal humidity, shortreal pressure);
        tempSum += temperature;
        numReadings++;

        if (temperature > maxTemp) begin
            maxTemp = temperature;
        end

        if (temperature < minTemp) begin
            minTemp = temperature;
        end
        
        display();
    endfunction // update
    
    virtual function void display();
        $display("Avg/Max/Min temperature = %0d / %0d / %0d", (tempSum / numReadings), maxTemp, minTemp);
    endfunction // display
    
endclass // StatisticsDisplay
