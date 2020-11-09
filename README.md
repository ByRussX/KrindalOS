# ByOS
A toy OS developed in assembly and C

# How is this working?
`boot.asm` -> Bootloader

`kernel.c` -> Kernel

`16/` -> Libraries and functions for 16 bits Real Mode.

`32/` -> Libraries and functions for 32 bits Protected Mode.

`globals/` -> Libraries to switch from 16 bits Real Mode to 32 bits Protected Mode.

The `boot.asm` file loads `kernel.bin` (compiled from `kernel.c`) into memory, then jumps to it and starts executing code. The folders `16/` and `32/` contain some files not used in the bootloader, but they can be used in other projects.

# Linux
For Linux users, is just needed to have `NASM` (https://www.nasm.us/) and `QEMU` (just for emulation, not obligatory) (https://www.qemu.org/); since all `coreutils` and `binutils` are already downloaded.

# Windows
For Windows users, `MinGW`, `NASM` and `QEMU` (just for emulation, not obligatory) are needed, but a simplified version of the `Makefile` called `Makefile.bat` can be used to build everything. It will also delete the unneeded binary files, but it will not run the project.

# How to build?
Run `make build` to create the `os.img` file, then `make clean` to clean not-needed bin files, and then `make run` to run `os.img` via `qemu-system-i386`. You can just run `make`or `make all`, which is equivalent to `make build`, `make clean` and `make run`, in that order.

If you are on Windows, just run `makefile` on the terminal.

ATENTION: This booloader will only compile and run on computers having `x86` architecture. If you try it on other architecture (e.g `ARM`), the result is unexpected, at least from the part of the kernel compiling.

# License
All the code is licensed under the GNU Public License v3.0 
https://www.gnu.org/licenses/gpl-3.0.html
