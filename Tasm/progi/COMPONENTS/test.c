
dd = 00000000
dw = 00000000 00000000
dx = 0000000000000001

dl = 00000001
dh = 00000000
te = 00000010



m1 = 0000 0100 0000 0000
m2 = 0000 0000 0010 0000
te = 0000 0100 0000 0000
if (mask1 == 1){
    if(mask2 == 1){
        return;
    }else{
        
    }
}else{
    if(mask2 == 1){

    }else{

    }
}

ss = 00000011 = 3
ss = 11111100 + 1
ss = 11111101

ss = 00000100
ss = 11111011 + 1
ss = 11111100



char bukva = 'c';
array[15] = 0
si = 0
bx = 10
bx = 3
          0     1          2       3       4
array[00000000,00000000,00000000,00000000,00000000]

int a = 1; 00000001
xor bx, 1

     76543210

bh = 00000001 ; 1
al = 00001010 ; 10


and al, bh
    00001011
    00000001    
zf = 1

if(zf == 1)
{
    end
}else{
    bx++
    end
}


and al, bh
    00001010
    00000001    
zf = 0








int si = 0;
int cx = 15;

while(cx < 0) {

    cin >> bx;
    array[si] = bx;
    si++;

    cx--;
}
si = 0;
cx = 15;

while(cx < 0) {

    bx = array[si];
    print bx;

    si++;

    cx--;
}

for(int si = 0, cx = 15; cx =< 0; cx--, si++)
{
    cin >> bx;
    array[si] = bx;
}














    mov ax, 1048

    mov bx, ax
    shr bx, 10
    and bx, 1

    mov cx, ax
    shr cx, 5
    and cx, 1

    cmp bx, cx
    je test_procedure
    
    xor ax, maskNumb1
    xor ax, maskNumb2

    OUTINT ax


test_procedure:
    OUTINT ax
    ret














Основные команды условных переходов:
JE (Jump if Equal) / JZ (Jump if Zero) — переход, если равны.
JNE (Jump if Not Equal) / JNZ (Jump if Not Zero) — переход, если не равны.
JG (Jump if Greater) / JNLE — переход, если больше.
JL (Jump if Less) / JNGE — переход, если меньше.
JGE (Jump if Greater or Equal) — переход, если больше или равно.
JLE (Jump if Less or Equal) — переход, если меньше или равно.



33 до 47
58 до 64
91 до 96 
123 до 126

text = XXtest.test1.test2
special db 33, 47, 58, 64, 91, 96, 123, 126

    start = 6  i = 6 end = 12


33 ... 47
      true        true
    44 >= 33 && 44 <= 47

    0 1 2 3 4 5

int main() {
    for(int i = 2, i < text.size(), i++ ) {
        for(int j = 1, j < special[0], j++ ) {
            if (text[i] >= special[j] &&
              text[i] <= special[j + 1])
            {
                check(i, text[i]);
            }
        }
    }
    return 0;
}

void scan_massege(int start, char simbol) {
    for(int i = start, i < text.size(), i++ ) {
        if(text[i] == simbol) {
            out(start, i);
            return;
        }
    }
}

void out(int start,  int end) {
    for(int i = start, i <= end, i++ ) {
        printf("%ch", text[i]);
    }
    return;
}

mov al, [special + si]
    call print_simbol
    call print_space
    mov al, [special + si + 1]
    call print_simbol
    call print_space
    call print_enter

/////////////////

; Диапазон 33–47
    cmp bl, [special + si]
    jl end_check_special
    cmp bl, [special + si + 1]
    jg end_check_special

    jmp scan_message

////////////////


out str
   mov dx, offset text1
   mov ah, 09h
   int 21h

out char in str
   mov si, offset text1
   mov cl, [si + 2]
   mov ah, 02h
   mov dl, cl
   int 21h

out char
   mov ah, 02h
   mov dl, text1
   int 21h

