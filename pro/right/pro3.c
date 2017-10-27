/* 题目：输入某年某月某日，判断这一天是这一年的第几天？
 * Build: gcc pro3.c
 */
#include<stdio.h>

int main() {
    int year, month, day,sumday=0;
    int monthday[12] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };

    printf("请输入年、月、日，格式为：年,月,日（2015,12,10）\n");
    scanf("%d,%d,%d",&year,&month,&day);
    if (year % 400 == 0 || (year % 100 != 0 && year % 4 == 0)) {
        monthday[1] =29;
    }
    for (int i = 0; i < month-1; i++) {
        sumday += monthday[i];
    }
    sumday += day;

    printf("%d\n",sumday);
    return 0;
}
