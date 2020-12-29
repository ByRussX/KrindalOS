nasm -f bin boot\boot.asm -o boot.bin


cd drivers
gcc -c *.c -Wall -ffreestanding -nostdlib -I ..\include\
cd ..

cd kernel
gcc -c *.c -Wall -ffreestanding -nostdlib -I ..\include\
cd ..

nasm -f win32 kernel\entry.asm -o kernel\entry.o
ld -T linker.ld -o kernel.exe


objcopy -O binary -j .text kernel.exe kernel.bin
copy /b boot.bin + kernel.bin os.img

del *.bin *.elf *.o