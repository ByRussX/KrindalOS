;Input: -
;Output: DH = 0x0 (no error)

;Clear screen

;16 bits Protected Mode

[bits 16]
clear_screen:
    pusha
	pushf

    mov ah, 0x7
    xor al, al
    mov bh, 0x7
    xor cx, cx
    mov dh, 0x18
    mov dl, 0x4f
    int 0x10

    popf
	popa
	xor dh, dh
    ret