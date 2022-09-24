# compile

vlog EX_210.v
vlog EX_210_tb.v

# simulate
vsim -debugdb testbench

#probe signals
add wave -noupdate -format -logic /testbench/EX210_instance/a
add wave -noupdate -format -logic /testbench/EX210_instance/b
add wave -noupdate -format -logic /testbench/EX210_instance/c
add wave -noupdate -format -logic /testbench/EX210_instance/d
add wave -noupdate -format -logic /testbench/EX210_instance/e
add wave -noupdate -format -logic /testbench/EX210_instance/f
add wave -noupdate -format -logic /testbench/EX210_instance/g
add wave -noupdate -format -logic /testbench/EX210_instance/h
add wave -noupdate -format -logic /testbench/EX210_instance/out0
add wave -noupdate -format -logic /testbench/EX210_instance/out1
add wave -noupdate -format -logic /testbench/EX210_instance/out2

# 450 ns
run 450
