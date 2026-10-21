#include <iostream>
using namespace std;

int main()
{
    string msj, crc, codificare="";
    cout<<"Introdu mesajul=";
    getline(cin,msj);
    cout<<"Introdu polinomul generator reprezentat in binar=";
    getline(cin,crc);
    int m=msj.length(), n=crc.length();
    codificare+=msj;
    for(int i=1; i<=n-1; i++)
        codificare+='0';
    for(int i=0; i<=codificare.length()-n; )
        {
        for(int j=0; j<=n; j++)
            if (codificare[i+j]==crc[j])
        codificare[i+j]= '0';
            else
        codificare[i+j]= '1';
    for( i=0; i<= codificare.length() && codificare[i]!= '1'; i++);
    }
    cout<<codificare;
    return 0;
}
