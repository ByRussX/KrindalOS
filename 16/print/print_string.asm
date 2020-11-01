;Input: [BX] = String to be printed
;Output: DH = 0x0 (no error)

;Prints out string pointed by BX

;16 bits Real Mode

[bits 16]
print_string:
    pusha
	pushf
    mov ah, 0xe

print_string_loop_:
	mov al,[bx]
	cmp al, 0x0
	je print_string_end_
	int 0x10
	inc bx
	jmp print_string_loop_

print_string_end_:
	popf
	popa
	mov dh, 0x0
	ret