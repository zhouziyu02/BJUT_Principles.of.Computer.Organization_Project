# 2022年 北京工业大学 信息学部 计算机科学与技术专业 《计算机组成原理》课内大作业 及 小学期课程设计

2022年由于Covid-19，《计算机组成原理》的期末考试以大作业检查的形式进行，内容为往年小学期的第一个project：VerilogHDL设计单周期处理器

## Logisim单周期处理器

1.处理器应支持的指令集MIPS-Lite: addu, subu, ori, lw, sw, beq, lui, j 
> a) (addu,subu可以不支持实现溢出)

2.处理器为单周期设计

## VerilogHDL单周期处理器

1.处理器应实现MIPS-Lite1指令集

>a)	MIPS-Lite1＝{MIPS-Lite, addi, addiu, slt, jal, jr}

>b)	MIPS-Lite指令集: {addu, subu, ori, lw, sw, beq, lui, j}

>c)	addi应支持溢出，溢出标志写入寄存器$30中第0位


2.处理器为单周期设计

## VerilogHDL多周期处理器

1.处理器应实现MIPS-Lite2指令集

>a)	MIPS-Lite2＝{MIPS-Lite1, lb, sb}

>b)	MIPS-Lite1: {addu, subu, ori, lw, sw, beq, j, lui, addi, addiu, slt, jal, jr}

>c)	addi应支持溢出，溢出标志写入寄存器$30中第0位

2.处理器为多周期设计


## MIPS微系统开发

1.MIPS微系统应包括: MIPS处理器、系统桥和1个定时器，32位输入设备、32位输出设备

2.MIPS处理器应实现MIPS-Lite3指令集
   
>a)	MIPS-Lite3＝{MIPS-Lite2, ERET, MFC0, MTC0}

>b)	MIPS-Lite2＝{addu, subu, ori, lw, sw, beq, lui, addi, addiu, slt, j, jal, jr, lb, sb}

>c) addi应支持溢出，溢出标志写入寄存器$30中第0位

3.MIPS处理器为多周期设计

4.MIPS 微系统支持定时器硬件中断
