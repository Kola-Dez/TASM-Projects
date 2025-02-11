include io.asm
stack1 segment
    db 256 dup(?)  ; Стек
stack1 ends

data segment
    A db 15 dup('$')  ; Массив A (инициализация нулями)
    B db 15 dup('$')  ; Массив B
    C db 15 dup('$')  ; Массив C
    K db 15 dup('$')  ; Массив K
    sum_a dw ?      ; результат суммы для массива A
    sum_b dw ?      ; результат суммы для массива B
    sum_c dw ?      ; результат суммы для массива C
    sum_k dw ?      ; результат суммы для массива K
    message_inputa db 'Enter array A (numbers separated by spaces): $'
    message_inputb db 'Enter array B (numbers separated by spaces): $'
    message_inputc db 'Enter array C (numbers separated by spaces): $'
    message_inputk db 'Enter array K (numbers separated by spaces): $'
    message_input db 'Calculating sum of odd-indexed elements... $'
    message_result db 'Sum calculated: $'
    cr db 13          ; Символ возврата каретки 
    lf db 10          ; Символ перевода строки 
data ends

code segment
start:
    ASSUME SS:stack1, DS:data, CS:code
    mov ax, data
    mov DS, ax
    
    jmp run_process

; Макрос для ввода массива чисел через пробел
inpMuss MACRO mus, n
    LOCAL L1
    mov si, 0
    mov cx, n
L1:
    mov ax, 0
    inint ax
    mov [mus + si], al
    inc si
    loop L1
ENDM

outMuss MACRO mus, n
    LOCAL O1
    call print_enter
    mov si, 0
    mov cx, n
O1:
    mov ax, 0
    mov al, [mus + si]
    OUTINT ax
    inc si
    mov ah, 02h
    mov dl, ' '
    int 21h
    loop O1
ENDM

sumOddIndex MACRO mus, n, sums
    LOCAL scan1, endScan
    mov bx, 0
    mov si, 1
scan1:
    mov ax, 0
    mov al, [mus + si]
    cmp si, n 
    jg endScan
    add bx, ax
    add si, 2
    jmp scan1
endScan:
    call print_enter
    OUTINT bx
    mov [sums], bx
ENDM


; 14.Составить макроопределение нахождения суммы элементов массива с нечетными номерами. 
; Используя это макроопределение найти сумму элементов каждого из
; четырех массивов а1, а2,..,а10; b1, b2,…,b10; с1, с2,…., с10; к1, к2,…,к10.

run_process:
    ; Ввод массива A
    lea dx, message_inputa
    mov ah, 09h
    int 21h
    inpMuss A, 10
    lea dx, message_inputb
    mov ah, 09h
    int 21h
    inpMuss B, 10
    lea dx, message_inputc
    mov ah, 09h
    int 21h
    inpMuss C, 10
    lea dx, message_inputk
    mov ah, 09h
    int 21h
    inpMuss K, 10


    outMuss A, 10
    outMuss B, 10
    outMuss C, 10
    outMuss K, 10
    call print_enter

    sumOddIndex A, 10, sum_a
    sumOddIndex B, 10, sum_b
    sumOddIndex C, 10, sum_c
    sumOddIndex K, 10, sum_k

    jmp exit_code

print_enter:
    mov ah, 02h
    mov dl, cr
    int 21h
    mov dl, lf
    int 21h
    ret

exit_code:
    ; Завершение программы
    mov ah, 4Ch
    int 21h


code ends
end start