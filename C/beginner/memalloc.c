#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Global variable to store concatenated strings
char* concatenated_string = NULL;

int main() {
    char input[100];

    while (1) {
        printf("Enter a string (or 'q' to quit): ");

        // Read input using fgets (including newline)
        if (fgets(input, sizeof(input), stdin) == NULL) {
            fprintf(stderr, "Error reading input.\n");
            exit(1);
        }

        // Remove the newline character, if present
        input[strcspn(input, "\n")] = '\0';

        // Check for quit condition
        if (strcmp(input, "q") == 0) {
            break;
        }

        // Allocate memory for the concatenated string (same as before)
        size_t new_length = strlen(input) + (concatenated_string ? strlen(concatenated_string) : 0) + 1;
        char* temp = realloc(concatenated_string, new_length);
        if (temp == NULL) {
            fprintf(stderr, "Memory allocation error.\n");
            exit(1);
        }
        concatenated_string = temp;

        // Concatenate the new input (same as before)
        if (concatenated_string[0] == '\0') {
            strcpy(concatenated_string, input);
        } else {
            strcat(concatenated_string, input);
        }

        printf("Concatenated string: %s\n", concatenated_string);
    }

    // Free the allocated memory
    free(concatenated_string);

    return 0;
}
