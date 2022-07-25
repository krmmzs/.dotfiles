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
char start, ed;
int sa, sb;
int ea, eb;
bool flag;

int dx[4] = {-1, 0, 1, 0}, dy[4] = {0, 1, 0, -1};

void bfs(int x, int y)
{
    flag = false;
    queue<PII> q;
    q.push({x, y});
    g[x][y] = '#';
    while (q.size())
    {
        PII t = q.front();
        q.pop();
        for (int i = 0; i < 4; i ++)
        {
            int a = t.x + dx[i], b = t.y + dy[i];
            if (a < 0 || a >= n || b < 0 || b >= m) continue;
            if (g[a][b] == '#') continue;

            if (a == ea && b == eb)
            {
                flag = true;
                break;
            }

            q.push({a, b});
            g[a][b] = '#';
        }
    }
    if (flag) cout << "Yes" << endl;
    else cout << "No" << endl;
}

int main(void)
{
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    while (cin >> n >> m)
    {
        flag = false;
        for (int i = 0; i < n; i ++)
            for (int j = 0; j < m; j ++)
            {
                cin >> g[i][j];
                if (g[i][j] == 'S')
                    sa = i, sb = j;
                if (g[i][j] == 'E')
                    ea = i, eb = j;
            }
        bfs(sa, sb);
    }

    return 0;
}
