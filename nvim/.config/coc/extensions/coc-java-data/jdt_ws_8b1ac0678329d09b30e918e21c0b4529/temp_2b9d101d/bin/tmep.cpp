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

const int N = 30;

int f[N][N];
int w[N], v[N];
int n, m;
pair<double, int> p[N];

bool cmp(PII a, PII b)
{
    return a.x > b.x;
}

int main(void)
{
    cin >> n >> m;
    for (int i = 0; i < n; i ++)
    {
        cin >> w[i] >> v[i];
        p[i] = {w[i] * 1.0 / v[i], i};
    }

    sort(p, p + n, cmp);

    double res = 0.0;

    for (int i = 0; i < n; i ++)
    {
        if (m >= v[p[i].y])
        {
            m -= v[p[i].y];
            res += w[p[i].y];
        }
        else
        {
            res += m * p[i].x;
            break;
        }
    }

    printf("%.2lf", res);

    return 0;
}
