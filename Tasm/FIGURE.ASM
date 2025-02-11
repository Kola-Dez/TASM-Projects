;-----------------DATA-----------------;
data1 segment PUBLIC  
    size1 dw 0
    x1 dw 0
    x2 dw 0
    y1 dw 0
    y2 dw 0
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
data1 ends

;-----------------CODE1-----------------;
code1 segment PUBLIC
PUBLIC GoDrawSquare  ; Делаем функцию доступной извне
    GoDrawSquare proc far
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

                    mov ax, cx
                    mov bx, dx
                    cmp ax, bx
                    jle setNextColorSquare
                    mov al, [ColorsArray + 1]
                    jmp setColorSquare
                    setNextColorSquare:
                    mov al, [ColorsArray + 2]
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
GoDrawSquare endp
code1 ends
end