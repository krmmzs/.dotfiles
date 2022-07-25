// 多次bfs即可， 先从人到钥匙， 然后从钥匙到出口，两次bfs md, 找到反例了怪我没有证明tmd
// 好
// 那就从人和终点搜多个钥匙（两个单源最短路，然后之后遍历所有钥匙（才50个）然后求min即可
//
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

const int N = 1010;

struct Node
{
    int x, y, w;
};

char g[N][N];
int n, m;
int dist[2][N][N];

PII bg, ed;
queue<Node> q;

int dx[4] = {-1, 0, 1, 0}, dy[4] = {0, 1, 0, -1};

void bfs(int x, int y, int tt)
{
    for (int i = 1; i <= n; i ++)
        for (int j = 1; j <= m; j ++)
            dist[tt][i][j] = INF;

    q.push({x, y, 0});

    while (q.size())
    {
        Node t = q.front();
        q.pop();

        for (int i = 0; i < 4; i ++)
        {
            int a = t.x + dx[i], b = t.y + dy[i];
            if (a < 1 || a > n || b < 1 || b > m || g[a][b] == '#' || g[a][b] == 'E' || dist[tt][a][b] != INF) continue;

            q.push({a, b, t.w + 1});
            dist[tt][a][b] = t.w + 1;
        }
    }
}

int main(void)
{
    int T;
    cin >> T;
    while (T --)
    {
        cin >> n >> m;
        for (int i = 1; i <= n; i ++)
                cin >> (g[i] + 1);

        for (int i = 1; i <= n; i ++)
            for (int j = 1; j <= m; j ++)
            {
                if (g[i][j] == 'P')
                    bfs(i, j, 0);
                if (g[i][j] == 'E')
                    bfs(i, j, 1);
            }

        int res = INF + INF;
        for (int i = 1; i <= n; i ++)
            for (int j = 1; j <= m; j ++)
                if (g[i][j] == 'K') res = min(res, dist[0][i][j] + dist[1][i][j]);

        if (res > INF) cout << "No solution\n";
        else cout << res << endl;
    }

    return 0;
}
