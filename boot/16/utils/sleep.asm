;Input: CX:DX = Time to sleep (microseconds)
;Output: DH = 0x0 (no error)

;Sleeps CX:DX microseconds

;16 bits Real Mode

[bits 16]
sleep:
	pusha
	pushf
	mov ah, 0x86
	int 0x15
	popf
	popa
	xor dh, dh
	ret
