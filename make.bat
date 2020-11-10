gcc kernel\kernel.c -Wall -pedantic-errors -nostdlib -Wl,-Ttext=0x0 -o kernel.o
objcopy -O binary -j .text kernel.o kernel.bin
nasm -f bin boot\boot.asm -o boot.bin
copy /b boot.bin + kernel.bin os.img
del kernel.o kernel.bin boot.bin