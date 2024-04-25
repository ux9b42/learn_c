#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>

void p_instruction(void);
void ril_main_no_fek(void);
void hist_write(FILE*);
char* hist_read(FILE*);

#define OPLEN 6

float result = 0;
const char operators[OPLEN] = {
  '*', '/', '+', '-', 'c', 'q',
};


int main(void)
{

  while (1) ril_main_no_fek();

  return 0;
}


void ril_main_no_fek()
{
    p_instruction();

    printf("result: %f\n", result);

    float x, y;
    char op;

    printf("op: ");
    scanf("%c", &op);

    for (uint i = 0; i < OPLEN; i++) {
      if (op == operators[i]) break;
      else return;
    }

    printf("n1: ");
    scanf("%f", &x);
    getchar();

    printf("n2: ");
    scanf("%f", &y);
    getchar();

    switch (op) {
      case '*':
        result = x * y;
        break;
      case '/':
        result = x / y;
        break;
      case '+':
        result = x + y;
        break;
      case '-':
        result = x - y;
        break;
      case 'C':
      case 'c':
        result = 0;
        system("clear");
        return;
      case 'Q':
      case 'q':
        exit(0);
    }

    system("clear");
}


void p_instruction()
{
  printf("op (operators):\n");
  printf("* = multiply\n");
  printf("/ = divide\n");
  printf("+ = add\n");
  printf("- = substract\n");
  printf("C = clear result\n");
  printf("Q = quit program\n");
}
