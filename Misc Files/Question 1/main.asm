TITLE Question #1 HW7              (main.asm)

INCLUDE Irvine32.inc

.data

	array       SWORD 1,3,5,8,10,11,13,15
	evenString  BYTE "even integer found",0
	oddString   BYTE "no even integer found", 0
	value       BYTE "value: ",0
	index		BYTE "index: ",0

.code
main PROC   
	
	mov esi, OFFSET array		; point esi to the array
	mov ecx, LENGTHOF array		; loop counter

next:
	test WORD PTR [esi],1b		; test if value is even
	pushfd						; push flags
	add esi, TYPE array			; point to the next value
	popfd						; pop flags
	loopnz next					; loop if odd value
	jnz notFound				; quit if no even value found

	add ecx, 1					; correct indexing
	sub esi, TYPE array			; point to the even value if found
	mov edx, OFFSET evenString	; print "even integer found"
	call WriteString
	call Crlf
	mov edx, OFFSET value		; print "value: "
	call WriteString
	movzx eax, WORD PTR [esi]	; print even value
	call WriteInt
	call Crlf
	mov edx, OFFSET index		; print "index: "
	call WriteString
	mov eax, LENGTHOF array		; eax = 7
	sub eax, ecx				; eax = index of element
	call WriteInt
	call Crlf
	jmp quit					; skip notFound

notFound:
	mov edx, OFFSET oddString	; print "no even integer found"
	call WriteString
	call Crlf
quit:

exit
main ENDP
END main

