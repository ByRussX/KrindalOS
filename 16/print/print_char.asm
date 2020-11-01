;Input: DL = Character to print
;Output: DH = 0x0 (no error)

;Prints out character stored in DL

;16 bits Real Mode

[bits 16]
print_char:
	pusha
	pushf
	mov ah, 0xe
	mov al, dl
	int 0x10
	popf
	popa
	mov dh, 0x0
	ret
	