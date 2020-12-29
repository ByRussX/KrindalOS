kernel.bin : entry.o kernel.o
	ld -o $@ -Ttext 0x1000 $^ --oformat binary

kernel.o : kernel/kernel.c
	gcc -ffreestanding -c $< -o $@

entry.o : kernel/entry.asm
	nasm $< -f elf -o $@

