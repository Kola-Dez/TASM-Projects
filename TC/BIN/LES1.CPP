#include <iostream.h>

short int aaaS, bbbS, cccS;
int result = 0;


extern "C" {Lab1S(void);}


void F_ASM(){
	Lab1S();
	cout << "ASM: ";
	cout << result << endl;

}
void F_CPP(){
	cout << "CPP: ";
	result = aaaS / bbbS + cccS;
	cout << result << endl;
}



int main()
{
	cout << "ENTER A: ";
	cin >> aaaS;
	cout << endl;

	cout << "ENTER B; ";
	cin >> bbbS;
	cout << endl;

	cout << "ENTER C: ";
	cin >> cccS;
	cout << endl;
	F_CPP();
	cin >> result;
	return 0;
}