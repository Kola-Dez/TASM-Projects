include IO.ASM

stack1 segment 
    db 256 dup(?)
stack1 ends

data segment
    arrayA db 6 dup(?)      ; Массив A
    arrayB db 6 dup(?)      ; Массив B
    arrayC db 6 dup(?)      ; Массив C
    result db 0             ; Результирующий байт
    text1 db 'Enter array A: $'
    text2 db 'Enter array B: $'
    text3 db 'Enter array C: $'
    text4 db 'Result byte: $'
    new_line db 0Dh, 0Ah, '$'
data ends

code segment
start:
    ASSUME SS:stack1, DS:data, CS:code

    mov ax, data
    mov ds, ax

    ; Ввод массива A
    mov ah, 09h
    lea dx, text1
    int 21h

    mov si, offset arrayA
    mov cx, 6
    call input_array

    ; Ввод массива B
    mov ah, 09h
    lea dx, text2
    int 21h

    mov si, offset arrayB
    mov cx, 6
    call input_array

    ; Ввод массива C
    mov ah, 09h
    lea dx, text3
    int 21h

    mov si, offset arrayC
    mov cx, 6
    call input_array

    ; Проверка треугольников и построение результирующего байта
    mov si, 0          ; Индекс массива
    mov di, 0          ; Смещение для массивов
    mov result, 0      ; Обнуление результирующего байта

check_triangles:
    ; Загрузка A[i], B[i], C[i]
    mov al, arrayA[di] ; Сторона A[i]
    mov bl, arrayB[di] ; Сторона B[i]
    mov cl, arrayC[di] ; Сторона C[i]

    ; Проверка A[i] + B[i] > C[i]
    mov ah, al
    add ah, bl
    cmp ah, cl
    jle skip_bit

    ; Проверка A[i] + C[i] > B[i]
    mov ah, al
    add ah, cl
    cmp ah, bl
    jle skip_bit

    ; Проверка B[i] + C[i] > A[i]
    mov ah, bl
    add ah, cl
    cmp ah, al
    jle skip_bit

    ; Если все условия выполнены, установить бит
    cmp si, 0
    je set_bit_0
    cmp si, 1
    je set_bit_1
    cmp si, 2
    je set_bit_2
    cmp si, 3
    je set_bit_3
    cmp si, 4
    je set_bit_4
    cmp si, 5
    je set_bit_5
    jmp skip_bit

set_bit_0:
    or result, 1       ; Устанавливаем бит 0
    jmp skip_bit
set_bit_1:
    or result, 2       ; Устанавливаем бит 1
    jmp skip_bit
set_bit_2:
    or result, 4       ; Устанавливаем бит 2
    jmp skip_bit
set_bit_3:
    or result, 8       ; Устанавливаем бит 3
    jmp skip_bit
set_bit_4:
    or result, 16      ; Устанавливаем бит 4
    jmp skip_bit
set_bit_5:
    or result, 32      ; Устанавливаем бит 5
    jmp skip_bit

skip_bit:
    inc di              ; Переход к следующей тройке
    inc si
    cmp si, 6           ; Проверка конца массива
    jl check_triangles

    ; Вывод результата
    mov ah, 09h
    lea dx, text4
    int 21h

    mov al, result
    call PrintByte      ; Вывод результата в виде числа

    ; Новая строка
    mov ah, 09h
    lea dx, new_line
    int 21h

    ; Завершение программы
    mov ah, 4Ch
    int 21h

; Ввод массива
input_array:
    inint bx            ; Считываем значение
    mov [si], bl        ; Сохраняем в массиве
    add si, 1
    loop input_array
    ret

; Функция вывода результата
PrintByte:
    push ax             ; Сохраняем регистры
    aam                 ; Разделяем на десятки и единицы
    add al, '0'         ; Преобразуем в ASCII (десятки)
    mov dl, al
    mov ah, 02h
    int 21h             ; Вывод десятков

    mov al, ah          ; Единицы в AL
    add al, '0'         ; Преобразуем в ASCII (единицы)
    mov dl, al
    mov ah, 02h
    int 21h             ; Вывод единиц
    pop ax              ; Восстанавливаем регистры
    ret

code ends
end start
    