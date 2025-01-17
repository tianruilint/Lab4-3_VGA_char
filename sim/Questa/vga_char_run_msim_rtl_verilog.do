transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/FPGA/Lab4/VGA_char/quartus_prj/ip_core {D:/FPGA/Lab4/VGA_char/quartus_prj/ip_core/clk_gen.v}
vlog -vlog01compat -work work +incdir+D:/FPGA/Lab4/VGA_char/rtl {D:/FPGA/Lab4/VGA_char/rtl/vga_pic.v}
vlog -vlog01compat -work work +incdir+D:/FPGA/Lab4/VGA_char/rtl {D:/FPGA/Lab4/VGA_char/rtl/vga_ctrl.v}
vlog -vlog01compat -work work +incdir+D:/FPGA/Lab4/VGA_char/rtl {D:/FPGA/Lab4/VGA_char/rtl/vga_char.v}
vlog -vlog01compat -work work +incdir+D:/FPGA/Lab4/VGA_char/quartus_prj/db {D:/FPGA/Lab4/VGA_char/quartus_prj/db/clk_gen_altpll.v}

vlog -vlog01compat -work work +incdir+D:/FPGA/Lab4/VGA_char/quartus_prj/../sim {D:/FPGA/Lab4/VGA_char/quartus_prj/../sim/tb_vga_char.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_vga_char

add wave *
view structure
view signals
run 1 us
