// 看起来是个dfs，然后模块的话需要解决移动和消除
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

#define x first
#define y second

typedef long long LL;
typedef pair<int, int> PII;
typedef pair<double, double> PDD;
typedef unsigned long long ULL;

const int prime[26] = {2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97,101};
const int INF = 0x3f3f3f3f;

const int N = 10;

int n;
int g[N][N];
int res[N][5];
int last[N][N][N];//：第d步时在i行j列的原状态
bool xiao[N][N];


bool check()
{
    for (int i = 1; i <= 5; i ++)
        if (g[i][1])
            return false;
    return true;
}

void backup(int x)
{
    for (int i = 1; i <= 5; i ++)
        for (int j = 1; j <= 7; j ++)
            last[x][i][j] = g[i][j];
}

void update()
{
    for (int i = 1;i <= 5; i ++)
    {
        int cnt = 0;
        for (int j = 1;j <= 7; j ++)
        {
            if (!g[i][j]) cnt ++;
            else
            {
                if (!cnt) continue;
                g[i][j - cnt] = g[i][j];
                g[i][j] = 0;
            }
        }
    }
}

bool remove()
{
    bool flag = false;
    for (int i = 1; i <= 5; i ++)
        for (int j = 1; j <= 7; j ++)
        {
            if (i - 1 >= 1 && i + 1 <= 5 && g[i - 1][j] == g[i][j] && g[i][j] == g[i + 1][j] && g[i][j])
            {
                xiao[i - 1][j] = true;
                xiao[i + 1][j] = true;
                xiao[i][j] = true;
                flag = true;
            }
            if (j - 1 >= 1 && j + 1 <= 7 && g[i][j] == g[i][j + 1] && g[i][j] == g[i][j - 1] && g[i][j])
            {
                xiao[i][j + 1] = true;
                xiao[i][j - 1] = true;
                xiao[i][j] = true;
                flag = true;
            }
        }
    if (!flag) return false;

    for (int i = 1; i <= 5;i ++)
        for (int j = 1; j <= 7; j ++)
            if (xiao[i][j])
            {
                xiao[i][j] = 0;
                g[i][j] = 0;
            }

    return true;
}

void move(int i, int j, int x)
{
    swap(g[i][j], g[i + x][j]);
    update(); // maybe not
    while (remove())
        update();
}

void dfs(int x)
{
    if (check())
    {
        for (int i = 1; i <= n; i ++)
        {
            for (int j = 1; j <= 3; j ++)
                printf("%d ", res[i][j]);
            printf("\n");
        }
        exit(0);
    }
    if (x > n) return;
    backup(x);

    for (int i = 1; i <= 5; i ++)
        for (int j = 1;j  <= 7; j ++)
        {
            if (g[i][j])
            {
                if (i + 1 <= 5 && g[i][j] != g[i + 1][j])
                {
                    move(i, j, 1);
                    res[x][1] = i - 1;
                    res[x][2] = j - 1;
                    res[x][3] = 1;
                    dfs(x + 1);

                    // backtraking
                    for (int i = 1; i <= 5; i ++)
                        for (int j = 1; j <= 7; j ++)
                            g[i][j] = last[x][i][j];

                    res[x][1] = -1;
                    res[x][2] = -1;
                    res[x][3] = -1;
                }
                if (i - 1 >= 1 && g[i - 1][j] == 0)
                {
                    move(i, j, -1);
                    res[x][1] = i - 1;
                    res[x][2] = j - 1;
                    res[x][3] = -1;
                    dfs(x + 1);

                    // backtraking
                    for (int i = 1; i <= 5; i ++)
                        for (int j = 1; j <= 7; j ++)
                            g[i][j] = last[x][i][j];

                    res[x][1] = -1;
                    res[x][2] = -1;
                    res[x][3] = -1;
                }
            }
        }
}

int main(void)
{
    scanf("%d", &n);
    for (int i = 1; i <= 5; i ++)
        for (int j = 1; j <= 8; j ++)
        {
            int x;
            scanf("%d", &x);
            if (!x) break;
            g[i][j] = x;
        }

    memset(res, -1,sizeof res);

    dfs(1);

    printf("-1\n");

    return 0;
}
