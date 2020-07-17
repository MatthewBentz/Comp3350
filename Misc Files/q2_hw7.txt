TITLE Question #2 HW7              (main.asm)

INCLUDE Irvine32.inc

KEY = 19					; last two numbers in student ID

.data

	buffer	BYTE "Matthew Bentz",0h

.code
main PROC   
	
	mov edx, OFFSET buffer
	call WriteString		; print plain text from data segment
	call Crlf

	mov ecx, SIZEOF buffer	; loop counter
	mov esi, 0				; index 0 in buffer
L1:
	xor buffer[esi],KEY		; encrypt with KEY value
	inc esi
	loop L1

	mov edx, OFFSET buffer
	call WriteString		; print cipher text
	call Crlf

	mov ecx, SIZEOF buffer	; loop counter
	mov esi, 0				; index 0 in buffer
L2:
	xor buffer[esi],KEY		; decrypt with KEY value
	inc esi
	loop L2

	mov edx, OFFSET buffer
	call WriteString		; print decoded text
	call Crlf

exit
main ENDP
END main

