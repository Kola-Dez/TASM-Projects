include io.asm
stack1 segment
    db 256 dup(?)  ; Стек
stack1 ends

data segment
    text db 255 dup('$')
    message_input db 'Enter text: $'
    message_out db 'Result $'
    cr db 13          ; Символ возврата каретки 
    lf db 10          ; Символ перевода строки 
    lenghtString dw 0
    questions dw 0
    exPoint dw 0
    point dw 0
data ends

code segment
start:
    ASSUME SS:stack1, DS:data, CS:code
    mov ax, data
    mov DS, ax
    
    jmp run_process

; Макрос для ввода массива чисел через пробел
inpText MACRO mus
    LOCAL startInputText, endInputText
    mov ax, seg mus
    mov es, ax
    lea di, mus
    cld
    mov bx, 0
startInputText:
    mov ah, 01h
    int 21h
    cmp al, 0Dh
    je endInputText
    inc bx
    stosb
    jmp startInputText
endInputText:
    mov lenghtString, bx
ENDM

scanSimbol MACRO mus, n
    LOCAL scan1
    mov cx, n
    mov si, 0
scan1:
    mov al, [text + si]
    cmp al, '?'
    je simbol1
    cmp al, '!'
    je simbol2
    cmp al, '.'
    je simbol3
next_peocesing:
    inc si
    loop scan1
    jmp exit_procesing
simbol1:
    add questions, 1
    jmp next_peocesing

simbol2:
    add exPoint, 1
    jmp next_peocesing
    
simbol3:
    add point, 1
    jmp next_peocesing
exit_procesing:
ENDM


; 15.Составить макроопределение поиска определенного символа в строке.
; Используя данное макроопределение определить в заданном тексте количество 
; вопросительных, восклицательных и повествовательных предложений.

run_process:
    lea dx, message_input
    mov ah, 09h
    int 21h
    inpText text

    scanSimbol text, lenghtString
    
    call print_enter
    mov dl, '?'
    mov ah, 02h
    int 21h
    mov bx, questions
    OUTINT bx

    call print_enter
    mov dl, '!'
    mov ah, 02h
    int 21h
    mov bx, exPoint
    OUTINT bx

    call print_enter
    mov dl, '.'
    mov ah, 02h
    int 21h
    mov bx, point
    OUTINT bx

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