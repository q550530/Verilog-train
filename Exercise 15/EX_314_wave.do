# compile
 vlog EX_314.v
#vlog EX_314_nonblocking.v
#vlog EX_314_blocking.v

vlog EX_314_tb.v

# simulate
vsim -debugdb testbench

#probe signals
add wave -noupdate -format -logic              /testbench/EX314_instance/reset
add wave -noupdate -format -logic              /testbench/EX314_instance/clk
add wave -noupdate -format -literal -radix dec /testbench/EX314_instance/a
add wave -noupdate -format -literal -radix dec /testbench/EX314_instance/a_reg
add wave -noupdate -format -literal -radix dec /testbench/EX314_instance/b
add wave -noupdate -format -literal -radix dec /testbench/EX314_instance/b_reg
add wave -noupdate -format -literal -radix dec /testbench/EX314_instance/mul_reg
add wave -noupdate -format -literal -radix dec /testbench/EX314_instance/acc_reg
add wave -noupdate -format -literal -radix dec /testbench/EX314_instance/acc_out
# 800 ns
run 800
