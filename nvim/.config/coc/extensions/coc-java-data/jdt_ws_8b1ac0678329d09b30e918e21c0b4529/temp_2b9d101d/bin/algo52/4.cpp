//#include<bits/stdc++.h>
#include <cstdio>
#include <iostream>
#include <cstring>
#include <algorithm>
//#include <vector>
//#include <queue>
//#include <cmath>
#include <unordered_map>
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

const int N = 40;

int n;
int postorder[N], inorder[N];
unordered_map<int, int> l, r, pos;

int build(int il, int ir, int pl, int pr)
{
    int root = postorder[pr];
    int k = pos[root];
    if(il < k) l[root] = build(il, k - 1, pl, pl + (k - 1 - il));
    if(k < ir) r[root] = build(k + 1, ir, pl + (k - 1 - il) + 1, pr - 1);
    return root;
}

void dfs(int u)
{
    if (u == 0) return;
    char t = 'A' + u - 1;
    cout << t;
    dfs(l[u]);
    dfs(r[u]);
}

int main(void)
{
    //ios::sync_with_stdio(false);
    //cin.tie(nullptr);
    string s1, s2;

    getline(cin, s1);
    getline(cin, s2);

    int n = s1.size();
    for (int i = 0; i < n; i ++)
    {
        char t = s1[i];
        inorder[i] = t - 'A' + 1;
        pos[inorder[i]] = i;
    }

    for (int i = 0; i < n; i ++)
    {
        char t = s2[i];
        postorder[i] = t - 'A' + 1;
    }

    int root = build(0, n - 1, 0, n - 1);

    dfs(root);

    return 0;
}
