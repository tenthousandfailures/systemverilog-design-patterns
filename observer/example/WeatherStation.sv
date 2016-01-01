class WeatherStation;
    WeatherData weatherData;
    CurrentConditionsDisplay currentDisplay;
    StatisticsDisplay statisticsDisplay;
    ForecastDisplay forecastDisplay;
    
    function void main;
        weatherData = new();
        currentDisplay = new(weatherData);
        statisticsDisplay = new(weatherData);
        forecastDisplay = new(weatherData);

        weatherData.setMeasurements(80, 65, 30.4); $display("");
        weatherData.setMeasurements(82, 70, 29.2); $display("");
        weatherData.setMeasurements(78, 90, 29.2); $display("");

        weatherData.removeObserver(forecastDisplay);
        weatherData.removeObserver(statisticsDisplay);
        weatherData.setMeasurements(99, 99, 22); $display("");

        weatherData.registerObserver(statisticsDisplay);
        weatherData.setMeasurements(100, 101, 23); $display("");
        
    endfunction
        
endclass // WeatherStation

module tb;
    WeatherStation ws;

    initial begin
        ws = new();
        ws.main();
        #1;
        $finish();
    end

endmodule // tb
