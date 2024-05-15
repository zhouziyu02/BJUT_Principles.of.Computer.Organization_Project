transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Desktop/project1 {D:/Desktop/project1/sb.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/project1 {D:/Desktop/project1/PC.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/project1 {D:/Desktop/project1/NPC.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/project1 {D:/Desktop/project1/mips.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/project1 {D:/Desktop/project1/lb.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/project1 {D:/Desktop/project1/IR.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/project1 {D:/Desktop/project1/GPR.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/project1 {D:/Desktop/project1/EXT.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/project1 {D:/Desktop/project1/DM.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/project1 {D:/Desktop/project1/Controller.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/project1 {D:/Desktop/project1/ALU.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/project1 {D:/Desktop/project1/rega.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/project1 {D:/Desktop/project1/regb.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/project1 {D:/Desktop/project1/regaluout.v}
vlog -vlog01compat -work work +incdir+D:/Desktop/project1 {D:/Desktop/project1/im_1k.v}

vlog -vlog01compat -work work +incdir+D:/Desktop/project1 {D:/Desktop/project1/test.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiii_ver -L rtl_work -L work -voptargs="+acc"  test

add wave *
view structure
view signals
run -all
