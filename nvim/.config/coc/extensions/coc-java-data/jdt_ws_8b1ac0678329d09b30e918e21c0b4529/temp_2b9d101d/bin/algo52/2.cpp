//#include<bits/stdc++.h>
#include <cstdio>
#include <iostream>
#include <cstring>
#include <algorithm>
//#include <vector>
//#include <queue>
//#include <cmath>
//#include <unordered_map>
//#include <unordered_set>
//#include <map>
//#include <set>
//#include <sstream>
//#include <pair>
//#include <stack>
//#include <climits>

using namespace std;

#define rep(x, y, z) for(int x = y; x < z; x ++)
#define dec(x, y, z) for(int x = y; x > z; x --)
#define x first
#define y second

typedef long long LL;
typedef pair<int, int> PII;
typedef pair<double, double> PDD;
typedef unsigned long long ULL;

const int INF = 0x3f3f3f3f;

const int N = 1e5 + 10;

LL n, cnt;

struct node
{
    LL date[6];
    node()
    {
        memset(date, 0, sizeof date);
    }
};

node operator+(const node &a, const node &b)
{
    node c;
    for (LL i = 0; i <= 5; i ++)
    {
        c.date[i] = a.date[i] + b.date[i];
    }
    return c;
}

node dp[3][3][3][110];
bool vis[3][3][3][110];

void moveto(LL x, LL y, node& temp)
{
    if (x==0 && y == 1) temp.date[0] ++;
    if (x==0 && y == 2) temp.date[1] ++;
    if (x==1 && y == 0) temp.date[2] ++;
    if (x==1 && y == 2) temp.date[3] ++;
    if (x==2 && y == 0) temp.date[4] ++;
    if (x==2 && y == 1) temp.date[5] ++;

    return;
}

node hanoi(LL a, LL b, LL c, LL n) // a -> c, by b ( nth )
{
    if (vis[a][b][c][n]) return dp[a][b][c][n];
    if (n == 1)
    {
        moveto(a, c, dp[a][b][c][n]);
        vis[a][b][c][n] = true;
        return dp[a][b][c][n];
    }
    node temp;
    temp = temp + hanoi(a, c, b, n - 1);
    moveto(a, c, temp);
    temp = temp + hanoi(b, a, c, n - 1);
    vis[a][b][c][n] = true;
    return dp[a][b][c][n] = temp;
}

int main(void)
{
    //ios::sync_with_stdio(false);
    //cin.tie(nullptr);

    cin >> n;
    node res = hanoi(0, 1, 2, n);
    printf("A->B:%lld\n", res.date[0]);
    printf("A->C:%lld\n", res.date[1]);
    printf("B->A:%lld\n", res.date[2]);
    printf("B->C:%lld\n", res.date[3]);
    printf("C->A:%lld\n", res.date[4]);
    printf("C->B:%lld\n", res.date[5]);
    printf("SUM:%lld\n",(LL(1) << n) - 1);//公式ans=2^n-1

    return 0;
}
