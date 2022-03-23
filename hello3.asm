section .data
	msg    db      "hello, world",10,0 ;0xa ascii code for new line.
section .bss
section .text
	global main
main:
	mov    rax, 1       ; 1 = write
	mov    rdi, 1       ; 1 = stdout
	mov    rsi, msg     ; string to display in rsi
	mov    rdx, 13      ; length of the string, without 0
	syscall             ; display the string
	mov    rax, 60      ; 60 = exit
	mov    rdi, 0       ; 0 = success exit code
	syscall             ; quit
