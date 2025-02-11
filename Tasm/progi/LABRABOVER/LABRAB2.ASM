include IO.ASM
; Заменить местами значения 6-го и 11-го разрядов в каждом слове массива А, длина которого 10 слов.
stack1 segment 
    db 256 dup(?)
stack1 ends

data segment 
    C dw 16 dup(?)
    Count dw 0
    Sum dw 0
    text1 db 'Enter massive: $'
    text2 db 'Sum: $'
    text3 db ' Count: $'
data ends

code segment 
start:
    ASSUME SS:stack1, DS:data, CS:code

    mov ax, data
    mov DS, ax

    mov si, 0

    mov ah, 09h
    lea dx, text1
    int 21h

    call input_array

    mov bx, [Sum]
    mov ah, 09h
    lea dx, text2
    int 21h
    OUTINT bx


    mov bx, [Count]
    mov ah, 09h
    lea dx, text3
    int 21h
    OUTINT bx

    mov ah, 4Ch
    int 21h

input_array:
    mov cx, 16
    mov si, 0

input_loop:
    inint bx
    mov [C + si], bx
    add si, 2

    cmp bx, 10
    jg add_sum

    jmp continue

add_sum:
    add [Sum], bx
    inc [Count]

continue:
    loop input_loop
    ret


;  24. Дан массив С(16). Найти сумму элементов, которые превосходят по величине 10 и найти их количество.

code ends
end start
