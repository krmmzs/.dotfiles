// 图里的思维题
//
// 建立反向边应该能很好地解决这种终点必达到的问题（因为终点没有出边）
// 反向后，终点就只有出边了，然后终点开始bfs可得到连通的路径上的所有点
//
// 之后枚举所有点，如果没被标记就试探步一下, 如果它指向的点被标记，则说明这个被标记的点不合法，删除该点
//
// 最后在合法的点图上bfs求单源shortest path
//#include<bits/stdc++.h>
#include <cstdio>
#include <iostream>
#include <cstring>
#include <algorithm>
#include <vector>
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

const int N = 10010;

int n, m;
vector<int> v[N]; // vector to save graph
bool r[N];
bool e[N];
queue<int> q;
int st, ed;
int res[N];

int main(void)
{
    cin >> n >> m;
    for (int i = 1; i <= m; i ++)
    {
        int a, b;
        cin >> a >> b;
        if (a == b) continue;
        v[b].push_back(a);
    }
    cin >> st >> ed;

    r[ed] = 1;
    q.push(ed);
    while(q.size())
    {
        int t = q.front();
        q.pop();

        for (int i = 0, j = v[t].size(); i < j; i ++)
            if (!r[v[t][i]])
            {
                r[v[t][i]] = 1;
                q.push(v[t][i]);
            }
    }

    memcpy(e, r, sizeof r);

    for (int i = 1; i <= n; i ++)
        if (!r[i])
            for (int j = 0, k = v[i].size(); j < k; j ++)
                if (e[v[i][j]])
                    e[v[i][j]] = 0;

    q.push(ed);
    while (q.size())
    {
        int t = q.front();
        q.pop();
        for (int i = 0, j = v[t].size(); i < j; i ++)
            if (e[v[t][i]])
            {
                q.push(v[t][i]);
                e[v[t][i]] = 0;
                res[v[t][i]] = res[t] + 1;
            }
    }

    if (res[st] == 0) printf("-1\n");
    else printf("%d", res[st]);

    return 0;
}
