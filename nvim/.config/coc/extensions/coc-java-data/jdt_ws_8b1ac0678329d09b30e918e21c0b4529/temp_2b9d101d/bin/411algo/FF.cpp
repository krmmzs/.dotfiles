#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <iostream>
#include <algorithm>
#include <cmath>
#include <queue>
using namespace std;
#define  pi acos(-1.0)
typedef long long ll;
const int N =500+100;
int n,m,T;
char s[N][N];
int ex,ey;
int dir[4][2]={{0,1},{0,-1},{1,0},{-1,0}};
bool check(int x,int y){
    if(x>=0&&x<n&&y>=0&&y<m&&s[x][y]!='#')//A,B都是可以再次走的，说明找到钥匙后还可以在走回去
    return true;
    return false;
}
struct Node{
    int x,y,step,key;
    Node(){}
    Node (int x,int y,int step,int key):x(x),y(y),step(step),key(key){}
}ss;
int bfs(Node nod){
    queue<Node>Q;
    Q.push(nod);
    while(!Q.empty()){
        Node tmp = Q.front();
        Q.pop();
        if(tmp.x==ex&&tmp.y==ey&&tmp.key==1){
            return tmp.step;
        }
        for(int i=0;i<4;i++){
            int x=tmp.x+dir[i][0];
            int y=tmp.y+dir[i][1];
            if(check(x,y)){
                if(tmp.key==0){//找到钥匙前变为A
                 //没有A，避免重复。
                    if(s[x][y]=='E') continue;//好没有钥匙，continue
                    if(s[x][y]=='.') {
                        s[x][y]='A';
                        Q.push(Node(x,y,tmp.step+1,0));
                    }
                    if(s[x][y]=='K'){
                        s[x][y]='B';//找到钥匙了，变为B
                            Q.push(Node(x,y,tmp.step+1,1));
                    }
                }
                else{
                    if(s[x][y]!='B'){//找到钥匙后变为B
                        s[x][y]='B';
                        Q.push(Node(x,y,tmp.step+1,1));
                    }
                }
            }
        }
    }
    return -1;
}
int main()
{
    scanf("%d",&T);
    while(T--)
    {
        scanf("%d%d",&n,&m);
        for(int i=0;i<n;i++)
        {
            for(int j=0;j<m;j++){
                cin>>s[i][j];
                if(s[i][j]=='P'){
                    ss.x=i,ss.y=j,ss.step=0;
                }
                if(s[i][j]=='E'){
                    ex=i,ey=j;
                }
            }
        }
        int ans=bfs(ss);
        if(ans==-1){
            printf("No solution\n");
        }
        else{
            printf("%d\n",ans);
        }
    }
    return 0;
}
