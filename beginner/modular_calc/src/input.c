// input.c

#include <stdio.h>
#include "input.h"

int getIntegerInput() {
    int num;
    printf("Enter an integer: ");
    scanf("%d", &num);
    return num;
}

