[org 0x7c00]

[bits 16]
init:
	mov ax, 0x0
	mov ds, ax
	mov es, ax
	
	mov ax, 0x9000
	mov bp, ax
	mov sp, ax
	
	jmp start_16



start_16:
	mov bx, switch_to_32b
	call print_string
	call switch_16to32
	
	jmp $


[bits 32]
start_32:

	mov ah, 0x0f
	mov ebx, switch_completed
	call print_string_pm
	
	jmp $


;Variables y constantes

start_variables:
	switch_to_32b db "Cambiando a modo protegido de 32 bits", 0x0
	switch_completed db "Cambio a 32 bits realizado con exito!", 0x0
end_variables:


;Importar

start_includes:
	%include "globals/gdt.asm"
	%include "globals/switch.asm"
	%include "16/print/print_string.asm"
	%include "32/print/print_string_pm.asm"
end_includes:


;Rellenar el sector de arranque
times 510 -($ - $$) db 0x0
dw 0xaa55

;Crear más sectores en el disco

eof: