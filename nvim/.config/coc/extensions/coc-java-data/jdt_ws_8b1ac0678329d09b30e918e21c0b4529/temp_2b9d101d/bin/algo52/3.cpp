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

int T;

int l[N], r[N], w[N];
int path[N];
int cnt;

void dfs(int u)
{
    if (u == 0) return;
    dfs(l[u]);
    path[cnt ++] = w[u];
    dfs(r[u]);
}

int main(void)
{
    //ios::sync_with_stdio(false);
    //cin.tie(nullptr);

    cin >> T;

    while (T --)
    {
        cnt = 0;
        int m, root;
        cin >> m >> root;
        for (int i = 1; i <= m; i ++)
        {
            int v, a, b;
            cin >> v >> a >> b;
            l[i] = a, r[i] = b, w[i] = v;
        }

        dfs(root);

        bool flag = true;
        for (int i = 0; i < cnt - 1; i ++)
            if (path[i] > path[i + 1])
            {
                flag = false;
                break;
            }

        if (!flag) cout << "no" << endl;
        else cout << "yes" << endl;
    }

    return 0;
}
