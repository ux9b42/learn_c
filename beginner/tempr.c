#include <stdio.h>
#include <stdlib.h> // for atof() func

float celsius2fahrenheit(float);
float fahrenheit2celsius(float);

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s <temperature> <unit>\n", argv[0]);
        printf("Example: %s 25 C\n", argv[0]);
        return 1;
    }

    // convert string to float
    float temperature = atof(argv[1]);
    char unit = argv[2][0];

    switch (unit) {
        case 'C':
            printf("%.2f⁰F\n", celsius2fahrenheit(temperature));
            break;
        case 'F':
            printf("%.2f⁰C\n", fahrenheit2celsius(temperature));
            break;
        default:
            printf("Invalid unit. Please enter C or F.\n");
            return 1;
    }

    return 0;
}

float celsius2fahrenheit(float celsius) {
    return (celsius * 9 / 5) + 32;
}

float fahrenheit2celsius(float fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
}
