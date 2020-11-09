GCCFLAGS = -ffreestanding -c
LDFLAGS = -Ttext 0x0 --oformat binary
NASMFLAGS = -f bin

CLEANFILENAMES = boot.bin kernel.bin kernel.o

all:
	make build
	make clean
	make run

os.img : boot.bin kernel.bin
	cat boot.bin kernel.bin > os.img
boot.bin : boot.asm
	nasm $< $(NASMFLAGS) -o $@
kernel.bin : kernel.o
	ld $< $(LDFLAGS) -o $@
kernel.o : kernel.c
	gcc $< $(GCCFLAGS) -o $@
	
build:
	make os.img

clean:
	rm $(CLEANFILENAMES)
	
run:
	qemu-system-i386 os.img
