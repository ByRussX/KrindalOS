;Input: -
;Output: 0x1 (error)

;Waits for a key, then reboots the computer

;16 bits Real Mode

[bits 16]
key_reboot:
	pusha
	pushf
	xor ax, ax
	int 0x16
	jmp 0xffff:0x0000
	popf
	popa
	mov dh, 0x1
	ret
