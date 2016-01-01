class WeatherData implements Subject;
    protected Observer observers[$] = {};
    protected real temperature;
    protected real humidity;
    protected real pressure;

    virtual function void registerObserver(Observer o);
        observers.push_back(o);
    endfunction // registerObserver
    
    virtual function void removeObserver(Observer o);
        int ix[$];
        ix = observers.find_index with ( item == o);
                
        foreach (ix[i]) begin
            observers.delete(ix[i]);
        end
    endfunction // removeObserver

    virtual function void notifyObservers();
        foreach (observers[i]) begin
            observers[i].update(temperature, humidity, pressure);
        end
    endfunction // notifyObserver
    
    function void measurementsChanged();
        notifyObservers();
    endfunction // measurementsChanged
    
    function void setMeasurements(real temperature, real humidity, real pressure);
        this.temperature = temperature;
        this.humidity = humidity;
        this.pressure = pressure;
        measurementsChanged();
    endfunction // setMeasurments

    function real getTemperature();
        return temperature;
    endfunction // getTemperature

    function real getHumidity();
        return humidity;
    endfunction // getHumidity
    
    function real getPressure();
        return pressure;
    endfunction // getPressure
    
endclass // WeatherData
