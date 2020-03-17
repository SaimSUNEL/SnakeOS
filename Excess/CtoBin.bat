gcc -ffreestanding -c -o kernel.o Kernel.c
ld -T NUL -o kernel.tmp -Ttext 0x8000 kernel.o
objcopy -O binary -j .text kernel.tmp kernel.bin