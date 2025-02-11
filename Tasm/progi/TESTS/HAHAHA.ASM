include IO.ASM

stack1 segment 
    db 256 dup(?)
stack1 ends

data segment 
    C dw 16 dup(?)
    text1 db 'Enter massive: $'
    text2 db 'Array: $'
    text3 db 'Result: $'
    text4 db ' $'
data ends

code segment 
start:
    ASSUME SS:stack1, DS:data, CS:code

    mov ax, data
    mov DS, ax

    mov ax, stack1
    mov SS, ax
    mov sp, 256

    push bp
    mov bp,sp

    mov ax, 0
    mov bx, 2
    mov dx, 0
    mov cx, 16
    mov si, 0

    mov ah, 09h
    lea dx, text1
    int 21h

    push bx

    call test_numb

    ;call input_array

    pop bx
    
    OUTINT bx

    mov ah, 4Ch
    int 21h

test_numb:
    push ax
    inc ax
    mov bx, ax
    ret

input_array:
    inint bx
    mov C[si], bx
    cmp bx, 10
    jg less_equal_10
    add si, 2
    loop input_array
    ret

less_equal_10:
    add ax, bx
    add dx, 1
    ret


;  24. Дан массив С(16). Найти сумму элементов, которые превосходят по величине 10 и найти их количество.

code ends
end start
