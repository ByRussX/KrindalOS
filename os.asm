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
	jmp switch

start_32:
	mov ebx, switch_completed
	call print_string_pm
	
	jmp $




;Importar
%include "16/print/print_string.asm"

%include "16/utils/sleep.asm"
%include "16/utils/key_continue.asm"


%include "switch_16_32/gdt.asm"
%include "switch_16_32/switch.asm"


%include "32/print/print_string_pm.asm"



; ;Valores
; FILE_COPY:
	; db 0x0
	
; FILE_COPY_DIRECTION:
	; dw 0x9000

; NEW_LINE:
    ; db 0xa, 0xd, 0x0

; ;Mensajes
; disk_success_message:
    ; db "Bootloader cargado, disco leido y cargado en ", 0x0

; disk_error_message:
    ; db "Bootloader cargado, error al leer el disco", 0x0

; start_message:
	; db "Inicio de bootloader", 0x0

; eof_message:
    ; db "Final de bootloader alcanzado", 0x0
	
; reboot_message:
	; db "Pulse una tecla para reiniciar", 0x0

switch_to_32b db "Cambiando a modo protegido de 32 bits...", 0x0

switch_completed db "Cambio a 32 bits realizado con exito!", 0x0



;Rellenar el sector de arranque
times 510 -($ - $$) db 0x0
dw 0xaa55

;Crear más sectores en el disco
