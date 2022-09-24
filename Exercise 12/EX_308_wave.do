# compile

vlog EX_308.v
vlog EX_308_tb.v

# simulate
vsim -debugdb testbench

#probe signals
add wave -noupdate -format -logic              /testbench/EX308_instance/reset
add wave -noupdate -format -logic              /testbench/EX308_instance/clk
add wave -noupdate -format -literal -radix hex /testbench/EX308_instance/a
add wave -noupdate -format -literal -radix hex /testbench/EX308_instance/b
add wave -noupdate -format -literal -radix bin /testbench/EX308_instance/sel
add wave -noupdate -format -literal -radix hex /testbench/EX308_instance/q

# 300 ns
run 300
