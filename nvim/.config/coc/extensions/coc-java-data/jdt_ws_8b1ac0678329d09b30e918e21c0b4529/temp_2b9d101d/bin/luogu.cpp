#include <iostream>
#include <cstring>
#include <algorithm>

using namespace std;

const int N = 100010;

int top;
int stack[N], a[N]; // a to save value
int s[N], e[N]; // s and e to save startidx endidx
int res;
int n;

int main(void)
{
    cin >> n;

    // input value， update s[] and e[]
    for (int i = 1; i <= n; i ++)
    {
        cin >> a[i];
        int &x = a[i];
        if (!s[x])
            s[x] = i;
        e[x] = i;
    }
    e[0] = n + 1;
    a[n + 1] = 0;
    // 从前往后枚举位置
    for (int i = 0; i <= n + 1; i ++)
    {
        int &x = a[i];
        if (i == s[x])
        {
            stack[++ top] = x;
            res = max(res, top);
        }
        if (x != stack[top])
        {
            res = 0;
            break;
        }
        if (i == e[x])
            top --;
    }

    cout << res - 1 << endl;

    return 0;
}
