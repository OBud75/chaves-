.section .bss
name: .space 16     # reserve 16 bytes for name

.section .text
.intel_syntax noprefix
.global _start

_printText1:
    mov rax, 1      # syscall: write
    mov rdi, 1      # sortie 
    lea rsi, [text1]  # adresse du message
    mov rdx, 27     # longueur du message
    syscall
    ret
    
_getName:
    mov rax, 0      # syscall: read
    mov rdi, 0      # entrée
    lea rsi, [name]   # adresse de la variable name
    mov rdx, 16     # longueur du message
    syscall        
    ret 
    
_printText2:
    mov rax, 1
    mov rdi, 1
    lea rsi, [text2]
    mov rdx, 7
    syscall
    ret

_printName:
    mov rax, 1
    mov rdi, 1
    lea rsi, [name]
    mov rdx, 16
    syscall
    ret

_start:
    call _printText1
    call _getName
    call _printText2
    call _printName

    mov rax, 60                             # syscall: exit
    mov rdi, 0                              # status: 0
    syscall



text1:                                      # nom de variable
    .asciz "Hello, what is your name?\n"    # Message pour l'utilisateur

text2:
    .asciz "Hello, \n"
