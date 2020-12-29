# ByOS
Toy operative system for x86 coded in Assembly and C.

![alt text](https://github.com/ByRussX/KrindalOS/blob/master/res/logo.png)

# How is this working?
`boot/boot.asm` -> Bootloader

`boot/kernel.c` -> Kernel

`boot/16/` -> Libraries and functions for 16 bits Real Mode.

`boot/32/` -> Libraries and functions for 32 bits Protected Mode.

`boot/globals/` -> Libraries to switch from 16 bits Real Mode to 32 bits Protected Mode.

The `boot.bin` (assembled from `boot/boot.asm`) file loads `kernel.bin` (compiled from boot/`kernel.c`) into memory, then jumps to it and starts executing code. This two files are joined together into `os.img`. The folders `boot/16/` and `boot/32/` contain some files not used in the bootloader, but they can be used in other projects. The folder `drivers/` hasn't been used yet.

# Linux
For Linux users, is just needed to have `NASM` (https://www.nasm.us/) and `QEMU` (just for emulation, not obligatory) (https://www.qemu.org/); since all `coreutils` and `binutils` are already downloaded.

# Windows
Step 1º: Change to Linux

Step 2º: In case step 1 didn't work, try again :)

Good luck

# How to build?
Run `make build` to create the `os.img` file, then `make clean` to clean not-needed bin files, and then `make run` to run `os.img` via `qemu-system-i386`. You can just run `make`or `make all`, which is equivalent to `make build`, `make clean` and `make run`, in that order.

ATENTION: This booloader will only compile and run on computers having `x86` architecture. If you try it on other architecture (e.g `ARM`), the result is unexpected, at least from the part of the kernel compiling.

# License
All the code is licensed under the GNU Public License v3.0 
https://www.gnu.org/licenses/gpl-3.0.html
