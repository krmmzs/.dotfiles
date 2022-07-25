#include<stdio.h>
#include<cmath>
typedef long long LL;


int s[9];
int n;
char a[4];

LL doit(int x)
{
	if(x == 1) return (LL)2*pow(3, n - 1) - 1;
	if(x) return (LL)pow(2, n)-1;
	return (LL)pow(3, n - 1);
}

int main(void)
{
	scanf("%d",&n);

    for (int i = 6; i >= 1; i --)
	    scanf("%s",a),s[(a[0] - 'A') * 3 + a[1] - 'A'] = i;

    int p  = 0;

	if(s[1] > s[2])
    {
		if(s[5] < s[3]) p = 1;
		else if(s[6] > s[7]) p = 2;
	}
    else if(s[7] < s[6]) p = 1;
	else if(s[3] > s[5]) p = 2;

	printf("%lld", doit(p));

	return 0;
}
