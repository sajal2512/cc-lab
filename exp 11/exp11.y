%{
#include <stdio.h>
int yylex(void);
void yyerror(const char *s);
%}

%token TYPE ID NUM

%%

input:
    TYPE variable_list ';' { printf("Valid variable declaration\n"); }
    ;

variable_list:
    ID
    | variable_list ',' ID
    | ID '=' NUM
    | variable_list ',' ID '=' NUM
    ;

%%

void yyerror(const char *s)
{
    printf("Invalid variable declaration\n");
}

int main(void)
{
    printf("Enter a variable declaration:\n");
    yyparse();
    return 0;
}