refactor char for massive asci
   mov bl, 49
   mov [text1 + 1], bl
  
   mov dx, 0
   mov dl, offset text1
   mov ah, 09h
   int 21h

........
    mov ah, 02h
    mov dl, [special]
    int 21h

    mov si, offset special
    mov cl, [si]
    add cl, 1
    mov ah, 02h
    mov dl, cl
    int 21h


13
1

9 

word1 = test
word2 = niga
text = hllo test bro

       0123456789
            test

void main ()
{
    for(int i = 2, i < text.size(), i++ ) {
        if()
    }
}






jg tis > tis
    
    000001
    001000
    001001

def can_form_triangle(a, b, c):
    return (a + b > c) and (a + c > b) and (b + c > a)

A = [3, 5, 2, 7, 1, 8]
B = [4, 12, 1, 10, 2, 3]
C = [5, 9, 3, 4, 4, 5]

result_byte = 0
for i in range(6):
    if can_form_triangle(A[i], B[i], C[i]):
        result_byte |= 1 << (5 - i)  ;##### сдвигаем бит в нужную позицию

print(bin(result_byte))  ;##### выводим результат в бинарной форме

001011

A = [12, 23, 12, 23, 12, 23]
B = [12, 23, 12, 23, 12, 23]
C = [4, 8, 12, 34, 70, 50]

0000 1111

111100   =  60

A = [12, 23, 12, 23, 12, 23]
B = [12, 23, 12, 23, 12, 23]
C = [1, 100, 1, 1, 1, 1]

101111   =  

    mov saveCx, cx
    mov dx, 1
    mov ax, si
    mov cl, al
    shl dl, cl
    or result, dl
    mov cx, saveCx



import re

def find_double_vowels(text):
    # Список всех гласных
    vowels = 'aeiouAEIOU'
    
    # Разбиваем текст на слова
    words = text.split()
    
    # Фильтруем слова, содержащие удвоенные гласные
    result = [word for word in words if any(word[i] == word[i+1] and word[i] in vowels for i in range(len(word)-1))]
    
    return result

text = "Это пример текста с удвоенной гласной оо и aa."
double_vowel_words = find_double_vowels(text)

print(double_vowel_words)







mov ah, [input_text + si]
    mov al, [vowels + bx]

    cmp ah, al
    je start_have_vowels ; if (sibol == vowels)



start_check_words:
    mov startChar, si
    mov si, 0
    mov cx, 10
    mov saveSimbol, bl
check_words:
    mov bl, [vowels + si]
    mov ax, startChar
    add ax, si
    mov saveEnd, ax
    cmp saveSimbol, bl
    je start_print_message
end_check_words:
    add si, 1
    loop check_words
    jmp have_simbol



    mov ax, 0
    mov al, [thisWord + 1] ; загружаем длину thisWord
    cmp cx, ax
    jne next_processing    ; если длины не совпадают, переходим





text = XXhello this bro you
this = XXthis
that = XXthat

for(int i = 0; i < size.text; i++ )
{
    if(test[i] == word()){
        for(int j = 0; j < size.text; j++ ){
            if(test[i] == this[j]){

            }
        }
    }
}

test text > set text > hello


je == 
jne !=

jg >
jl <

jge >=
jle <=

x1 = 10, y1 = 40
x2 = 20, y2 = 20




for (size_t i = 0; i < count; i++)
{
    for (size_t j = 0; j < count; j++)
    {
        printf("$");
    }
    printf("\n");
}


    GeneralCycle:
            MOV AH, 08h ; Ввод символа с клавиатуры без отображения на экране
            int 21h
            cmp al, 'x'
            je exitGeneralCycle
            cmp al, 'w'
            je printFigure
            cmp al, 'c'
            je far ptr clearScrean

        nextGeneralCycle:
        jmp GeneralCycle
    exitGeneralCycle:

