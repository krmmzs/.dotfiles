// 不能同时都经过这两个神仙即可。。麻了
// 凝视虚空吧2333
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
int dist[N][N];

int dx[4] = {-1, 0, 1, 0}, dy[4] = {0, 1, 0, -1};

PII ed;

struct Node
{
    int x, y;
    bool F, M;
};

int bfs(int x, int y)
{
    memset(dist, -1, sizeof dist);
    queue<Node> q;
    q.push({x, y, 0, 0});
    dist[x][y] = 0;

    while (q.size())
    {
        Node t = q.front();
        q.pop();

        if (t.x == ed.x && t.y == ed.y) return dist[t.x][t.y];

        for (int i = 0; i < 4; i ++)
        {
            int a = t.x + dx[i], b = t.y + dy[i];
            if (a <= 0 || a > n || b <= 0 || b > m || g[a][b] == '*') continue;

            Node tt = {a, b, 0, 0};
            if (t.F) tt.F = true;
            if (t.M) tt.M = true;
            if (dist[a][b] == -1)
            {
                if (g[a][b] == 'F')
                {
                    if (tt.M) continue;
                    else tt.F = true;
                }
                if (g[a][b] == 'M')
                {
                    if (tt.F) continue;
                    else tt.M = true;
                }
                dist[a][b] = dist[t.x][t.y] + 1;
                q.push(tt);
            }
        }
    }
    return -1;
}


int main(void)
{
    int T;
    cin >> T;
    while (T --)
    {
        cin >> n >> m >> ed.x >> ed.y;
        for (int i = 1; i <= n; i ++)
            cin >> (g[i] + 1);

        int res = bfs(1, 1);
        if (res != -1) cout << res * 2 << endl;
        else cout << "IMPOSSIBLE" << endl;

    }

    return 0;
}
