/* 题目：一个整数，它加上100后是一个完全平方数，再加上168又是一个完全平方数，请问该数是多少？
 * Build: gcc pro3.c
 */
#include <stdio.h>

int main (void) {
	int  i, j, m, n, x;
	for (i = 2; i <= 168 / 2; i=i+2) {
		if (168 % i == 0) {
			j = 168 / i;
			if ( i > j && (i + j) % 2 == 0) {
				m = (i + j) / 2;
				n = (i - j) / 2;
				x = n * n - 100;
				printf ("%d + 100 = %d * %d\n", x, n, n);
				printf ("%d + 268 = %d * %d\n", x, m, m);
			}
		}
	}
	return 0;
}
