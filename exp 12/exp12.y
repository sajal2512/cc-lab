%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
void yyerror(const char *s);

int temp = 1;
%}

%union {
    char *str;
}

%token <str> ID NUM
%type <str> expr

%left '+' '-'
%left '*' '/'
%right UMINUS

%%

input:
    expr '\n'  { printf("Intermediate code generated successfully.\n"); }
    ;

expr:
    ID       { $$ = $1; }
    | NUM    { $$ = $1; }
    | expr '+' expr {
        $$ = malloc(20);
        sprintf($$, "t%d", temp++);
        printf("%s = %s + %s\n", $$, $1, $3);
    }
    | expr '-' expr {
        $$ = malloc(20);
        sprintf($$, "t%d", temp++);
        printf("%s = %s - %s\n", $$, $1, $3);
    }
    | expr '*' expr {
        $$ = malloc(20);
        sprintf($$, "t%d", temp++);
        printf("%s = %s * %s\n", $$, $1, $3);
    }
    | expr '/' expr {
        $$ = malloc(20);
        sprintf($$, "t%d", temp++);
        printf("%s = %s / %s\n", $$, $1, $3);
    }
    | '(' expr ')' { $$ = $2; }
    ;

%%

void yyerror(const char *s)
{
    printf("Invalid arithmetic expression\n");
}

int main(void)
{
    printf("Enter an arithmetic expression:\n");
    yyparse();
    return 0;
}
