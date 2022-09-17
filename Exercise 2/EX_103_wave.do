# compile

vlog EX_103.v
vlog EX_103_tb.v

# simulate
vsim -debugdb testbench

#probe signals
add wave -noupdate -format -literal -radix hex /testbench/EX103_instance/a
add wave -noupdate -format -literal -radix hex /testbench/EX103_instance/b
add wave -noupdate -format -literal -radix hex /testbench/EX103_instance/out3
add wave -noupdate -format -logic	       /testbench/EX103_instance/out2
add wave -noupdate -format -logic	       /testbench/EX103_instance/out1

# 200 ns
run 200
