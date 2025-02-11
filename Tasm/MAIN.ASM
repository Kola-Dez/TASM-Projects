stack1 segment
    db 256 dup(?)
stack1 ends

data segment
    text db 'Result: $'
data ends

extrn print_hello:proc 
 
code segment
start:
    ASSUME SS:stack1, DS:data, CS:code
    mov ax, data
    mov DS, ax

    call print_hello
    

    mov AH, 4Ch
    int 21h
code ends
END start
