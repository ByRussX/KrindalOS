GCCFLAGS = -Wall -pedantic-errors -nostdlib -Wl,-Ttext=0x0
OBJCOPYFLAGS = -O binary -j .text

CLEANFILENAMES = boot.bin kernel.bin kernel/*.o


all:
	make build
	make clean
	make run

os.img : boot.bin kernel.bin
	cat boot.bin kernel.bin > os.img
boot.bin : boot/boot.asm
	nasm $< -f bin -o $@
kernel.bin : kernel/kernel.o kernel/start_kernel.o
	objcopy $(OBJCOPYFLAGS) $^ $@


kernel/kernel.o : kernel/kernel.c
	gcc $(GCCFLAGS) $< -o $@
kernel/start_kernel.o : kernel/kernel.asm
	nasm $< -f elf -o $@
	
build:
	make os.img

clean:
	rm $(CLEANFILENAMES)
	
run:
	qemu-system-i386 os.img
