#include <stdio.h>

int main() {
    int numbers[10];  // Defines an array of 10 integers which goes from 0-9.

    numbers[0] = 10;
    numbers[1] = 20;
    numbers[2] = 30;
    numbers[3] = 40;
    numbers[4] = 50;
    numbers[5] = 60;
    numbers[6] = 70;

    printf("The 7th number in the array is %d\n", numbers[6]);
    printf("The array contains the numbers %d, %d, %d, %d, %d, %d, %d", // You have to put a %[var] for every single variables you want to output
            numbers[0], numbers[1], numbers[2], numbers[3],
            numbers[4], numbers[5], numbers[6]);

    return 0;
}