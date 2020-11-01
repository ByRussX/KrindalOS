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
    mov ch, 0x0
    mov dh, 0x0
    mov cl, 0x2
    int 0x13
	pop dx
    jc disk_error_
    cmp dh, al
    jne disk_error_
    popf
	popa
    mov dh, 0x0
    ret
	
disk_error_:
	popf
	popa
	mov dh, 0x1
	ret
