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

int cnt;

void dfs(int x)
{
    if (x == 10)
    {
        cnt ++;
        return;
    }

    if (x > 10)
        return;

    dfs(x + 1);
    dfs(x + 2);
}

int main(void)
{
    dfs(0);

    cout << cnt << endl;

    return 0;
}
