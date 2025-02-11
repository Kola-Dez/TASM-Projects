stack1 segment
    db 256 dup(?)
stack1 ends

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
data ends

public print_hello
code segment
    print_hello proc
        ASSUME SS:stack1, DS:data, CS:code
        mov ax, data
        mov DS, ax
        ; Выбор прерывания для графического режима
        mov ah, 00h
        mov al, 13h ; Выбор разрешения: 320x200, 16-цветная графика (MCGA, VGA)
        int 10h
        
        call Driw

        MOV AH, 08h ; Ввод символа с клавиатуры без отображения на экране
        int 21h


        mov al, 03h ; Код функции для установки текстового режима
        mov ah, 0 ; Видеорежим
        int 10h
        
        ret
    print_hello endp

    Driw:
        mov [x1], 20
        mov [y1], 20
        mov [x2], 100
        mov [y2], 100
        mov ax, [Blue]
        mov [color], al
        call GoDrawLine
    ret

    GoDrawLine:
        ;рисования линии с использованием алгоритма Брезенхэма

        ;-----Вычисление изменений по осям------;
                mov ax, [x1]
                mov bx, [y1]
                mov cx, [x2]
                mov dx, [y2]

                sub cx, ax    ; cx = x2 - x1 (dx)
                sub dx, bx    ; dx = y2 - y1 (dy)

                ;   int dex = abs(x2 - x1);
                cmp cx, 0
                jge isPositivDx
                neg cx
            isPositivDx:
                mov [dex], cx
                ;outint cx

                ;   int dey = abs(y2 - y1);
                cmp dx, 0
                jge isPositivDy
                neg dx
            isPositivDy:
                mov [dey], dx
                ;outint dx

        ;-----Вычисление направлений------;
                mov bx, 1
                mov ax, [x1]
                cmp ax, [x2]
                jl isPositivSx ; if (x1 < x2)
                je isZeroSx    ; if (x1 == x2)
                neg bx
                jmp isPositivSx
            isZeroSx:
                mov bx, 0
            isPositivSx:
                mov [sx], bx ; SX
                ;outint bx

                mov bx, 1
                mov ax, [y1]
                cmp ax, [y2]
                jl isPositivSy ; if (y1 < y2)
                je isZeroSy    ; if (y1 == y2)
                neg bx
                jmp isPositivSy
            isZeroSy:
                mov bx, 0
            isPositivSy:
                mov [sy], bx ; SY
                ;outint bx

        ;-----Вычисление error------;
            mov ax, [dex]
            mov bx, [dey]
            sub ax, bx
            mov [error], ax
            ;outint ax

        ;-----Начальная точка--------;
            mov cx, [x1]
            mov dx, [y1]

        ;--------------Цикл Отрисовки--------------;
            printLinePoint:
                ;-Проверка на выход за границы экрана-;
                    ;=== if(cx < 0 || cx > 320 || dx < 0 || dx > 200) ===;
                    cmp cx, 0
                    jl breakLinePoint
                    cmp cx, 320
                    jg breakLinePoint
                    cmp dx, 0
                    jl breakLinePoint
                    cmp dx, 200
                    jg breakLinePoint

                ;-Рисуем пиксель-;
                    call printScreen

                ;-Проверка условия завершения цикла-;
                    ;=== if (cx == x2 && dx == y2) break; ===;
                        mov ax, cx
                        cmp ax, [x2] ; (x1 != x2)
                        jne not_equal
                        mov ax, dx
                        cmp ax, [y2] ; (y1 != y2)
                        jne not_equal
                        jmp breakLinePoint
                    not_equal:

                ;-условия сдвига-;
                    ;-формирование tmp-;
                        ;---int tmp = 2 * err;
                        mov saveDx, dx
                        mov ax, [error]
                        mov bx, 2
                        mul bx
                        mov [tmp], ax
                        mov dx, saveDx

                    ;=== if (tmp > -dey) ===;
                            mov ax, dey
                            neg ax
                            cmp [tmp], ax ; (tmp < -dey)
                            jl conditionOne

                            ;---error -= dey;
                            mov ax, error
                            mov bx, [dey]
                            sub ax, bx
                            mov error, ax
                            ;---cx += sx;
                            add cx, [sx]
                        conditionOne:

                    ;=== if (tmp < dex) ===;
                            mov ax, dex
                            cmp [tmp], ax ; (tmp > dex)
                            jg conditionTwo

                            ;---error += dex;
                            mov ax, [error]
                            add ax, [dex]
                            mov [error], ax
                            ;---dx += sy;
                            add dx, [sy]
                        conditionTwo:

                ;=== while(true) ===;
                    jmp printLinePoint

                ;-вывод из цикла-;
                    breakLinePoint:
    ret

    printScreen:
        mov ah, 0ch ; Настройка для рисования пикселя на экране
        mov al, [color] ; AL содержит цвет, E = желтый цвет
        mov bh, 0 ; BH содержит номер страницы
        int 10h
    ret
code ends
end