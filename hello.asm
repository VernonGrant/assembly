;;; section .data
;;; Holds initialized variables in the format of:
;;; <variable_name> <type> <value>
;;;
;;; It can also hold constants using the equ type.
;;;
;;; Data types (d stands for data):
;;; db - Byte        - 8 bits
;;; dw - Word        - 16 bits
;;; dd - Double Word - 32 bits
;;; dq - Quadword    - 64 bits

;;; section .bss
;;; Stands for Block Started by Symbol. Holds space that will be used at
;;; execution time, essentially empty memory blocks, in the format of:
;;; <variable_name> <type> <number>
;;;
;;; Data types:
;;; resb - Byte        - 8 bits
;;; resw - Word        - 16 bits
;;; resd - Double Word - 32 bits
;;; resq - Quadword    - 64 bits

;;; section .text
;;; Contains the program code.
;;; main: is called a label

section .data
	;; The ,0 is the string terminator. Marking the end of the string.
	;; The variable name msg is a memory address that points to h.
	msg    db      "hello, world",0
section .bss
section .text
	global main
main:
	mov    rax, 1       ; 1 = write
	mov    rdi, 1       ; 1 = stdout
	mov    rsi, msg     ; string to display in rsi
	mov    rdx, 12      ; length of the string, without 0
	syscall             ; display the string
	mov    rax, 60      ; 60 = exit
	mov    rdi, 0       ; 0 = success exit code
	syscall             ; quit
