    .data
num:    .quad   5           // Define a variable num with initial value 5
result: .quad   1           // Define a variable result with initial value 1
format: .asciz "Factorial: %ld\n" // Format string for printing

    .text
    .global _start          // Entry point of the program

_start:
    ldr x0, =num            // Load the address of num into register x0
    ldr x1, [x0]            // Load the value of num into register x1

calculate_factorial:
    cmp x1, #1              // Compare x1 with 1
    ble print_result        // Branch to print_result if x1 <= 1

    mul x2, x2, x1          // Multiply result (initially 1) by x1
    sub x1, x1, #1          // Decrement x1 by 1
    b calculate_factorial   // Branch back to calculate_factorial

print_result:
    // Print the result to stdout
    mov x0, x2              // Move the result to x0 (argument for printf)
    ldr x1, =format         // Load the address of the format string into x1
    mov x8, #0              // System call number for printf
    svc #0                  // Invoke system call to print the result

    // Exit the program
    mov x8, #93             // System call number for exit
    mov x0, #0              // Exit code 0
    svc #0                  // Invoke system call

