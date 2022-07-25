#include<iostream>
#include<queue>
using namespace std;
const int N = 550;
const int INF = 0x3f3f3f3f;
struct Node{
    int x,y,w;
};
char s[N][N];
int dis[2][N][N];
int dx[] = {-1,1,0,0};
int dy[] = {0,0,-1,1};
int t,n,m;
queue<Node> que;
void bfs(int k,int x,int y)
{
    for(int i = 1;i <= n;i ++)
    {
        for(int j = 1;j <= m;j ++) dis[k][i][j] = INF;
    }
    que.push({x,y,0});
    while(!que.empty())
    {
        Node t = que.front();
        que.pop();
        for(int i = 0;i < 4;i ++)
        {
            int x = t.x+dx[i],y = t.y+dy[i];
            if(x<1||y<1||x>n||y>m||s[x][y]=='#'||s[x][y]=='E'||dis[k][x][y]!=INF) continue;
            que.push({x,y,t.w+1});
            dis[k][x][y] = t.w+1;
        }
    }

}
int main()
{
    cin >> t;
    while(t--)
    {
        cin >> n >> m;
        for(int i = 1;i <= n;i ++) cin >> s[i]+1;
        for(int i = 1;i <= n;i ++)
        {
            for(int j = 1;j <= m;j ++)
            {
                if(s[i][j]=='P') bfs(0,i,j);
                if(s[i][j]=='E') bfs(1,i,j);
            }
        }
        int ans = INF+INF;
        for(int i = 1;i <= n;i ++)
        {
            for(int j = 1;j <= m;j ++)
            {
                if(s[i][j]=='K') ans = min(ans,dis[0][i][j]+dis[1][i][j]);
            }
        }
        if(ans>=INF) cout << "No solution\n";
        else cout << ans << endl;
    }
}
