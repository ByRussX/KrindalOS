[org 0x7c00]

[bits 16]
init:
	xor ax, ax
	mov ds, ax
	mov es, ax
	mov ss, ax
	
	mov ax, 0x9000
	mov sp, ax
	mov bp, ax
	
	mov [DRIVE], dl
	
	call clear_screen
	
	jmp start_16


[bits 16]
start_16:
	; mov bx, RM_MSG
	; call print_string_rm
	
	; mov bx, NL
	; call print_string_rm
	
	mov bx, KERN_OFFSET
	mov dl, [DRIVE]
	mov dh, 0x1
	
	call read_disk
	
	
	cmp dh, 0x0
	
	je .success
	
	.error:
		mov bx, KERN_MSG_ERR
		call print_string_rm
		
		mov bx, NL
		call print_string_rm
		
		jmp $
		
	.success:
		
		; mov bx, KERN_MSG
		; call print_string_rm
		
		; mov dx, es
		; call print_hex

		; mov dl, ':'
		; call print_char

		; mov dx, KERN_OFFSET
		; call print_hex
		
		; mov bx, NL
		; call print_string_rm

		jmp switch_16to32
	
	jmp $


[bits 32]
start_32:

	; mov cl, 0x0f
	; xor al, al
	
	; mov ebx, PM_MSG
	; call print_string_pm
	
	call KERN_OFFSET
	
	jmp $

;Variables y constantes

start_variables:
	DRIVE db 0x0
	RM_MSG db "Modo Real de 16 bits", 0x0
	PM_MSG db "Modo Protegido de 32 bits", 0x0
	KERN_MSG db "Kernel cargado en ", 0x0
	KERN_MSG_ERR db "Error al cargar el kernel", 0x0
	
	NL db 0xa, 0xd, 0x0
	
	KERN_OFFSET equ 0x1000
end_variables:


;Importar

start_includes:
	%include "globals/gdt.asm"
	%include "globals/switch.asm"
	
	%include "16/print/print_string_rm.asm"
	%include "16/print/print_char.asm"
	%include "16/print/print_hex.asm"
	
	%include "16/utils/clear_screen.asm"
	%include "16/disk/read_disk.asm"
	
	%include "32/print/print_string_pm.asm"
end_includes:


;Rellenar el sector de arranque
times 510 -($ - $$) db 0x0
dw 0xaa55

;Crear más sectores en el disco

eof: