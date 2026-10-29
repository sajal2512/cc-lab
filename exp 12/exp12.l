%{
#include "exp12.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%
[a-zA-Z][a-zA-Z0-9]*  { yylval.str = strdup(yytext); return ID; }
[0-9]+                { yylval.str = strdup(yytext); return NUM; }
[+\-*/()]             { return yytext[0]; }
[ \t]                 ;
\n                    { return '\n'; }
.                     { return yytext[0]; }
%%

int yywrap(void)
{
    return 1;
}