printFigure:
    DrawSquare 100, 20, 60, [Yellow]
jmp nextGeneralCycle

clearScrean: 
    ; Очищаем экран (заполняем его фоном)
    mov ax, 0A000h      ; Адрес видеопамяти для графического режима
    mov es, ax          ; Загружаем в сегмент
    xor di, di          ; Начинаем с начала видеопамяти (di = 0)
    mov cx, 320 * 200   ; Размер экрана (320 * 200 пикселей)
    xor al, al          ; Цвет фона (черный, 0)
    rep stosb           ; Заполняем видеопамять байтом из AL

    jmp nextGeneralCycle

-------------------

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

------------------------
@echo off

set TASM_PATH=C:\TASM\TASM.EXE
set TLINK_PATH=C:\TASM\TLINK.EXE

set PROJECT_ASM_PATH=C:\TASM\MAIN.ASM
set PROJECT_OBJ_PATH=C:\TASM\MAIN.OBJ
set CODE1_ASM_PATH=C:\TASM\CODE1.ASM
set CODE1_OBJ_PATH=C:\TASM\CODE1.OBJ
set PROJECT_EXE_PATH=C:\TASM\MAIN.EXE

set IOPROC_OBJ_PATH=C:\TASM\IOPROC.OBJ

set ERRORS_PROGI_CODE=C:\TASM\PROGI\ERRORS.TXT
%TASM_PATH% %PROJECT_ASM_PATH% > %ERRORS_PROGI_CODE%
%TASM_PATH% %CODE1_ASM_PATH% >> %ERRORS_PROGI_CODE%

%TASM_PATH% %PROJECT_ASM_PATH%
%TASM_PATH% %CODE1_ASM_PATH%

%TLINK_PATH% %PROJECT_OBJ_PATH%+%CODE1_OBJ_PATH%

echo finish

%PROJECT_EXE_PATH%




























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



==================================================




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

extrn print_hello:proc

;-----------------CODE-----------------;
code segment PUBLIC
start:
    ASSUME SS:stack1, DS:data, CS:code
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

    ;call OpenScreen
    call far ptr print_hello 

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
    
    GeneralCycle:
            MOV AH, 08h ; Ввод символа с клавиатуры без отображения на экране
            int 21h
            cmp al, 'a'
            je far ptr lefBox
            cmp al, 'd'
            je far ptr rightBox
            cmp al, 'w'
            je far ptr UpBox
            cmp al, 's'
            je far ptr DownBox
            cmp al, 'x'
            je far ptr exitGeneralCycle
            ;cmp al, 'q'
            ;je far ptr labrab1

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

end start















==============================================================
    DrawLine 20, 80, 80, 80, [Yellow]
    DrawLine 20, 60, 40, 60, [Yellow]
    DrawLine 40, 60, 40, 20, [Yellow]
    DrawLine 40, 20, 60, 20, [Yellow]
    DrawLine 60, 20, 60, 60, [Yellow]
    DrawLine 60, 60, 80, 60, [Yellow]
    DrawLine 80, 60, 80, 80, [Yellow]
    DrawLine 20, 60, 20, 80, [Yellow]

0	Чёрный (Black)
1	Синий (Blue)
2	Зелёный (Green)
3	Голубой (Cyan)
4	Красный (Red)
5	Пурпурный (Magenta)
6	Коричневый (Brown)
7	Серый (Light Gray)
8	Тёмно-серый (Dark Gray)
9	Светло-синий (Light Blue)
10	Светло-зелёный (Light Green)
11	Светло-голубой (Light Cyan)
12	Светло-красный (Light Red)
13	Светло-пурпурный (Light Magenta)
14	Светло-жёлтый (Yellow)
15	Белый (White)


