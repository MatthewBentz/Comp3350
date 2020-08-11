TITLE Question #1 HW9              (main.asm)

INCLUDE Irvine32.inc
.data

	Apple  DWORD 20
	Berry  DWORD 10
	Cherry DWORD 5
	X	   DWORD ?
	msg1 BYTE "X = ",0
	msg2 BYTE "Top of stack = ",0
	msg3 BYTE "ESI = ",0

.code

; Computes X=A+B-C
; A, B, and C are 32-bit vars passed on stack
; X is returned on top of the stack
; X address is returned as reference in the register ESI
ArithmeticExpression PROC
	
	pop ebp				; store ret address

	pop eax				; eax = A
	pop ebx				; ebx = B
	add eax, ebx		; eax = A + B
	pop ebx				; ebx = C
	sub eax, ebx		; eax = A + B - C
	mov X, eax
	push X				; X is top of stack
	mov esi, OFFSET X	; esi = X address
	
	push ebp			; restore ret address
	ret

ArithmeticExpression ENDP

main PROC   
	
	push Cherry
	push Berry
	push Apple
	call ArithmeticExpression

	; print 'X = '
	mov edx, OFFSET msg1
	call WriteString
	mov eax, X
	call WriteInt
	call Crlf

	; print 'Top of stack = '
	mov edx, OFFSET msg2
	call WriteString
	pop eax
	call WriteInt
	call Crlf

	; print 'ESI = '
	mov edx, OFFSET msg3
	call WriteString
	mov eax, esi
	call WriteHex
	call Crlf

exit
main ENDP
END main

