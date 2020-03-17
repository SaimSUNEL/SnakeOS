gcc -ffreestanding -c Kernel.c -o kernel.o
nasm -felf32 intermediate.asm
ld -T NUL -o kernel.tmp -Ttext 0x8000  intermediate.o kernel.o
objcopy -O binary -j .text kernel.tmp kernel.bin