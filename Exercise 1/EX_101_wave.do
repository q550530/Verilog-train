# compile

vlog EX_101.v
vlog EX_101_tb.v

# simulate
vsim -debugdb testbench

#probe signals
add wave -noupdate -format -logic /testbench/EX1_instance/a
add wave -noupdate -format -logic /testbench/EX1_instance/b
add wave -noupdate -format -logic /testbench/EX1_instance/c
add wave -noupdate -format -logic /testbench/EX1_instance/d
add wave -noupdate -format -logic /testbench/EX1_instance/e
add wave -noupdate -format -logic /testbench/EX1_instance/sel1
add wave -noupdate -format -logic /testbench/EX1_instance/sel2
add wave -noupdate -format -logic /testbench/EX1_instance/i
add wave -noupdate -format -logic /testbench/EX1_instance/j
add wave -noupdate -format -logic /testbench/EX1_instance/k
add wave -noupdate -format -logic /testbench/EX1_instance/f

# 70 ns
run 70
