%{
#include"y.tab.h"
%}
 
%%
 
 
[0-9]+?{yylval.sym=(char)yytext[0];return NUMBER;}
[a-zA-Z]+?{yylval.sym=(char)yytext[0];return LETTER;}
 
\n {return0;}
.{returnyytext[0];}
 
%%
yywrap()
{
return1;
}
