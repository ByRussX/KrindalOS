# ByOS
A toy OS developed in assembly and C

# How is this working?
`boot.asm` -> Bootloader

`kernel.c` -> Kernel

`16/` -> Libraries and functions for 16 bits Real Mode.

`32/` -> Libraries and functions for 32 bits Protected Mode.

`globals/` -> Libraries to switch from 16 bits Real Mode to 32 bits Protected Mode.

The `boot.asm` file loads `kernel.bin` (compiled from `kernel.c`) into memory, then jumps to it and starts executing code. The folders `16/` and `32/` contain some files not used in the bootloader, but they can be used in other projects

# Linux
For Linux users, is just needed to have `NASM` (https://www.nasm.us/) and `QEMU` (for emulation) (https://www.qemu.org/); since all `coreutils` and `binutils` are already downloaded.

# Windows
For Windows users, apart of the Linux requisites, `binutils` and `coreutils` are required. `Binutils` and `GCC` can be obtained by installing `MinGW` (http://www.mingw.org/). `QEMU` and `NASM` can be obtained from the same sources as Linux, and `coreutils`, with the libraries (that come apart), can be downloaded from GNUWin32 (http://gnuwin32.sourceforge.net/packages/coreutils.htm).

# How to build?
Run `make` to create the `os.img` file, then `make clear` to clear not-needed bin files, and then `make run` to run `os.img` via `qemu-system-i386`
