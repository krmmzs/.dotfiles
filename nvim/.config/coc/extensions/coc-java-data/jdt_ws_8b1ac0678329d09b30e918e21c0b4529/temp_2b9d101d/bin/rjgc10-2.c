#include <stdio.h>

int test(int x, int y, int i)
{
    int z;

    if (x > y)
    {
        z = x - y;
    }
    else
    {
        z = y - x;
    }

    while (i < 5)
    {
        z = z + i;
        i = i + 1;
    }

    if (z < 20)
    {
        z = z + 5;
    }

    return z;
}

int main(void)
{
    // 语句覆盖
    if (test(2, 1, 4) == 10)
    {
        printf("pass\n");
    }
    else
    {
        printf("Case 1 Error!\n");
    }

    if (test(1, 2, 6) == 6)
    {
        printf("pass\n");
    }
    else
    {
        printf("Case 2 Error!\n");
    }

    // 判定覆盖
    if (test(2, 1, 4) == 10)
    {
        printf("pass\n");
    }
    else
    {
        printf("Case 1 Error!\n");
    }

    if (test(1, 2, 6) == 6)
    {
        printf("pass\n");
    }
    else
    {
        printf("Case 2 Error!\n");
    }

    if(16 == test(2, 1, 1)) printf("pass\n"); else printf("Case 1 Error!\n");
    if(109 == test(100, 1, 1))printf("pass\n"); else printf("Case 2 Error!\n");
    if(6 == test(2, 1, 6))printf("pass\n"); else printf("Case 3 Error!\n");
    if(99 == test(100, 1, 6))printf("pass\n"); else printf("Case 4 Error!\n");
    if(16 == test(1, 2, 1))printf("pass\n"); else printf("Case 5 Error!\n");
    if(109 == test(1, 100, 1))printf("pass\n"); else printf("Case 6 Error!\n");
    if(6 == test(1, 2, 6))printf("pass\n"); else printf("Case 7 Error!\n");
    if(99 == test(1, 100, 6))printf("pass\n"); else printf("Case 8 Error!\n");

}
