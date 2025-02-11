include IO.ASM
;-----------------STACK-----------------;
stack1 segment
    db 256 dup(?)
stack1 ends

;-----------------DATA-----------------;
data segment
    ;---Params---;
        size1 dw 0
        movBoxLeftORRight dw 0
        movBoxUpOrDown dw 0
        x1 dw 0
        x2 dw 0
        y1 dw 0
        y2 dw 0
        tmp dw 0
        dex dw 0
        dey dw 0
        sx dw 0
        sy dw 0
        saveDx dw 0
        saveCx dw 0
        error dw 0 ; это переменная, которая используется для принятия решения о том, по какой оси делать следующий шаг
    ;---Colors---;
        color db 0
        ColorsArray db 16, 16 dup(0)
        Black       dw 0
        Blue        dw 1
        Green       dw 2
        Cyan        dw 3
        Red         dw 4
        Magenta     dw 5
        Brown       dw 6
        LightGray   dw 7
        DarkGray    dw 8
        LightBlue   dw 9
        LightGreen  dw 10
        LightCyan   dw 11
        LightRed    dw 12
        LightMagenta dw 13
        Yellow      dw 14
        White       dw 15
    ;---FOR-OTLADKA---;
        messages db 'hello$'
data ends


;-----------------CODE-----------------;
code segment
start:
    ASSUME SS:stack1, DS:data, CS:group_code
    mov ax, data
    mov DS, ax

;---------------------JMP-RUN--------------------;
jmp run_process

;---------------------MACROS---------------------;
DrawLine MACRO setX1, setY1, setX2, setY2, setColor
    mov [x1], setX1
    mov [y1], setY1
    mov [x2], setX2 
    mov [y2], setY2
    mov ax, setColor
    mov [color], al
    call GoDrawLine
ENDM
DrawSquare MACRO setX1, setY1, setSize, setColor1
    mov [x1], setX1
    mov [y1], setY1
    mov [size1], setSize
    mov ax, setColor1
    mov [ColorsArray + 1], al
    mov ax, setColor1
    mov [ColorsArray + 2], al
    call GoDrawSquare
ENDM
DrawGradientSquare MACRO setX1, setY1, setSize, setColor1, setColor2
    mov [x1], setX1
    mov [y1], setY1
    mov [size1], setSize
    mov ax, setColor1
    mov [ColorsArray + 1], al
    mov ax, setColor2
    mov [ColorsArray + 2], al
    call GoDrawSquare
ENDM
IfScreenLimit MACRO GoTo
    cmp cx, 0
    jl GoTo
    cmp cx, 320
    jg GoTo
    cmp dx, 0
    jl GoTo
    cmp dx, 200
    jg GoTo
ENDM
;-------------------RUN-PROGRAMM------------------;
run_process:

    call OpenScreen


    jmp exit_code

;-------------------OPEN-WINDOW-------------------;
OpenScreen:
    ; Выбор прерывания для графического режима
    mov ah, 00h
    mov al, 13h ; Выбор разрешения: 320x200, 16-цветная графика (MCGA, VGA)
    int 10h
    ;        x1  y1  x2  y2
    mov [movBoxUpOrDown], 100
    mov [movBoxLeftORRight], 100

    jmp labrab1
    
    GeneralCycle:
            MOV AH, 08h ; Ввод символа с клавиатуры без отображения на экране
            int 21h
            cmp al, 'a'
            je lefBox
            cmp al, 'd'
            je rightBox
            cmp al, 'w'
            je UpBox
            cmp al, 's'
            je DownBox
            cmp al, 'x'
            je exitGeneralCycle
            ;cmp al, 'q'
            ;je labrab1

        nextGeneralCycle:
        jmp GeneralCycle
    exitGeneralCycle:
    
    ; Переключение с графического режима в текстовый
    mov al, 03h ; Код функции для установки текстового режима
    mov ah, 0 ; Видеорежим
    int 10h
    ret

