左边的情况显然红色先染，绿色后染，覆盖前面的红色，是可行的

右边的情况显然是不可行的

可以想象出一个栈,当前点的的起始位置加入栈，如果这一段有颜色不同于这个点的，就不可能，如上图右边，碰到当前点的终止位置，就出栈，最大染色次数就是栈最大的size,可以画个图试一下，当size 变化为 1 2 3 2 1 1 2 3 2 1 时，两边明显是可同时进行的，所以答案应该只要记录最大值

0是不填颜色，所以它的出栈位置记录为n+1，先让0入栈，并让其最后出栈，但是这并不会记录进染色次数，所以答案要-1

```c++
#include <cstdio>
#include <iostream>
#include <cstring>
#include <algorithm>
using namespace std;
const int maxn=1e5+5;
int n,a[maxn],book[maxn],ans,top;
int s[maxn],e[maxn],stack[maxn];
int main(){
    scanf("%d",&n);
    for(int i=1;i<=n;++i){
        scanf("%d",&a[i]);
        if(!s[a[i]]) s[a[i]]=i;
        e[a[i]]=i;
    }
    e[0]=n+1;a[n+1]=0;//不填的位置结束在n+1 
    for(int i=0,x;i<=n+1;++i){//i从0开始使0入栈
        x=a[i];
        if(i==s[x])stack[++top]=x,ans=max(ans,top);
        if(x!=stack[top]){printf("-1");return 0;}
        if(i==e[x])top--;
    }
    printf("%d",ans-1);
    return 0;
}
```
