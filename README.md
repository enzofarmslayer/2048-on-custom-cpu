# 2048 on a custom CPU

A microprogrammed CPU designed in VHDL for the Digilent Basys3 FPGA board, running the game 2048 written in the CPU's own assembly language. 

## What's in it

- **CPU** (`uprogCPU.vhd`, `ALU.vhd`): a microprogrammed processor with micro memory, program memory and a register file (`Mem/`).
- **Instruction set**: LD, LDI, STR, ADD, CMP, JMP, BEQ, BNE, MOV, IN and HALT.
- **I/O** (`IO/`): PS/2 keyboard input and VGA output with video RAM and a character ROM.
- **Game** (`assembly_code.txt`): 2048 written in the CPU's assembly language.
- **Assembler** (`assembly_to_hex.py`): a Python script that turns the assembly code into machine code for program memory.
- **Testbenches** (`*_tb.vhd`) for simulating the CPU and the full design.

## Building

From `projekt_skal_mikro/`, the `Makefile` lists the source files, the Basys3 constraints file (`Basys3.xdc`) and the testbench used for simulation.
