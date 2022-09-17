# compile

vlog EX_105.v
vlog EX_105_tb.v

# simulate
vsim -debugdb testbench

#probe signals
add wave -noupdate -format -literal -radix hex /testbench/EX105_instance/a
add wave -noupdate -format -literal -radix hex /testbench/EX105_instance/b
add wave -noupdate -format -literal -radix hex /testbench/EX105_instance/c
add wave -noupdate -format -literal -radix hex /testbench/EX105_instance/d
add wave -noupdate -format -literal -radix hex /testbench/EX105_instance/e
add wave -noupdate -format -literal -radix hex /testbench/EX105_instance/f
add wave -noupdate -format -logic	       /testbench/EX105_instance/sel1
add wave -noupdate -format -logic	       /testbench/EX105_instance/sel2
add wave -noupdate -format -logic	       /testbench/EX105_instance/sel3
add wave -noupdate -format -logic	       /testbench/EX105_instance/sel4
add wave -noupdate -format -logic	       /testbench/EX105_instance/sel5
add wave -noupdate -format -literal -radix hex /testbench/EX105_instance/g

# 250 ns
run 250
