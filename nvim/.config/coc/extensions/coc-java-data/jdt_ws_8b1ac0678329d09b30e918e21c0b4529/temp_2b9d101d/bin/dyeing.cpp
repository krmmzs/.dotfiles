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

const int N = 1e5 + 10, M = N * 2;

int n, m;
int h[N], e[M], ne[M], idx;
int color[N];

void add(int a, int b)
{
    e[idx] = b, ne[idx] = h[a], h[a] = idx ++;
}

bool dfs(int u, int x)
{
    color[u] = x;

    for (int i = h[u]; i != -1; i = ne[i])
    {
        int j = e[i];

        if (!color[j])
        {
            if (!dfs(j, 3 - x))
            {
                return false;
            }
        }
        else if (color[j] == x)
            return false;
    }

    return true;
}

int main(void)
{
    memset(h, -1, sizeof h);

    cin >> n >> m;
    for (int i = 0; i < m; i ++)
    {
        int a, b;
        cin >> a >> b;

        add(a, b), add(b, a);
    }

    bool flag = true;
    for (int i = 1; i <= n; i ++)
    {
        if(!color[i])
        {
            if (!dfs(i, 1))
            {
                flag = false;
                break;
            }
        }
    }

    if (flag) cout << "Yes";
    else cout << "No";

    return 0;
}
