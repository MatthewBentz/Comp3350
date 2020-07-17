TITLE Question #1 HW7              (main.asm)

INCLUDE Irvine32.inc

.data

	sensor1				SBYTE 70
	sensor2				SBYTE 70
	agreeString			BYTE "Agree",0
	disagreeString		BYTE "Disagree",0
	takeActionString	BYTE "Take Action",0

.code
main PROC   
	
	mov al,sensor1
	sub al,sensor2		; calculate difference
	cmp al,2			; if difference less than 2 (+2)
	jle next			; check <= 2
	jmp disagree		; jump only if difference is >2

next:
	cmp al,-2			
	jge agree			; check >= -2

disagree:				; reach here only if difference is >2 and <-2
	mov edx, OFFSET disagreeString
	call WriteString
	call Crlf
	jmp quit

agree:
	mov edx, OFFSET agreeString
	call WriteString
	call Crlf

	cmp sensor1,40
	jg next2			; check sensor2 if sensor1 > 40
	jmp quit			; else quit

next2:
	cmp sensor2,40		
	jg takeAction		; take action if sensor1 > 40 and sensor2 > 40
	jmp quit			; else quit

takeAction:
	mov edx, OFFSET takeActionString
	call WriteString
	call Crlf

quit:

exit
main ENDP
END main

