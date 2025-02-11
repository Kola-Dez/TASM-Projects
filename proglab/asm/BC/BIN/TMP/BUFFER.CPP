#include <fstream.h>
#include <iostream.h>

class BUFFER {
private:
    fstream file;
    int width, height;

public:
    BUFFER(const char* fileName, int width, int height) {
        this->width = width;
        this->height = height;
        file.open(fileName, ios::out | ios::in | ios::trunc); // Открытие файла на запись и чтение
        if (!file) {
            cerr << "Error opening file!" << endl;
        }
    }

    void setPointBuffer(int x, int y, int value) {
        if (file) {
            file.seekg((y - 1) * width + (x - 1));
            file << value << " ";
        }
    }

    void writeNumbers() {
        if (file) {
            // Записываем начальные данные в файл
            file.seekg(0, ios::beg);  // Сброс позиции в начале файла
            for (int i = 0; i <= this->height; i++) {
                for (int j = 0; j <= this->width; j++) {
                    file << j << " ";  // Записываем "1" для каждого элемента
                }
                file << "\n";
            }
        }
    }

    void readNumbers() {
        if (file) {
            file.seekg(0);  // Считываем данные с начала файла
            int num;
            while (file >> num) {
                cout << num << " ";  // Выводим каждое число
            }
        }
    }

    ~BUFFER() {
        if (file) {
            file.close();  // Закрываем файл
        }
    }
};