# compile

vlog EX_313.v
vlog EX_313_tb.v

# simulate
vsim -debugdb testbench

#probe signals
add wave -noupdate -format -logic              /testbench/EX313_instance/reset
add wave -noupdate -format -logic              /testbench/EX313_instance/clk
add wave -noupdate -format -literal -radix dec /testbench/EX313_instance/a
add wave -noupdate -format -literal -radix dec /testbench/EX313_instance/b
add wave -noupdate -format -literal -radix dec /testbench/EX313_instance/c
add wave -noupdate -format -literal -radix hex /testbench/EX313_instance/d1
add wave -noupdate -format -literal -radix hex /testbench/EX313_instance/d2
add wave -noupdate -format -literal -radix hex /testbench/EX313_instance/d3
add wave -noupdate -format -literal -radix hex /testbench/EX313_instance/d4
add wave -noupdate -format -literal -radix dec /testbench/EX313_instance/g

# 800 ns
run 800