DrawLine MACRO x1, y1, x2, y2
    LOCAL isPositivDx, isPositivDy, isPositivSx, isZeroSx, isPositivSy, isZeroSy, printPoint, break, not_equal, conditionOne, conditionTwo
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
        printPoint:
            ;-Проверка на выход за границы экрана-;
                ;=== if(cx < 0 || cx > 320 || dx < 0 || dx > 200) ===;
                cmp cx, 0
                jl break
                cmp cx, 320
                jg break
                cmp dx, 0
                jl break
                cmp dx, 200
                jg break

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
                    jmp break
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
                jmp printPoint

            ;-вывод из цикла-;
                break:
ENDM











































    ; Переход к обработке дробной части
    mov bx, 25             ; Дробная часть (0.25 -> 25)
    mov cx, 1              ; Счётчик бит для дробной части
convert_fraction:
    shl bl, 1              ; Умножаем дробную часть на 2
    jc set_bit             ; Если перенос, добавляем '1'
    jmp next_fraction
set_bit:
    mov al, '1'
    call printSimbol
next_fraction:
    inc cx                 ; Увеличиваем счётчик бит
    cmp cx, 8              ; Ограничиваем обработку до 8 дробных бит
    jne convert_fraction

    mov bx, 0
    mov cx, 1
    mov ax, 7
convert_integer:
    xor dx, dx
    mov si, 2
    div si
    shl dl, cl
    mov bl, [buffer + 2]
    add bl, dl
    mov [buffer + 2], bl
    inc cx
    cmp ax, 0
    jne convert_integer


    xor dx, dx
    mov ax, 5
    mov bx, 2
    div bx
    mov [buffer + 2], dl








































    mov ax, si
    add ax, bx
    add ax, 1  ; startMove



start_add_save_text:
    call pushSiCx
    mov ax, 0
    mov ax, si
    add ax, cx
    add ax, step
    mov si, ax ; si
    mov bx, lenghtText
    sub bx, ax
    mov cx, bx ; cx
    mov ax, 0
    mov bx, 0
add_save_text:
    mov al, [saveChars + bx]
    mov [text + si], al
    inc si
    inc bx
    loop add_save_text
end_add_save_text:
    jmp next_processing
    


jmp start_add_save_text

















|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

; Процедура пропуска пробелов
skip_spaces proc
    next_space:
        cmp byte ptr [si], ' '  ; Проверяем пробел
        jne skip_done
        inc si                  ; Пропускаем пробел
        jmp next_space
    skip_done:
        ret
skip_spaces endp

; Процедура преобразования строки в число
parse_number proc
    xor ax, ax              ; Обнуляем результат
    xor bx, bx              ; Используем BX как накопитель
parse_digit:
    cmp byte ptr [si], '0'  ; Проверяем, что символ - цифра
    jb parse_done
    cmp byte ptr [si], '9'
    ja parse_done
    sub byte ptr [si], '0'  ; Преобразуем ASCII в число
    mov al, [si]
    add bx, bx
    add bx, bx              ; BX = BX * 10
    add bx, ax              ; BX = BX + AL
    inc si                  ; Переход к следующему символу
    jmp parse_digit
parse_done:
    mov ax, bx              ; Переносим результат в AX
    ret
parse_number endp

; Макрос для нахождения суммы элементов массива с нечётными номерами
sum_odd MACRO mus, size, result
    LOCAL odd_loop_start, odd_loop_end

    mov si, OFFSET mus    ; Указатель на начало массива
    xor ax, ax            ; Обнуляем AX для накопления суммы
    mov cx, size          ; Количество элементов
    shr cx, 1             ; CX = количество нечётных индексов

odd_loop_start:
    add ax, [si + 2]      ; Добавляем значение из нечётного индекса (смещение 2 байта)
    add si, 4             ; Переход к следующему нечётному индексу
    loop odd_loop_start

    mov [result], ax      ; Сохранение результата
ENDM
|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

; Ввод массива B
lea dx, message_inputb
mov ah, 09h
int 21h
vvod B, 10

