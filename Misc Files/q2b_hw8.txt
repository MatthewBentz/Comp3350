TITLE Question #2 HW8              (main.asm)

INCLUDE Irvine32.inc
.data

	valueDH BYTE "DH = ",0
	valueDL BYTE "DL = ",0

.code
main PROC   
	
	; eax * 10 = (eax*8) + (eax*2)

	mov eax, 0ABCD1234h
	and eax, 0000FFFFh
	mov edx, eax
	and edx, 00000F0Fh	; edx = 00000204h

	push eax
	shr eax, 12			; eax = 1h
	shl eax, 3			; eax = eax * 8
	mov ebx, eax		; store eax
	shr eax, 2			; eax = eax * 2
	add eax, ebx		; eax = 1*8 + 1*2
	add dh, al			; dh = 02h + 10d

	pop eax
	and eax, 000000F0h	; eax = 0030h
	shr eax, 4			; eax = 3h
	shl eax, 3			; eax = eax * 8
	mov ebx, eax		; store eax
	shr eax, 2			; eax = eax * 2
	add eax, ebx		; eax = 3*8 + 3*2
	add dl, al			; dl = 04h + 30d

	mov ebx, edx		; store edx for printing

	mov edx, offset valueDH
	call WriteString
	mov al, bh
	call WriteInt
	call Crlf

	mov edx, offset valueDL
	call WriteString
	mov al, bl
	call WriteInt
	call Crlf

exit
main ENDP
END main

