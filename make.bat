nasm -f bin -o boot.bin boot.asm
getraw.py kernel.c kernel.bin
copy /b  boot.bin + kernel.bin os.img