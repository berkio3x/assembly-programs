section .text
	
	mov rdx , output ; hold the address of next byte to write
	mov r9, 0  ; current line
	mov r8 , 5 ; total  no of lines

line:
	mov byte [rdx], '*'
	inc rdx
	inc r9
	cmp r8, r9
	jne line

linefinished:
	mov byte[rdx], 10 ; add a new line char
	inc rdx
	inc r8
	mov r9 , 0
	cmp r8, maxlines
	jng line

section .bss ; for unitialized reserved space
output resb 44


