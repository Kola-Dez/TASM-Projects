stack1 segment
    db 256 dup(?)
stack1 ends

data segment
    temp dw 0
data ends

code segment
start:
    ASSUME SS:stack1, DS:data, CS:code
    mov ax, data
    mov DS, ax

    jmp run_process


printScreen MACRO x1, y1, x2, y2
    LOCAL printPoint, andif, endPrintPoint
        mov cx, x1
        mov dx, y1
    printPoint:
        int 10h
        inc cx
        inc dx
        cmp cx, x2
        jge andif
    andif:
        cmp dx, y2
        jge endPrintPoint
        jmp printPoint
    endPrintPoint:
ENDM

OpenScreen:
; Выбор прерывания для графического режима
    mov ah, 00h
    mov al, 13h ; Выбор разрешения: 320x200, 16-цветная графика (MCGA, VGA)
    int 10h


    mov ah, 0ch ; Настройка для рисования пикселя на экране
    mov al, 0Eh ; AL содержит цвет, E = желтый цвет
    mov bh, 0 ; BH содержит номер страницы

    printScreen 10, 40, 20, 40


    MOV AH, 08h ; Ввод символа с клавиатуры без отображения на экране
    INT 21h
    
; Переключение с графического режима в текстовый
    mov al, 03h ; Код функции для установки текстового режима
    mov ah, 0 ; Видеорежим
    int 10h
    ret


run_process:

    ;call OpenScreen




exit_code:
    mov ah, 4Ch
    int 21h


code ends
end start