; Ввод массива C
lea dx, message_inputc
mov ah, 09h
int 21h
vvod C, 10

; Ввод массива K
lea dx, message_inputd
mov ah, 09h
int 21h
vvod K, 15

; Сообщение о начале расчёта
lea dx, message_input
mov ah, 09h
int 21h

; Расчёт суммы элементов массива A
sum_odd A, 15, sum_a

; Расчёт суммы элементов массива B
sum_odd B, 15, sum_b

; Расчёт суммы элементов массива C
sum_odd C, 15, sum_c

; Расчёт суммы элементов массива K
sum_odd K, 15, sum_k

; Сообщение о завершении расчёта
lea dx, message_result
mov ah, 09h
int 21h
























// Функция для вычисления наибольшего общего делителя (НОД)
int NOD(int a, int b) {
    if (b == 0)
        return a;
    return NOD(b, a % b);
}

// Функция для вычисления наименьшего общего кратного (НОК)
int NOK(int* mass, int n){
    if (n == 0)
        return 1; // Если массив пустой, вернем 1
    int result = mass[0];
    for (int i = 1; i < n; i++)
        result = (result * mass[i]) / NOD(result, mass[i]); // Используем НОК через НОД
    return result;
}





; 24. Составить макроопределение для нахождения наибольшего общего делителя двух чисел. 
; Используя это макроопределение найти НОД в массиве из 15 чисел.

    test1 dw 0
    test2 dw 0
    message_input db 'Enter array: $'
    message_output db 'NOD: $'


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


    lea dx, message_input
    mov ah, 09h
    int 21h
    inpMuss array, 15


    outMuss array, 15

    call print_enter
    lea dx, message_output
    mov ah, 09h
    int 21h
    
    call print_enter




#include <iostream.h>
//short int numb1, numb2, numb3;
//int result;
// Linker Error: Fixup overflow at _TEXT:0039, targer = _OpenWin in module MY3CPP.CPP

//extern "C" {Lab1S(void);}
extern "C" {OpenW(void);}
extern "C" {CloseW(void);}

void A_PRO(){
    cout << "Result: ";
    //Lab1S();
    //cout << result << endl;
}
void A_openWindow()
{
    OpenW();
}
void A_closeWindow()
{
    CloseW();
}

int main()
{
    A_openWindow();
    A_closeWindow();
    return 0;
}








.model large,c

.data
;extrn aaaS:byte, bbbS:byte, cccS:byte, result:word

.code
;Public Lab1S

Public OpenW
Public CloseW
Lab1S proc
	;mov ax, 0
	;mov al, aaaS
	;div bbbS
	;mov result, ax
	ret
Lab1S endp

OpenW proc
    mov ah, 0
	ret
OpenW endp

CloseW proc
    mov al, 3
	ret
CloseW endp

end






include IO.ASM
;-----------------STACK-----------------;
stack1 segment
    db 256 dup(?)
stack1 ends

;-----------------DATA-----------------;
data segment
    ;---Params---;
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


;-----------------CODE-----------------;
code segment
start:
    ASSUME SS:stack1, DS:data, CS:code
    mov ax, data
    mov DS, ax

;---------------------JMP-RUN--------------------;
jmp run_process

