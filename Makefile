GCCFLAGS = -Wall -pedantic-errors -nostdlib -Wl,-Ttext=0x0
NASMFLAGS = -f bin
OBJCOPYFLAGS = -O binary -j .text

CLEANFILENAMES = boot.bin kernel.bin kernel.o

os.img : boot.bin kernel.bin
	cat boot.bin kernel.bin > os.img
boot.bin : boot.asm
	nasm $< $(NASMFLAGS) -o $@
kernel.bin : kernel.o
	objcopy $(OBJCOPYFLAGS) $< $@
kernel.o : kernel.c
	gcc $< $(GCCFLAGS) -o $@
	
build:
	make os.img

clean:
	rm $(CLEANFILENAMES)
	
run:
	qemu-system-i386 os.img

all:
	make build
	make clean
	make run
