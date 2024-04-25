// main.c

#include <stdio.h>
#include "arithmetic.h"
#include "input.h"
#include "output.h"

int main() {
    int num1, num2;
    char operation;
    int result;

    // Get input from user
    num1 = getIntegerInput();
    printf("Enter an operation (+, -, *, /): ");
    scanf(" %c", &operation);
    num2 = getIntegerInput();

    // Perform arithmetic operation
    switch(operation) {
        case '+':
            result = add(num1, num2);
            break;
        case '-':
            result = subtract(num1, num2);
            break;
        case '*':
            result = multiply(num1, num2);
            break;
        case '/':
            result = divide(num1, num2);
            break;
        default:
            printf("Error: Invalid operation\n");
            return 1;
    }

    // Display result
    displayResult(result);

    return 0;
}

