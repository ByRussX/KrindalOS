;Input: DX = Hex number to print
;Output: ES:BX = Read data location, DH = 0x0 (no error), 0x1 (error)

;Prints out contents of DX as hex number

;16 bits Real Mode

[bits 16]
print_hex:
	pusha
	pushf
	mov cx, 0x4

char_loop_:
	dec cx
	mov ax, dx
	shr dx, 0x4
	and ax, 0xf

	mov bx, HEX_OUT_
	add bx, 0x2
	add bx, cx
	cmp ax, 0xa
	jl set_letter_
	add byte [bx], 0x7
	jl set_letter_

set_letter_:
	add byte[bx], al
	cmp cx, 0x0
	je print_hex_done_
	jmp char_loop_

print_hex_done_:
	mov bx, HEX_OUT_
	call print_string

	popf
	popa
	mov dh, 0x0
	ret

HEX_OUT_:
	db "0x0000", 0x0
