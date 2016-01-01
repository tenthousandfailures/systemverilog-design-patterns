rm -rf work
vlib work

vlog -sv -mfcu \
    DisplayElement.sv \
    Observer.sv \
    Subject.sv \
    WeatherData.sv \
    CurrentConditionsDisplay.sv \
    StatisticsDisplay.sv \
    ForecastDisplay.sv \
    WeatherStation.sv

vsim -c tb -do "run -all"
