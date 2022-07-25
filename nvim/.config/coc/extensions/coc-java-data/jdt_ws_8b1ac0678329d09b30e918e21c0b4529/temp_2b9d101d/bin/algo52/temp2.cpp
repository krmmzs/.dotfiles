
#include<bits/stdc++.h>
using namespace std;
typedef long long LL;
const LL N=1e5+7;
const LL mod=1e9+7;
LL cnt,n;
struct node
{

    LL date[6];
    node()
    {

        memset(date,0,sizeof date);
    }
    //a->b 0
    //a->c 1
    //b->a 2
    //b->c 3
    //c->a 4
    //c->b 5
};
node dp[3][3][3][105];
bool vis[3][3][3][105];
node operator+(const node &a,const node &b)
{

    node c;
    for(LL i=0;i<=5;++i)
    {

        c.date[i]=a.date[i]+b.date[i];
    }
    return c;
}
void moveto(LL x,LL y,node &temp)
{

    if(x==0&&y==1)++temp.date[0];
    if(x==0&&y==2)++temp.date[1];
    if(x==1&&y==0)++temp.date[2];
    if(x==1&&y==2)++temp.date[3];
    if(x==2&&y==0)++temp.date[4];
    if(x==2&&y==1)++temp.date[5];
    return;
}

node hanoi(LL a,LL b,LL c,LL n)//把a经过b移动到c柱上（第n个）
{

    if(vis[a][b][c][n])return dp[a][b][c][n];
    if(n==1)
    {

        moveto(a,c,dp[a][b][c][n]);
        vis[a][b][c][n]=true;//标记一下
        return dp[a][b][c][n];
    }
    node temp;//普通的hanoi塔
    temp=temp+hanoi(a,c,b,n-1);//先把n-1个从a经过c移动到b
    moveto(a,c,temp);//把第n个直接从a移动到c
    temp=temp+hanoi(b,a,c,n-1);//再把刚刚那n-1个从b经过a移动到c
    vis[a][b][c][n]=true;//完成！
    return dp[a][b][c][n]=temp;
}
int main()
{

    cin>>n;
    node res = hanoi(0,1,2,n);
    printf("A->B:%lld\n",res.date[0]);
    printf("A->C:%lld\n",res.date[1]);
    printf("B->A:%lld\n",res.date[2]);
    printf("B->C:%lld\n",res.date[3]);
    printf("C->A:%lld\n",res.date[4]);
    printf("C->B:%lld\n",res.date[5]);
    printf("SUM:%lld\n",(LL(1)<<n)-1);//公式ans=2^n-1
}
