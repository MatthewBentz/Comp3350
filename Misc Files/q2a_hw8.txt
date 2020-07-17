TITLE Question #2 HW8              (main.asm)

INCLUDE Irvine32.inc
.data
	
	message BYTE "Enter eax value: ",0
	
.code
main PROC   
	
	mov edx, OFFSET message
	call WriteString
	call ReadInt
	mov ebx,eax		; store input in ebx

	; eax * 27 = (eax*16) + (eax*8) + (eax*2) + (eax*1)
	
	shl eax,4		; 2^4 = 16
	push eax		; eax = eax*16
	mov eax,ebx

	shl eax,3		; 2^3 = 8
	push eax		; eax = eax*8
	mov eax,ebx

	shl eax,1		; 2^1 = 2
	push eax		; eax = eax*2
	mov eax,ebx		; eax = input (eax*1) for addition

	mov ecx,3
L1:
	pop ebx
	add eax, ebx
	loop L1

	call WriteInt

exit
main ENDP
END main

