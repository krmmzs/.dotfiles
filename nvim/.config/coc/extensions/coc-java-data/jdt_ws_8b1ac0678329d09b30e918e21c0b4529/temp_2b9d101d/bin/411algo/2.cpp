//#include<bits/stdc++.h>
#include <cstdio>
#include <iostream>
#include <cstring>
#include <algorithm>
//#include <vector>
#include <queue>
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

#define x first
#define y second

typedef long long LL;
typedef pair<int, int> PII;
typedef pair<double, double> PDD;
typedef unsigned long long ULL;

const int INF = 0x3f3f3f3f;

const int N = 510;

int n, m;
char g[N][N];
int res1, res2;

int dx[4] = {-1, 0, 1, 0}, dy[4] = {0, 1, 0, -1};

void dfs(int x, int y)
{
    if (x < 0 || x >= n || y < 0 || y >= n || g[x][y] == '.')
        return;
    if ((x + y) & 1) res1 ++;
    else res2 ++;
    g[x][y] = '.';
    for (int i = 0; i < 4; i ++)
    {
        int a = x + dx[i], b = y + dy[i];
        dfs(a, b);
    }
}

int main(void)
{
    int T;
    cin >> T;
    int idx = 1;

    while (T --)
    {
        int res = 0;
        cin >> n;
        for (int i = 0; i < n; i ++)
            cin >> g[i];

        for (int i = 0; i < n; i ++)
            for (int j = 0; j < n; j ++)
                if (g[i][j] == '#')
                {
                    res1 = 0, res2 = 0;
                    dfs(i, j);
                    res += min(res1, res2);
                }
        printf("Case %d: %d\n", idx ++, res);
    }

    return 0;
}
