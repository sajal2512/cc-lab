%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token FOR ID NUM INC
%token LE GE EQ NE

%%

stmt:
    FOR '(' init ';' condition ';' update ')'
    {
        printf("Valid for loop statement\n");
    }
    ;

init:
    ID '=' expr
    ;

condition:
    expr '<' expr
    | expr '>' expr
    | expr LE expr
    | expr GE expr
    | expr EQ expr
    | expr NE expr
    ;

update:
    ID INC
    | ID '=' expr
    ;

expr:
    ID
    | NUM
    | expr '+' expr
    | expr '-' expr
    | expr '*' expr
    | expr '/' expr
    ;

%%

void yyerror(const char *s)
{
    printf("Invalid for loop statement\n");
}

int main()
{
    printf("Enter a for loop statement:\n");
    yyparse();
    return 0;
}
