vsim -gui work.remaindercalculator

add wave -position insertpoint sim:/remaindercalculator/*
force -freeze sim:/remaindercalculator/clk 0 0, 1 {50 ns} -r 100
force -freeze sim:/remaindercalculator/rst 1 0
force -freeze sim:/remaindercalculator/start 0 0
force -freeze sim:/remaindercalculator/A 255 0
force -freeze sim:/remaindercalculator/B 14 0
run
force -freeze sim:/remaindercalculator/rst 0 0
force -freeze sim:/remaindercalculator/start 1 0
force -freeze sim:/remaindercalculator/A 50 0
force -freeze sim:/remaindercalculator/B 7 0
run


force -freeze sim:/remaindercalculator/A 255 0
force -freeze sim:/remaindercalculator/B 14 0
run
force -freeze sim:/remaindercalculator/A 13 0
force -freeze sim:/remaindercalculator/B 9 0
run
force -freeze sim:/remaindercalculator/A 25 0
force -freeze sim:/remaindercalculator/B 5 0
run
force -freeze sim:/remaindercalculator/A 27 0
force -freeze sim:/remaindercalculator/B 2 0
run
force -freeze sim:/remaindercalculator/B 11 0
run