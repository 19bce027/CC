%{ 
int n = 0 ;  
%} 
  
%% 
  
"while"|"if"|"else"|"for"|"return" {n++;printf("\t keywords : %s", yytext);}  
  
"int"|"float"|"double"|"String"|"char" {n++;printf("\t data_type : %s", yytext);}   
  
[a-zA-Z_][a-zA-Z0-9_]* {n++;printf("\t identifier : %s", yytext);} 
  
"<="|"=="|"="|"++"|"-"|"*"|"+"|"/" {n++;printf("\t operator : %s", yytext);}
  
[(){}|, ;]    {n++;printf("\t separator : %s", yytext);} 
  
[0-9]*"."[0-9]+ {n++;printf("\t float : %s", yytext);}  
  
[0-9]+ {n++;printf("\t integer : %s", yytext);}                        
  
.    ;
%% 
   
   