updateScrean: 
    ; Очищаем экран (заполняем его фоном)
    mov ax, 0A000h      ; Адрес видеопамяти для графического режима
    mov es, ax          ; Загружаем в сегмент
    xor di, di          ; Начинаем с начала видеопамяти (di = 0)
    mov cx, 320 * 200   ; Размер экрана (320 * 200 пикселей)
    xor al, al          ; Цвет фона (черный, 0)
    rep stosb           ; Заполняем видеопамять байтом из AL
    ret

lefBox:
    mov bx, [movBoxLeftORRight]
    sub bx, 10
    mov [movBoxLeftORRight], bx
    jmp far ptr labrab2
rightBox:
    mov bx, [movBoxLeftORRight]
    add bx, 10
    mov [movBoxLeftORRight], bx
    jmp far ptr labrab2
UpBox:
    mov bx, [movBoxUpOrDown]
    sub bx, 10
    mov [movBoxUpOrDown], bx
    jmp far ptr labrab2
DownBox:
    mov bx, [movBoxUpOrDown]
    add bx, 10
    mov [movBoxUpOrDown], bx
labrab2:
    call updateScrean
    mov bx, [movBoxLeftORRight]
    mov [x1], bx
    mov bx, [movBoxUpOrDown]
    mov [y1], bx
    mov [size1], 40
    mov ax, [Blue]
    mov [ColorsArray + 1], al
    mov ax, [Green]
    mov [ColorsArray + 2], al
    mov ax, [Blue]
    mov [ColorsArray + 3], al
    call GoDrawSquare
    jmp nextGeneralCycle

labrab1:
    DrawLine 20, 20, 20, 60, [Yellow]
    DrawLine 20, 40, 40, 20, [Blue]
    DrawLine 20, 40, 40, 60, [Green]
    jmp nextGeneralCycle

;-------------------PROCEDURES-------------------;
GoDrawLine:
    ;рисования линии с использованием алгоритма Брезенхэма

    ;-----Вычисление изменений по осям------;
            mov ax, x1
            mov bx, y1
            mov cx, x2
            mov dx, y2

            sub cx, ax    ; cx = x2 - x1 (dx)
            sub dx, bx    ; dx = y2 - y1 (dy)

            ;   int dex = abs(x2 - x1);
            cmp cx, 0
            jge isPositivDx
            neg cx
        isPositivDx:
            mov dex, cx
            ;outint cx

            ;   int dey = abs(y2 - y1);
            cmp dx, 0
            jge isPositivDy
            neg dx
        isPositivDy:
            mov dey, dx
            ;outint dx

    ;-----Вычисление направлений------;
            mov bx, 1
            mov ax, x1
            cmp ax, x2
            jl isPositivSx ; if (x1 < x2)
            je isZeroSx    ; if (x1 == x2)
            neg bx
            jmp isPositivSx
        isZeroSx:
            mov bx, 0
        isPositivSx:
            mov sx, bx ; SX
            ;outint bx

            mov bx, 1
            mov ax, y1
            cmp ax, y2
            jl isPositivSy ; if (y1 < y2)
            je isZeroSy    ; if (y1 == y2)
            neg bx
            jmp isPositivSy
        isZeroSy:
            mov bx, 0
        isPositivSy:
            mov sy, bx ; SY
            ;outint bx

    ;-----Вычисление error------;
        mov ax, dex
        mov bx, dey
        sub ax, bx
        mov error, ax
        ;outint ax

    ;-----Начальная точка--------;
        mov cx, x1
        mov dx, y1

    ;--------------Цикл Отрисовки--------------;
        printLinePoint:
            ;-Проверка на выход за границы экрана-;
                ;=== if(cx < 0 || cx > 320 || dx < 0 || dx > 200) ===;
                IfScreenLimit breakLinePoint

            ;-Рисуем пиксель-;
                call printScreen

            ;-Проверка условия завершения цикла-;
                ;=== if (cx == x2 && dx == y2) break; ===;
                    mov ax, cx
                    cmp ax, x2 ; (x1 != x2)
                    jne not_equal
                    mov ax, dx
                    cmp ax, y2 ; (y1 != y2)
                    jne not_equal
                    jmp breakLinePoint
                not_equal:

            ;-условия сдвига-;
                ;-формирование tmp-;
                    ;---int tmp = 2 * err;
                    mov saveDx, dx
                    mov ax, error
                    mov bx, 2
                    mul bx
                    mov tmp, ax
                    mov dx, saveDx

                ;=== if (tmp > -dey) ===;
                        mov ax, dey
                        neg ax
                        cmp tmp, ax ; (tmp < -dey)
                        jl conditionOne

                        ;---error -= dey;
                        mov ax, error
                        mov bx, dey
                        sub ax, bx
                        mov error, ax
                        ;---cx += sx;
                        add cx, sx
                    conditionOne:

                ;=== if (tmp < dex) ===;
                        mov ax, dex
                        cmp tmp, ax ; (tmp > dex)
                        jg conditionTwo

                        ;---error += dex;
                        mov ax, error
                        add ax, dex
                        mov error, ax
                        ;---dx += sy;
                        add dx, sy
                    conditionTwo:

            ;=== while(true) ===;
                jmp printLinePoint

            ;-вывод из цикла-;
                breakLinePoint:
