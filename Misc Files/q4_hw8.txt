TITLE Question #4 HW8              (main.asm)

INCLUDE Irvine32.inc
.data

	prompt BYTE "Enter a value for BX: ",0
	binary BYTE "Binary representation: ",0

.code
main PROC   
	
	; Read value from input
	mov edx, offset prompt
	call WriteString
	call ReadInt
	mov ebx, eax

	; print binary representation
	call Crlf
	mov edx, offset binary
	call WriteString

	; calculate binary representation
	mov ecx, 16
L1:
	shl bx,1		; shift bx left 1
	jnc L2			; if there is not a carry, print 0
	mov eax,1		; else, print 1
	call WriteDec	; use WriteDec to not show +
	jmp L3
L2:	
	mov eax,0
	call WriteDec
L3:
	loop L1

exit
main ENDP
END main

