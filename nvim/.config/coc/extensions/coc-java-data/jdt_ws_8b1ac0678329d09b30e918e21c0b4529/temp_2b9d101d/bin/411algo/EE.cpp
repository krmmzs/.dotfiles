#include<bits/stdc++.h>
using namespace std;
int read()
{
    int x=0,y=1;char c=getchar();
    while(c>'9'||c<'0'){if(c=='0')y=-1;c=getchar();}
    while(c>='0'&&c<='9'){x=x*10+c-'0';c=getchar();}
    return x*y;
}
int n,m;
vector<int>v[10005];
bool cando[10005],er[10005];
queue<int>q;
int st,ed;
int ans[10005];
int main()
{
    n=read(),m=read();
    for(int i=1;i<=m;i++)
    {
        int a=read(),b=read();
        if(a==b)continue;//去除自环
        v[b].push_back(a);
    }
    st=read(),ed=read();
    cando[ed]=1;//第一遍bfs
    q.push(ed);
    while(!q.empty())
    {
        int no=q.front();
        q.pop();
        for(int i=0,j=v[no].size();i<j;i++)
            if(!cando[v[no][i]]){cando[v[no][i]]=1;q.push(v[no][i]);}//标记从终点可以到达的点
    }

    memcpy(er,cando,sizeof(cando));//准备第二次标记
        //注意这里最好有第二个数组标记，在一个数组里删点有后效型，如果一个点开始被标记，它通过一个序号比它小的点删除了，
       //那么访问到它的时候，就会被当成开始就没被标记的点，会通过它把合法点删除。
      //这样做完之后，合法点都被标记了。
    for(int i=1;i<=n;i++)
        if(!cando[i])
            for(int j=0,k=v[i].size();j<k;j++)
                if(er[v[i][j]])
                    er[v[i][j]]=0;
        //最后一遍bfs找答案。
    q.push(ed);
    while(!q.empty())
    {
        int no=q.front();
        q.pop();
        for(int i=0,j=v[no].size();i<j;i++)
            if(er[v[no][i]])
            {
                q.push(v[no][i]);
                er[v[no][i]]=0;
                ans[v[no][i]]=ans[no]+1;
            }
    }
       //题目要求输出。
    if(ans[st]==0)printf("-1");
    else printf("%d",ans[st]);
    return 0;
}
