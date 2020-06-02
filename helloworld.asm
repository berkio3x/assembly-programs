global _start

	section .text
_start: mov rax, 1 	 ; write syscall
	mov rdi, 1 	 ; file handle, 1 is stdout
	mov rsi, message ; address of string to print
	mov rdx, 13 	 ; no of bytes
	syscall 	 ; do the syscall
	mov rax, 60 	 ; syscall for exit
	xor rdi, rdi     ; return 0
	syscall 	 ; invoke os to exit

	section .data
message: db "hello world", 10
