class A {
  public: 
    int x;
    char* y;
    A() {}
    A(char yVal)
    {
    	y = &yVal;
    }
    char* getY() {return y;}
};
class B : public A {
  public:
    float z;
    int y;
    B(int yVal)
    {
    	A('B');
    	y = yVal;
    }
};

#include <iostream>

using namespace std;

int main()
{
	A a('A');
	B b(65);
	cout << *(a.y);
	cout << b.y;
	cout << b.getY();
}