# SnakeOS
A experimental Snake Game designed as a kernel

A simply bootloader reads kernel code and loads it to memory, switches CPU to protected mode and jumps to kernel code.

Kernel consists of assembly and C codes. Assembly part sets DS, SS, GS, esp etc. to appropriate values and calls C code function.  

C code implements a simple snake game. It uses VGA memory to display characters on screen. For keyboard input it simply reads a port of PS/2 Controller. 

An disket image is prepared to store bootloader, kernel codes and loaded by a virtual machine simulator. 

Project video : https://youtu.be/psoVtD-2Uzg

Tools :
  - NASM version 2.07 compiled on Jul 19 2009
  - gcc version 4.9.3 (GCC)
  - GNU ld (GNU Binutils) 2.25.1
  - GNU objcopy (GNU Binutils) 2.25.1
  - objconv: Object file converter version 2.51 for x86 and x86-64
  - WinImage 9.00
  - WMLite 3.2.6
