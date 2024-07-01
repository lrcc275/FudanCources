#include <A.h>

__attribute__ ((common)) int a;
__attribute__ ((weak)) int b;
extern int c;
const int d = 1;

using std::cout, std::endl;

void A() {
    cout << "我是A哒 " << LenOfMassSTR() << endl;
}