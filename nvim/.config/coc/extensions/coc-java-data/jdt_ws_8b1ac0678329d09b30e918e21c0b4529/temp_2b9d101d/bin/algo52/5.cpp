#include <iostream>
using namespace std;

const int N = 100010;

int n, k;
int q[N];

int quick_sort(int l, int r, int k)
{
    if (l == r) return q[l];

    int x = q[l + r >> 1], i = l - 1, j = r + 1;
    while (i < j)
    {
        do i ++;while (q[i] < x);
        do j --;while (q[j] > x);
        if (i < j) swap(q[i], q[j]);
    }
    int sequence = j - l + 1;
    if (k <= sequence)return quick_sort(l, j, k);//这里不用else的原因是因为用了return

    return quick_sort(j + 1, r, k - sequence);
}

inline int read()
{
    int x = 0, f = 1;
    char ch = getchar();
    while(ch < '0' || ch > '9'){
        if (ch == '-')
            f = -1;
        ch = getchar();
    }
    while(ch >= '0' && ch <= '9'){
        x = (x<<1) + (x<<3) + (ch^48);
        ch = getchar();
    }
    return x * f;
}


int main(void)
{
    int T;
    T = read();

    while (T --)
    {
        n = read(), k = read();

        for (int i = 0; i < n; i++) q[i] = read();

        cout << quick_sort(0, n - 1, k) << endl;
    }


    return 0;
}