;---------------------MACROS---------------------;
DrawGradLine MACRO setX1, setY1, setX2, setY2, setColor1, setColor2
    mov [x1], setX1
    mov [y1], setY1
    mov [x2], setX2 
    mov [y2], setY2
    mov ax, setColor1
    mov [ColorsArray + 1], al
    mov ax, setColor2
    mov [ColorsArray + 2], al
    call GoDrawLine
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
    call updateScrean
    
    ;            x1  y1  x2  y2   color1   color2
    DrawGradLine 20, 20, 20, 80, [Yellow], [Red]
    DrawGradLine 20, 20, 60, 80, [Yellow], [Red]
    DrawGradLine 60, 80, 60, 20, [Yellow], [Red]

    MOV AH, 08h ; Ввод символа с клавиатуры без отображения на экране
    int 21h
    
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

            ;   int dey = abs(y2 - y1);
            cmp dx, 0
            jge isPositivDy
            neg dx
        isPositivDy:
            mov dey, dx

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
        sub ax, bx ; (dex - dey)
        mov error, ax
        ;outint ax

    ;-----Начальная точка--------;
        mov cx, x1
        mov dx, y1

    ;--------------Цикл Отрисовки--------------;
        printLinePoint:
            ;-Проверка на выход за границы экрана-;
                ;=== if(cx < 0 || cx > 320 || dx < 0 || dx > 200) ===;
                ;cmp cx, 0
                ;jl breakLinePoint
                ;cmp cx, 320
                ;jg breakLinePoint
                ;cmp dx, 0
                ;jl breakLinePoint
                ;cmp dx, 200
                ;jg breakLinePoint

            
                mov bx, dx

                cmp bx, [dey]
                jle color1
                jg color2
                jmp setColors

                color1:
                    mov al, [ColorsArray + 1]
                    mov [color], al
                    jmp setColors
                color2:
                    mov al, [ColorsArray + 2]
                    mov [color], al
                setColors:
                
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
                    ;---int tmp = 2 * error;
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
end start










-------------------------------------------------------











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





-----------------------------------------------------------








void printRomb(WINDOW* win, int x, int y, int size) {
    color = 14;

    int x1 = x - size;
    int y1 = y - size;
    int x2 = x + size;
    int y2 = y + size;

    for (int py = y1; py <= y2; py++) {
        for (int px = x1; px <= x2; px++) {
            if (px < 0 || px > 320 || py < 0 || py > 200) continue;

            
            if (abs(px - x) + abs(py - y) <= size) { 
                PosX = px;
                PosY = py;
                win->printPoint();
            }
        }
    }
    color = 3;
    PosX = x;
    PosY = y;
    win->printPoint();
}

void printSquare(WINDOW* win, int x, int y, int size, int newColor) {
    color = newColor;

    int x1 = abs(x - size);
    int y1 = abs(y - size);
    int x2 = x + size;
    int y2 = y + size;

    for (int py = y1; py < y2; py++) {
        for (int px = x1; px < x2; px++) {
            if(px > 320 || px < 0 || py > 200 || py < 0) continue;
            PosX = px;
            PosY = py;
            win->printPoint();
        }
    }
}


void test1(WINDOW* win)
{
    for (size_t i = 70; i < 80; i++)
    {
        printSquare(win, 100, 100, i, 2);
    }
}
void test2(WINDOW* win)
{
    for (size_t i = 70; i < 80; i++)
    {
        printRomb(win, 100, 100, i);
    }
}
extern "C" {void ClearScreen(void);};


----------------------------------------------------------



















extern "C" {
    void OpenWin(void);
    void CloseWin(void);
    void Point(void);
    void KeyPress(void);
    void ClearScreen(void);
};

class WINDOW {
private:
    char* backBuffer;  // Используем динамическую память

public:
    WINDOW() {
        backBuffer = new char[320 * 200];  // Выделяем память для буфера
        OpenWin(); 
        memset(backBuffer, 0, 320 * 200);  // Очищаем буфер
    }

    void getKey() { KeyPress(); }

    void printPoint() {
        int index = PosY * 320 + PosX;
        if (index >= 0 && index < 320 * 200)
            backBuffer[index] = color;  // Рисуем в буфере
    }

    void UpdateScreen() {
        memcpy((char*)0xA0000, backBuffer, 320 * 200);  // Копируем буфер на экран
        memset(backBuffer, 0, 320 * 200);  // Очищаем буфер
    }

    ~WINDOW() { 
        CloseWin(); 
        delete[] backBuffer;  // Освобождаем память
    }
};


