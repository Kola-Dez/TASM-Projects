include io.asm

stack1 segment
    db 256 dup(?)
stack1 ends

data segment
    a dw 2
    b dw 2
    text db 'Result: $'
data ends

code segment
start: 
    ASSUME SS:stack1, DS:data, CS:code
    
    ; Initialize data segment
    mov AX, data
    mov DS, AX

    mov CX, 4

    mov AX, a
    mov DX, b
    mul DX
    mul CX
    mov BX, AX

    mov AX, b
    mul CX
    sub BX, AX

    mov AX, a
    mul AX
    add BX, AX

    mov AH, 09h     ; a^2 + 4 * a * b - 4 * b
    lea DX, text    ; Load address of text
    int 21h         ; Display the result text

    ; Output the result (assuming OUTINT is defined in io.asm)
    OUTINT BX       ; Output the integer in BX

    ; Exit program
    mov AH, 4Ch
    int 21h
code ends
END start
