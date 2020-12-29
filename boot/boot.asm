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
	KERN_MSG_ERR db "Error al cargar el kernel", 0x0
	
	NL db 0xa, 0xd, 0x0
	
	KERN_OFFSET equ 0x8000
end_variables:


;Importar

start_includes:
	%include "boot/globals/gdt.asm"
	%include "boot/globals/switch.asm"
	
	%include "boot/16/print/print_string_rm.asm"
	%include "boot/16/print/print_char.asm"
	%include "boot/16/print/print_hex.asm"
	
	%include "boot/16/utils/clear_screen.asm"
	%include "boot/16/disk/read_disk.asm"
	
	%include "boot/32/print/print_string_pm.asm"
end_includes:

;Rellenar el sector de arranque
times 510 -($ - $$) db 0x0
dw 0xaa55

;Crear más sectores en el disco

eof: