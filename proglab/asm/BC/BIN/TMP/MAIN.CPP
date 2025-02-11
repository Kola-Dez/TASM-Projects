#include <iostream.h>
#include <math.h>
#include <string.h>
#include "WINDOW.CPP"

short int color, key;
int PosX, PosY;
char simbol;
int WinWidth = 320, WinHeight = 200;




void printRadSquare(WINDOW* win, int x, int y, int size, float grad, int newColor) {
    color = newColor;

    int halfSize = size / 2;
    float rad = grad * (M_PI / 180.0);

    for (int py = -halfSize; py <= halfSize; py++) {
        for (int px = -halfSize; px <= halfSize; px++) {

            // Вычисляем координаты поворота
            int rotatedX = x + px * cos(rad) - py * sin(rad);
            int rotatedY = y + px * sin(rad) + py * cos(rad);

            // Проверяем границы экрана
            if (rotatedX < 0 || rotatedX >= 320 || rotatedY < 0 || rotatedY >= 200) continue;

            // Заполняем всю область
            for (int fillX = rotatedX - 1; fillX <= rotatedX + 1; fillX++) {
                for (int fillY = rotatedY - 1; fillY <= rotatedY + 1; fillY++) {
                    if (fillX >= 0 && fillX < 320 && fillY >= 0 && fillY < 200) {
                        
                    }
                }
            }
        }
    }
}



void test3(WINDOW* win)
{
    int minSize = 10, maxSize = 360;

    for (size_t i = minSize; i <= maxSize; i += 1)
    {
        printRadSquare(win, 100, 100, i / minSize, i, 14);
    }
    for (size_t h = minSize; h <= maxSize; h += 1)
    {
        printRadSquare(win, 100, 100, h / minSize, h, 0);
    }
    win->UpdateScreen();
    for (size_t j = maxSize; j >= minSize; j -= 1)
    {
        printRadSquare(win, 100, 100, j / minSize, j, 2);
    }
}


void runGame()
{
    WINDOW* win = new WINDOW(320, 200);
    
    for (size_t i = 0; i < 2; i++)
    {
        test3(win);
    }
    
    
    // win->testFol();

    //win->getKey();
    //simbol = key;
    //cout << "simbol = " << simbol << endl;
    //win->getKey();

    // clear Objects
    win->~WINDOW();
    delete win;
}

void printWindowBuffer()
{

}

int main()
{
    runGame();
    
    return 0;
}