#include <iostream>
#include <algorithm>
#include <string>
#include <map>
using namespace std;

// Dotie
int  r[] = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
string l = "NUATKLESaG";

int  d[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
map<char, int> m;
double prev = 0;
double sum = 0;

void init();
bool checkConstants();
int n(const string& s);
void show();

int main()
{
    init();
    do {
        if (checkConstants()) {
            if (n("NU") + n("ATKAL") + n("NEKAS") + n("NESANaK") == n("UGaLE00") ) show();
        }
    } while (next_permutation(d, d + 10) );
    cout << ":all done in " << (double)clock() / CLOCKS_PER_SEC - prev + sum << "s";
    cin.get();    
}








void init()
{
    for (int i = 0; i < l.size(); ++i) m[ l[i] ] = i;
}

bool checkConstants()
{
    for (int i = 0; i < 10; ++i)
        if (r[i] != -1 && r[i] != d[i]) return false;
    return true;
}

int n(const string& s)
{
    int n = 0;
    for (int i = 0; i < s.size(); ++i) {
        int cur = s[i] >= '0' && s[i] <= '9' ? s[i] - '0' : d[m[s[i] ] ]; 
        n = 10*n + cur;  
    }
    return n;
}

void show() 
{
    for (int i = 0; i < l.size(); ++i)
        cout << l[i] << " = " << d[ m[ l[i] ] ] << endl;
    double t = (double)clock() / CLOCKS_PER_SEC;
    sum += t - prev;
    cout << ":took " << t - prev << "s\n:next?";
    cin.get();
    prev = t;
}

