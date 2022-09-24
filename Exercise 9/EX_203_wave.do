# compile

vlog EX_203.v
vlog EX_203_tb.v

# simulate
vsim -debugdb testbench

#probe signals
add wave -noupdate -format -literal -radix hex /testbench/EX203_instance/a
add wave -noupdate -format -literal -radix hex /testbench/EX203_instance/b
add wave -noupdate -format -literal -radix hex /testbench/EX203_instance/c
add wave -noupdate -format -literal -radix hex /testbench/EX203_instance/d
add wave -noupdate -format -literal -radix hex /testbench/EX203_instance/e
add wave -noupdate -format -literal -radix hex /testbench/EX203_instance/f

add wave -noupdate -format -logic	       /testbench/EX203_instance/sel1
add wave -noupdate -format -logic	       /testbench/EX203_instance/sel2
add wave -noupdate -format -logic	       /testbench/EX203_instance/sel3
add wave -noupdate -format -logic	       /testbench/EX203_instance/sel4
add wave -noupdate -format -logic	       /testbench/EX203_instance/sel5
add wave -noupdate -format -literal -radix hex /testbench/EX203_instance/g

# 300 ns
run 300
