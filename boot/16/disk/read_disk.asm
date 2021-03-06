;Input: DL = Disk number, DH = Number of sectors to read
;Output: ES:BX = Read data location, DH = 0x0 (no error), 0x1 (error)

;Reads DH sectors from the disk DL (not including the bootloader), and writes them to ES:BX

;16 bits Real Mode

[bits 16]
read_disk:
    pusha
	pushf
    push dx
    mov ah, 0x2
    mov al, dh
    xor ch, ch
    xor dh, dh
    mov cl, 0x2
    int 0x13
	pop dx
    jc .disk_error
    cmp dh, al
    jne .disk_error
    popf
	popa
    xor dh, dh
    ret
	
	.disk_error:
		popf
		popa
		mov dh, 0x1
		ret
