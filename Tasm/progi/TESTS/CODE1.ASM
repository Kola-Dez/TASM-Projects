;-----------------STACK-----------------;
stack1 segment
    db 256 dup(?)
stack1 ends

;-----------------DATA-----------------;
data segment
    text1 db '1: $'
    text2 db '2: $'
    text3 db '3: $'
data ends

;-----------------CODE-----------------;
code segment
start:
    ASSUME SS:stack1, DS:data, CS:code_group
    mov ax, data
    mov ds, ax  ; Инициализация сегмента данных

    ; Ваш код здесь

    mov ah, 09h
    lea dx, text1
    int 21h

    ; Дальний переход на второй сегмент кода
    jmp far ptr code2:code2_start  ; Используем far jump для перехода в другой сегмент

code ends

;-----------------CODE2-----------------;
code2 segment
code2_start:
    ASSUME CS:code_group

    ; Ваш код для второго сегмента кода здесь
    mov ah, 09h
    lea dx, text2
    int 21h
    ; Завершение программы
    jmp far ptr code3:code3_start
code2 ends

code3 segment
code3_start:
    ASSUME CS:code_group

    ; Ваш код для второго сегмента кода здесь
    mov ah, 09h
    lea dx, text3
    int 21h
    ; Завершение программы
    mov ah, 4Ch
    int 21h
code3 ends


; Группируем сегменты кода
code_group group code, code2, code3

end start