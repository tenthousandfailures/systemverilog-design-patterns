class CurrentConditionsDisplay implements Observer, DisplayElement;
    
    protected shortreal temperature;
    protected shortreal humidity;
    protected Subject weatherData;

    // TODO: why is this Subject instead of WeatherData?
    function new(Subject weatherData);
        this.weatherData = weatherData;
        weatherData.registerObserver(this);
    endfunction // new
    
    virtual function void update(shortreal temperature, shortreal humidity, shortreal pressure);
        this.temperature = temperature;
        this.humidity = humidity;
        display();
    endfunction // update
    
    virtual function void display();
        $display("Current conditions: %0d F degrees and %0d humidity", temperature, humidity);
    endfunction // display
    
endclass // CurrentConditionsDisplay
