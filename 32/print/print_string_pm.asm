;Input: [EBX] = String to be printed
;Output: DH = 0x0 (no error)

;Prints out string pointed by EBX

;32 bits Protected Mode


[bits 32]
print_string_pm:
	pusha
	pushf
	mov edx, VIDEO_MEMORY_

	.print_string_pm_loop:
		mov al, [ebx]
		mov ah, WHITE_ON_BLACK_
		cmp al, 0x0
		je .print_string_pm_done
		mov [edx], ax
		add ebx, 0x1
		add edx, 0x2
		jmp .print_string_pm_loop

	.print_string_pm_done:
		popf
		popa
		ret

VIDEO_MEMORY_ equ 0xb8000
WHITE_ON_BLACK_ equ 0x0f
lol