#include <stdio.h>


int GetMaxValue(int a, int b, int c)   // 获取三个数中的最大值
{
    int temp = a;
    if (b > temp)
    {
        temp = b;
    }

    if (c > b)
    {
        temp = c;
    }

    return temp;
}

int main(void)
{
    // 条件覆盖
    if (GetMaxValue(1, 2, 3) == 3)
    {
        printf("pass\n");
    }
    else
    {
        printf("tiaojian Ease 1 error !\n");
    }

    if (GetMaxValue(3, 2, 1) == 3)
    {
        printf("pass\n");
    }
    else
    {
        printf("tioajian Ease 2 error !\n");
    }

    // 路径覆盖
    if (GetMaxValue(1, 2, 3) == 3)
    {
        printf("pass\n");
    }
    else
    {
        printf("lujing Ease 1 error !\n");
    }

    if (GetMaxValue(1, 3, 2) == 3)
    {
        printf("pass\n");
    }
    else
    {
        printf("lujing Ease 2 error !\n");
    }

    if (GetMaxValue(3, 1, 2) == 3)
    {
        printf("pass\n");
    }
    else
    {
        printf("lujing Ease 3 error !\n");
    }

    if (GetMaxValue(3, 2, 1) == 3)
    {
        printf("pass\n");
    }
    else
    {
        printf("lujing Ease 4 error !\n");
    }

    return 0;
}
