%{
#include "y.tab.h"
%}

%%
"for"               { return FOR; }
"++"                { return INC; }
"<="                { return LE; }
">="                { return GE; }
"=="                { return EQ; }
"!="                { return NE; }
"<"                 { return '<'; }
">"                 { return '>'; }
"="                 { return '='; }
"+"                 { return '+'; }
"-"                 { return '-'; }
"*"                 { return '*'; }
"/"                 { return '/'; }

[0-9]+              { return NUM; }
[a-zA-Z_][a-zA-Z0-9_]*  { return ID; }

[ \t\n]+            ;

"("                 { return '('; }
")"                 { return ')'; }
";"                 { return ';'; }

.                   { return yytext[0]; }
%%

int yywrap()
{
    return 1;
}
