OUTPUT_FORMAT(pe-i386)

ENTRY(_start)

INPUT
(
	kernel/entry.o
    kernel/kernel.o
	
	drivers/low_level.o
	drivers/print.o
)

OUTPUT
(
    kernel.exe
)

SECTIONS
{
	 __kernel_start = .;
    . = 0x8000;
    .text : {
        *(.text)
        *(.data)
        *(.rodata)
        *(COMMON)
        *(.bss)
    }
	 __kernel_end = .;
}