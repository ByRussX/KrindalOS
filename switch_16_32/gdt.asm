;Input: -
;Output: -

;Defines GDT and GDT descriptor for switching to 32 bits protected mode

;16 bits Real Mode

[bits 16]
gdt_start:

gdt_null_:
	dq 0x0

gdt_code_:
	dw 0xffff
	dw 0x0
	db 0x0
	db 10011010b
	db 11001111b
	db 0x0

gdt_data_:
	dw 0xffff
	dw 0x0
	db 0x0
	db 10010010b
	db 11001111b
	db 0x0

gdt_end_:

gdt_descriptor:
	dw gdt_end_ - gdt_start - 1
	dd gdt_start

CODE_SEG equ gdt_code_ - gdt_start
DATA_SEG equ gdt_data_ - gdt_start