%{
#include "exp11.tab.h"
%}

%%
"int"|"float"|"char"    { return TYPE; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }
[0-9]+                  { return NUM; }
";"                     { return ';'; }
","                     { return ','; }
"="                     { return '='; }
[ \t\n]+                ;
.                       { return yytext[0]; }
%%

int yywrap(void)
{
    return 1;
}
