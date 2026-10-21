#include <iostream>
#include <string>
#include <cmath>

using namespace std;


string conversie_binar(int n, int nr_biti) {
    string binar = "";
    for (int i = 0; i < nr_biti; i++) {
        binar = (char)((n % 2) + '0') + binar;
        n /= 2;
    }
    return binar;
}


string reprezentare_cod_direct(int n, int nr_biti) {
    string semn = (n >= 0) ? "0" : "1";
    int val_abs = abs(n);
    string valoare_binara = conversie_binar(val_abs, nr_biti - 1);
    return semn + valoare_binara;
}

string reprezentare_cod_indirect(int n, int nr_biti) {
    if (n >= 0) {
        return reprezentare_cod_direct(n, nr_biti);
    } else {
        int val_abs = abs(n);
        string valoare_binara = conversie_binar(val_abs, nr_biti - 1);
        for (char &bit : valoare_binara) {
            bit = (bit == '0') ? '1' : '0';
        }
        return "1" + valoare_binara;
    }
}

string reprezentare_cod_complementar(int n, int nr_biti) {
    if (n >= 0) {
        return reprezentare_cod_direct(n, nr_biti);
    } else {
        int val_abs = abs(n);
        string valoare_binara = conversie_binar(val_abs, nr_biti);
        for (char &bit : valoare_binara) {
            bit = (bit == '0') ? '1' : '0';
        }

        int i = valoare_binara.size() - 1;
        while (i >= 0 && valoare_binara[i] == '1') {
            valoare_binara[i] = '0';
            i--;
        }
        if (i >= 0) {
            valoare_binara[i] = '1';
        }
        return valoare_binara;
    }
}

int main() {
    int numar = -5;
    int nr_biti = 8;

    cout << "Numarul " << numar << " in reprezentare pe " << nr_biti << " biti:" << endl;
    cout << "Cod Direct:      " << reprezentare_cod_direct(numar, nr_biti) << endl;
    cout << "Cod Indirect:    " << reprezentare_cod_indirect(numar, nr_biti) << endl;
    cout << "Cod Complementar: " << reprezentare_cod_complementar(numar, nr_biti) << endl;

    return 0;
}

