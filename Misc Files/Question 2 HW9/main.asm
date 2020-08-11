TITLE Question #2 HW9             (main.asm)

INCLUDE Irvine32.inc
.data

	val1String BYTE "Value 1 = ",0
	val2String BYTE "Value 2 = ",0
	resultString BYTE "Result = ",0
	val10 BYTE 99h
	val11 DWORD 99999999h
	val20 BYTE 00h
	val21 DWORD 00000001h

.code
main PROC   
	
	mov edx, OFFSET val1String
	call WriteString
	movzx eax, val10
	call WriteHex
	mov eax, val11
	call WriteHex
	call Crlf

	mov edx, OFFSET val2String
	call WriteString
	movzx eax, val20
	call WriteHex
	mov eax, val21
	call WriteHex
	call Crlf

	clc
	mov eax, 0

	mov al, BYTE PTR val11
	adc al, BYTE PTR val21
	daa
	push eax

	mov al, BYTE PTR val11+1
	adc al, BYTE PTR val21+1
	daa
	push eax

	mov al, BYTE PTR val11+2
	adc al, BYTE PTR val21+2
	daa
	push eax

	mov al, BYTE PTR val11+3
	adc al, BYTE PTR val21+3
	daa
	push eax

	mov al, BYTE PTR val10
	adc al, BYTE PTR val20
	daa
	push eax
	
	mov al, 0
	adc al, 0
	push eax
	
	mov edx, OFFSET resultString
	call WriteString

	mov ecx, 6
L1:
	pop eax
	mov ebx, eax
	shr eax, 4
	call WriteDec
	mov eax, ebx
	and eax, 0000000Fh
	;shr eax, 4
	call WriteDec
	loop L1

exit
main ENDP
END main