ret

GoDrawSquare:
    mov cx, [x1]  ; i = x1
    mov dx, [y1]  ; j = y1

    mov bx, [size1]

    ; int x2 = x1 + size1;  // Конечная координата X
    mov ax, [x1]
    add ax, bx
    mov [x2], ax  ; x2 = x1 + size1

    ; int y2 = y1 + size1;  // Конечная координата Y
    mov ax, [y1]
    add ax, bx
    mov [y2], ax  ; y2 = y1 + size1

    printSquareOuterLoop:
        ;--for (int y = y1; y < y2; y++)--;
        IfScreenLimit breakPrintSquare
            printSquareInnerLoop:
            ;--for (int x = x1; x < x2; x++)--;
                IfScreenLimit breakPrintSquare

                ; Вычисляем относительные координаты
                ; Вычисляем относительные координаты
                mov ax, cx
                sub ax, [x1]  ; ax = x - x1 (относительная координата X)
                mov bx, dx
                sub bx, [y1]  ; bx = y - y1 (относительная координата Y)
                add ax, 10
                ; Логика выбора цвета
                cmp ax, bx
                jl color1      ; Если ax < bx, используем Цвет 1
                je color2      ; Если ax == bx, используем Цвет 2
                sub ax, bx     ; ax = ax - bx
                cmp ax, 20     ; Сравниваем разницу с 20
                jl color2      ; Если ax - bx < 20, используем Цвет 2
                jmp color3     ; Иначе используем Цвет 3

                color1:
                    mov al, [ColorsArray + 1]  ; Цвет 1
                    jmp setColorSquare

                color2:
                    mov al, [ColorsArray + 2]  ; Цвет 2
                    jmp setColorSquare

                color3:
                    mov al, [ColorsArray + 3]  ; Цвет 3

                setColorSquare:
                mov [color], al
                
                
                call printScreen

                inc cx
                ;-(x < x2)-;
                cmp cx, [x2]
                jl printSquareInnerLoop

            mov cx, [x1]
            inc dx
            ;-(y < y2)-;
            cmp dx, [y2]
            jl printSquareOuterLoop
    breakPrintSquare:
ret

printScreen:
    mov ah, 0ch ; Настройка для рисования пикселя на экране
    mov al, color ; AL содержит цвет, E = желтый цвет
    mov bh, 0 ; BH содержит номер страницы
    int 10h
ret

;----------------------EXIT-----------------------;
exit_code:
    mov ah, 4Ch
    int 21h
code ends

DrawCode segment
    test_tmp:
    mov ax, '3'
    mov [color], al
    mov ah, 02h
    mov dl, [color]
    int 21h
    jmp exit_code
DrawCode ends

group_code group code, DrawCode
end start