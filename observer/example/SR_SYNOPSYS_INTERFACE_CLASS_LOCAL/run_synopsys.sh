rm -rf simv* csrc simv.daidir

vcs \
    -sverilog \
    -timescale="1ns/1ns" \
    DisplayElement.sv \
    Observer.sv \
    ../Subject.sv \
    ../WeatherData.sv \
    ../CurrentConditionsDisplay.sv \
    ../StatisticsDisplay.sv \
    ../ForecastDisplay.sv \
    ../WeatherStation.sv

simv +ntb_random_seed_automatic
