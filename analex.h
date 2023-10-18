#include <stdio.h>
#include <ctype.h>
#define NUM 256

int line=1;
int tokenval;
int analex()
{
    int ch;
    tokenval = -1;
    ch = getchar();

    while(isspace(ch))
        ch = getchar();

    if(ch == '+' || ch == '-' || ch == '*' || ch == '/' || ch == '(' || ch == ')' || ch == ';')
        return ch;


    if(isdigit(ch))
    {
        tokenval = ch - '0';
        ch = getchar();
        while(isdigit(ch))
        {
            tokenval = tokenval*10 + ch-'0';
            ch = getchar();
        }
        ungetc(ch, stdin);
        return NUM;
    }
    printf("erro lexico na linha %d\n\n", line);
}
