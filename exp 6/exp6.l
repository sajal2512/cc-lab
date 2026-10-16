%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+ {
    int n = atoi(yytext);
    printf("Hexadecimal number: %X\n", n);
}
[ \t\n]+    ;
.           { printf("Invalid input\n"); }
%%

int main()
{
    printf("Enter a decimal number:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
