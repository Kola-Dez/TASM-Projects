
PUBLIC myAsmFunction
PUBLIC _myAsmFunction

stack1 segment
    db 256 dup(?)
stack1 ends

data segment PUBLIC
    test2 dw 12
data ends


code segment PUBLIC
start: 
    ASSUME SS:stack1, DS:data, CS:code
    
    ; Initialize data segment
    mov AX, data
    mov DS, AX
    
    _myAsmFunction PROC
        MOV AX, 42    ; Возвращаем число 42
        RET
    _myAsmFunction ENDP

    myAsmFunction PROC
        MOV AX, 42    ; Возвращаем число 42
        RET
    myAsmFunction ENDP


    mov AH, 4Ch
    int 21h
code ends
END start