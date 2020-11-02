[bits 16]
[org 0x7c00]

jmp 0x0000:start_16

start_16:
    mov ax, 0x0
    mov ds, ax
    mov es, ax
	
	mov ax, 0x9000
	mov bp, ax
	mov sp, ax

start:
	mov bx, switch_to_32b
	call print_string
	call switch
	
	jmp $


[bits 32]
start_32:
	mov ebx, switch_completed
	call print_string_pm
	
	jmp $




;Importar
%include "16/print/print_string.asm"
%include "switch_16_32/gdt.asm"
%include "switch_16_32/switch.asm"
%include "32/print/print_string_pm.asm"


switch_to_32b db "Cambiando a modo protegido de 32 bits", 0x0
switch_completed db "Cambio a 32 bits realizado con exito!", 0x0



;Rellenar el sector de arranque
times 510 -($ - $$) db 0x0
dw 0xaa55

;Crear más sectores en el disco
