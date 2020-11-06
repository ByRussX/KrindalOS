nasm -f bin -o boot.bin boot.asm

gcc -Wall -pedantic-errors kernel.c -o kernel.o -nostdlib -Wl,-Ttext=0x0
objcopy -O binary -j .text kernel.o kernel.bin
del kernel.o
ndisasm -b 32 kernel.bin

copy /b  boot.bin + kernel.bin os.img