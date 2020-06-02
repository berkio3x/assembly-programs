section .text
global _start

_start:
	mov ebx, msg  ; point ebx to the start of string 
	mov eax, ebx  ; point eax to same location as eax
nextchar:
	cmp byte[eax], 0 ; compare the value pointed by eax with 0
	jz finished     ; if same , we are done
	inc eax		; else store the addess of next byte in eax
	jmp nextchar	; loop until condition satisfies

finished:
	sub eax,ebx	; find the striongi length
	mov edx, eax	
	mov ecx, msg
	mov ebx , 1	; write to the stdout file
	mov eax, 4	; invoke syswrite (kernel opcode 4)
	int 80h		; raise a  interrupt
	mov ebx, 0 	; load ebx with 0 to indicate proper return code
	mov eax, 1	; load eax with 1, a call to sys_exit
	int 80h		; raise an interrupt using int 80h
	
section .data
	msg db "This is my world, I like pizzas!",0x0


