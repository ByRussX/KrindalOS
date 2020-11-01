;Input: -
;Output: -

;Switches from 16 bits RM to 32 bits PM

;16 bits Real Mode

[bits 16]
switch:
	
	cli
	
	lgdt [gdt_descriptor]
	
	mov eax, cr0
	or eax, 0x1
	mov cr0, eax
	
	jmp CODE_SEG:switch_32
	
	jmp $


[bits 32]
switch_32:
	mov ax, DATA_SEG
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov fs, ax
	mov gs, ax
	
	mov ebp, 0x90000
	mov esp, ebp
	
	jmp start_32
