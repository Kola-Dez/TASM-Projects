include IO.ASM

segment stack1
    db 256 dup(?)
stack1 ends

segment data
    array db 16 dup(?)       ; Массив для 16 элементов (байт)
    sum db 0                 ; Переменная для хранения суммы элементов
    count db 0               ; Переменная для хранения количества элементов
    prompt db 'Enter a number (0-255): $'
    text_sum db 'Sum: $'
    text_count db 'Count: $'
    input_buffer db 3, 0, 2 dup(?)   ; Буфер для ввода (1 символ, максимум 2 цифры и завершающий символ)
data ends

segment code
start:
    ASSUME SS:stack1, DS:data, CS:code

    ; Инициализация сегмента данных
    mov ax, data
    mov ds, ax

    ; Инициализация стека
    mov ax, stack1
    mov ss, ax
    mov sp, 256

    ; Ввод элементов массива
    xor cx, cx          ; CX будет счётчиком индекса массива
    lea si, array       ; SI указывает на начало массива

input_loop:
    mov ah, 09h         ; Функция DOS для вывода строки
    lea dx, prompt      ; Указатель на сообщение приглашения
    int 21h             ; Выводим сообщение

    ; Вводим число
    lea dx, input_buffer ; Указатель на буфер ввода
    mov ah, 0Ah         ; Ввод строки (функция DOS)
    int 21h

    ; Преобразуем введённые символы в число
    mov al, input_buffer+1 ; Первый введённый символ
    sub al, '0'         ; Преобразуем из ASCII в число
    mov bl, 10          ; Для второй цифры умножаем на 10
    mul bl              ; Умножаем на 10
    mov bl, input_buffer+2 ; Второй символ
    cmp bl, 0Dh         ; Проверяем, введён ли второй символ
    je single_digit     ; Если только одна цифра, переход
    sub bl, '0'         ; Преобразуем из ASCII в число
    add al, bl          ; Добавляем результат

single_digit:
    mov [si], al        ; Сохраняем результат в массив
    inc si              ; Переходим к следующему элементу массива

    inc cx              ; Увеличиваем индекс массива
    cmp cx, 16          ; Проверяем, если уже ввели 16 элементов
    jne input_loop      ; Если нет, повторяем цикл

    ; Логика для нахождения суммы и количества элементов > 10
    xor ax, ax          ; Обнуляем AX для расчётов
    xor bx, bx          ; BX будем использовать как счётчик суммы
    xor dx, dx          ; DX будет счётчиком количества
    lea si, array       ; Устанавливаем SI на начало массива
    mov cx, 16          ; Количество элементов в массиве

process_array:
    mov al, [si]        ; Загружаем элемент массива в AL
    cmp al, 10          ; Сравниваем элемент с 10
    jle skip_element    ; Если элемент <= 10, пропускаем

    ; Если элемент > 10, добавляем его к сумме
    add bx, ax          ; Суммируем элементы в BX
    inc dx              ; Увеличиваем количество элементов в DX

skip_element:
    inc si              ; Переходим к следующему элементу массива
    loop process_array  ; Уменьшаем CX и повторяем цикл

    ; Выводим сумму элементов
    mov ah, 09h         ; Функция DOS для вывода строки
    lea dx, text_sum    ; Указатель на строку "Sum: $"
    int 21h             ; Выводим строку
    mov ax, bx          ; Загружаем сумму в AX
    OUTINT ax           ; Выводим сумму

    ; Выводим количество элементов
    mov ah, 09h         ; Функция DOS для вывода строки
    lea dx, text_count  ; Указатель на строку "Count: $"
    int 21h             ; Выводим строку
    mov ax, dx          ; Загружаем количество в AX
    OUTINT ax           ; Выводим количество

    ; Завершение программы
    mov ah, 4Ch
    int 21h

code ends
end start
