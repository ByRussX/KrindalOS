;Input: [EBX] = String to be printed, CL = Special color/blink code, AL = Starting character
;Output: DH = 0x0 (no error)

;Prints out string pointed by EBX

;32 bits Protected Mode


[bits 32]
print_string_pm:
	pusha
	pushf
	
	mov edx, VIDEO_MEMORY_
	push ax
	xor eax, eax
	pop ax
	shl eax, 0x1
	add edx, eax

	.print_string_pm_loop:
		mov al, [ebx]
		cmp al, 0x0
		mov ah, cl
		je .print_string_pm_done
		mov [edx], ax
		add ebx, 0x1
		add edx, 0x2
		jmp .print_string_pm_loop

	.print_string_pm_done:
		popf
		popa
		xor dh, dh
		ret

VIDEO_MEMORY_ equ 0xb8000