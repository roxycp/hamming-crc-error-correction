#include <iostream>
#include <cmath>
#include <string>

using namespace std;

string transformare_binar(int numar, int numar_biti) {
    string binar = "";
    for (int i = numar_biti - 1; i >= 0; i--) {
       int p = pow(2, i);

        if (numar & p) {
            binar += '1';
        } else {
            binar += '0';
        }
    }
    return binar;
}

int main() {
    float numar;

    cout << "Introdu un numar in virgula mobila (float): ";
    cin >> numar;
    int semn;
    if (numar>0)
        semn=0;
        else
            semn=1;

    double valoare_absoluta = fabs(numar);

    int exponent = 0;
    if (valoare_absoluta != 0.0) {
        while (valoare_absoluta >= 2.0) {
            valoare_absoluta /= 2.0;
            exponent++;
        }
        while (valoare_absoluta < 1.0) {
            valoare_absoluta *= 2.0;
            exponent--;
        }
    }

    int exponent_ieee = exponent + 127;

    valoare_absoluta -= 1.0;
    unsigned int mantisa = 0;
    for (int i = 0; i < 23; i++) {
        valoare_absoluta *= 2.0;
        if (valoare_absoluta >= 1.0) {
            mantisa = mantisa * 2 + 1;
            valoare_absoluta -= 1.0;
        } else {
            mantisa = mantisa * 2;
        }
    }


    cout << "Reprezentare in virgula mobila (simpla precizie):" << endl;
    cout << "Semn: " << semn << " (1 pentru negativ, 0 pentru pozitiv)" << endl;

    cout << "Exponent (cu bias 127): " << exponent_ieee
         << " (exponent real: " << exponent << "), in binar: "
         << transformare_binar(exponent_ieee, 8) << endl;

    cout << "Mantisa (in binar pe 23 biti): " << transformare_binar(mantisa, 23) << endl;

    return 0;
}

