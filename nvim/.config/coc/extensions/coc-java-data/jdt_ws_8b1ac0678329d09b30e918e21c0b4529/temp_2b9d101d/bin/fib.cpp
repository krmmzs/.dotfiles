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

const int N = 1000;

int f[N];

int fib(int n)
{
    if (!f[n])
        return f[n];

    if (n <= 2)
        return n;

    return f[n] = fib(n - 1) + fib(n - 2);
}

int main(void)
{

}
