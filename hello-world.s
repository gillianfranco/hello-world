.global _start
.intel_syntax noprefix

_start:
    CALL write_hello_world
    JMP exit

write_hello_world:
    MOV rax, 0x01
    MOV rdi, 0x01 # output status code
    LEA rsi, [hello_str] # pointer
    MOV rdx, 14 # string size
    SYSCALL
    RET

exit:
    MOV rax, 0x3c
    MOV rdi, 0 # status code
    SYSCALL

.section .data
    hello_str: .asciz "Hello, World!\n"
