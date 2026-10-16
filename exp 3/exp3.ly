%{
#include <stdio.h>
int count = 0;
%}

%%
[Aa][a-zA-Z]*    { count++; }
[ \t\n]+         ;
.                ;
%%

int main()
{
    printf("Enter a string:\n");
    yylex();
    printf("Number of words starting with A: %d\n", count);
    return 0;
}
