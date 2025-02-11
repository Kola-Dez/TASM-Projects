include io.asm
stack1 segment
    db 256 dup(?)  ; Стек
stack1 ends

data segment
    array db 15 dup(?)
    message_input db 'Enter array: $'
    message_output db 'NOD: $'
    result dw 0
    tmp dw 0
    cr db 13          ; Символ возврата каретки 
    lf db 10          ; Символ перевода строки 
data ends

code segment
start:
    ASSUME SS:stack1, DS:data, CS:code
    mov ax, data
    mov DS, ax
    
    jmp run_process

inpMuss MACRO mus, n
        LOCAL next_numb
        call print_message_input    
        mov si, 0
        mov cx, n
    next_numb:
        mov ax, 0
        inint ax
        mov [mus + si], al
        inc si
        loop next_numb
ENDM



NOD MACRO a, b
        LOCAL start_nod, end_nod
        mov ax, a
        mov bx, b
    start_nod:
        cmp bx, 0
        je end_nod
        mov dx, 0
        div bx
        mov ax, bx
        mov bx, dx
        jmp start_nod
    end_nod:
        mov result, ax
ENDM

NODinArray MACRO mus, n
        LOCAL start_nod_array, loop_nod_array, end_array
        call print_message_output
    start_nod_array:
        mov si, 0
        mov cx, n
        sub cx, 1
        mov al, [mus + si]
        mov ah, 0
        mov result, ax

    loop_nod_array:
        
        inc si
        mov al, [mus + si]
        mov ah, 0
        mov tmp, ax
        NOD result, tmp
        loop loop_nod_array

    end_array:
        OUTINT result
ENDM


; 24. Составить макроопределение для нахождения наибольшего общего делителя двух чисел. 
; Используя это макроопределение найти НОД в массиве из 15 чисел.


run_process:
    inpMuss array, 15
    NODinArray array, 15
    jmp exit_code




print_message_output:
    lea dx, message_output
    mov ah, 09h
    int 21h
    ret
    
print_message_input:
    lea dx, message_input
    mov ah, 09h
    int 21h
    ret

print_enter:
    mov ah, 02h
    mov dl, cr
    int 21h
    mov dl, lf
    int 21h
    ret

exit_code:
    mov ah, 4Ch
    int 21h


code ends
end start