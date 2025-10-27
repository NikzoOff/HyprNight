#include<stdio.h>
int main() {
/* define a local variable a */
int a = 3;

/* define a pointer variable, and point it to a using the & operator */
int * pointer_to_a = &a;

printf("The value a is %d\n", a);
printf("The value of a is also %d\n", *pointer_to_a);
    return 0;
}