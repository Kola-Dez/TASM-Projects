#include <iostream.h>
#include "BUFFER.CPP"

extern "C" {
    void OpenWin(void);
    void CloseWin(void);
    void Point(void);
    void KeyPress(void);
    void ClearScreen(void);
};

class WINDOW
{
    private:
        BUFFER* buffer;
        int width, height;
    public:
        WINDOW(int width, int height) {
            this->width = width;
            this->height = height;
            this->buffer = new BUFFER("buffer.txt", this->width, this->height);
            OpenWin(); 
        }
        void getKey(){ KeyPress(); }
        void printPoint()
        {
            Point();
        }
        void testFol()
        {
            this->buffer->writeNumbers();
            // this->buffer->setPointBuffer(2, 2, 2);
            // this->buffer->readNumbers();
        }
        void UpdateScreen()
        {
            ClearScreen();
        }
        ~WINDOW()
        {
            CloseWin();
            buffer->~BUFFER();
            delete buffer;
        }
};
