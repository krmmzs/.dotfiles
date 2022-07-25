#include <gtest\gtest.h>
#include <gtest\stub.h>

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
    EXPECT_EQ(GetMaxValue(1, 2, 3), 3);
    EXPECT_EQ(GetMaxValue(3, 1, 2), 3);
    EXPECT_EQ(GetMaxValue(1, 3, 2), 3);

    return 0;
}
