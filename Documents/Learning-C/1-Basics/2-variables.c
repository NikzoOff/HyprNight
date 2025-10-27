#include <stdio.h>

int main() {
    int bar = 1;

    printf("%d", bar);
    return 0;
}


// %d is a format to give to printf() examples:

// %d	int (entier)	            printf("%d", 42);	        42
// %f	float / double (réel)	    printf("%f", 3.14);	        3.140000
// %c	char (caractère)	        printf("%c", 'A');	        A
// %s	chaîne de caractères	    printf("%s", "Hello");	    Hello
// %x	int en hexadécimal	        printf("%x", 255);	        ff
// %p	adresse mémoire (pointeur)	printf("%p", ptr);	        0x7ffd3...
// %ld, %lld	long / long long	printf("%ld", 123456789L);	123456789