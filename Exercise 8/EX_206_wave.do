# compile

vlog EX_206.v
vlog EX_206_tb.v

# simulate
vsim -debugdb testbench

#probe signals
add wave -noupdate -format -literal -radix bin /testbench/EX206_instance/a
add wave -noupdate -format -literal -radix bin /testbench/EX206_instance/sel
add wave -noupdate -format -literal -radix bin /testbench/EX206_instance/b

# 80 ns
run 80
