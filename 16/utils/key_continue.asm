;Input: [BX] = Message to be printed on pause
;Output: 0x0 (no error)

;Pauses untill a key is pressed with a message

;16 bits Real Mode

[bits 16]
key_continue:
	pusha
	pushf
	call print_string
	mov ax, 0x0
	int 0x16
	popf
	popa
	mov dh, 0x0
	ret