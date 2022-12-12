%{
#include  "y.tab.h"
int line=1;
%}

%%

"\n" {printf("");line++;}
"\t"|" " {printf("");}
"++"|"--"    {return UNI;}
"int"|"float"|"double"|"char"   {return DT;}

"=="|"!="|"<"|">"|"<="|">=" {return REOP;}
=|"+="|"-="|"&="|"|=" {return ASMTOP;}
[/+*-] {return AROP;}
"&&"|"||"|"!" {return  LGOP;}
[();{}:=]  {return yytext[0];}
[0-9]+	{return CONST;}
["].*["]    {return CONST;}
"for"   {return FOR;}
"if"    {return IF;}
"else"    {return ELSE;}
([_a-zA-Z](0-9)*)+	{return ID;}
"/*"([^*]|"*"+[^/])*"*/" {}
("//".*) {}
%%

// int main(){
//    yyparse();
//    return 0;
// }