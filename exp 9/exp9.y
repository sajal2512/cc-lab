%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token NUMBER
%left '+' '-'
%left '*' '/'
%left UMINUS

%%

input:
      /* empty */
    | input line
    ;

line:
      '\n'
    | expression '\n'  { printf("Result = %d\n", $1); }
    | error '\n'       { printf("Invalid expression. Try again.\n"); yyerrok; }
    ;

expression:
      NUMBER                   { $$ = $1; }
    | expression '+' expression { $$ = $1 + $3; }
    | expression '-' expression { $$ = $1 - $3; }
    | expression '*' expression { $$ = $1 * $3; }
    | expression '/' expression {
          if ($3 == 0) {
              printf("Error: Division by zero\n");
              $$ = 0;
          } else {
              $$ = $1 / $3;
          }
      }
    | '-' expression %prec UMINUS { $$ = -$2; }
    | '(' expression ')'         { $$ = $2; }
    ;

%%

void yyerror(const char *s)
{
    /* Error is handled by the line rule. */
}

int main(void)
{
    printf("Desk Calculator (type expressions; Ctrl+D to exit)\n");
    yyparse();
    return 0;
}
