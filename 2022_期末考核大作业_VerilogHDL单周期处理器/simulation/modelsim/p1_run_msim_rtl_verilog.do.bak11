transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Desktop/p1_1.0/p1_1.0 {D:/Desktop/p1_1.0/p1_1.0/pc.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/p1_1.0/p1_1.0 {D:/Desktop/p1_1.0/p1_1.0/npc.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/p1_1.0/p1_1.0 {D:/Desktop/p1_1.0/p1_1.0/MUX.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/p1_1.0/p1_1.0 {D:/Desktop/p1_1.0/p1_1.0/mips.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/p1_1.0/p1_1.0 {D:/Desktop/p1_1.0/p1_1.0/GPR.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/p1_1.0/p1_1.0 {D:/Desktop/p1_1.0/p1_1.0/EXT.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/p1_1.0/p1_1.0 {D:/Desktop/p1_1.0/p1_1.0/dm.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/p1_1.0/p1_1.0 {D:/Desktop/p1_1.0/p1_1.0/ctr.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/p1_1.0/p1_1.0 {D:/Desktop/p1_1.0/p1_1.0/ALU.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/p1_1.0/p1_1.0 {D:/Desktop/p1_1.0/p1_1.0/im.v}

vlog -vlog01compat -work work +incdir+D:/Desktop/p1_1.0/p1_1.0 {D:/Desktop/p1_1.0/p1_1.0/testp1.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc"  testp1

add wave *
view structure
view signals
run -all
