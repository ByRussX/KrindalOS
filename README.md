# ByOS
A toy OS developed in assembly and C

# Linux
For Linux users, is just needed to have `nasm` (https://www.nasm.us/) and `qemu` (for emulation) (https://www.qemu.org/); since all `coreutils` and `binutils` are already downloaded.

# Windows
For Windows users, apart of the Linux requisites, `binutils` and `coreutils` are required. `Binutils` and `gcc` can be obtained by installing `MinGW` (http://www.mingw.org/). `Qemu` and `nasm` can be obtained from the same sources as Linux, and `coreutils`, with the libraries (that come apart), can be downloaded from GNUWin32 (http://gnuwin32.sourceforge.net/packages/coreutils.htm).

# Tools needed/used to automatize building
·Linux or Windows (`coreutils`, `binutils` needed)

·nasm

·gcc

·objcopy

·qemu (qemu-system-i386)


# How to build?
Run `make` to create the `os.img` file, then `make clear` to clear not-needed bin files, and then `make run` to run `os.img` via `qemu-system-i386`