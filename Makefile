GCCFLAGS = -Wall -pedantic-errors -nostdlib -Wl,-Ttext=0x0
OBJCOPYFLAGS = -O binary -j .text
NASMFLAGS = -f bin

CLEANFILENAMES = boot.bin kernel.bin kernel.o

all:
	make build
	make clean
	make run

os.img : boot.bin kernel.bin
	cat boot.bin kernel.bin > os.img
boot.bin : boot/boot.asm
	nasm $< $(NASMFLAGS) -o $@
kernel.bin : kernel.o
	objcopy $(OBJCOPYFLAGS) $< $@
kernel.o : kernel/kernel.c
	gcc $< $(GCCFLAGS) -o $@
	
build:
	make os.img

clean:
	rm $(CLEANFILENAMES)
	
run:
	qemu-system-i386 os.img
