%{
#include <stdio.h>
%}

%%
[a-z]    { printf("%c", yytext[0] - 32); }
[A-Z]    { printf("%c", yytext[0] + 32); }
.        { printf("%s", yytext); }
%%

int main()
{
    printf("Enter a string:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
