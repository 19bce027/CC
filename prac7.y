%{
#include<stdio.h>
int yylex();
void yyerror(char *msg);
void yywrap();
int count_for=0,count_if=0;
extern int line;
%}

%token FOR IF ELSE REOP DT UNI ID CONST LGOP ASMTOP AROP

%%
        PROG :  DT ID '('')' BLOCK;
        BLOCK : '{' STS '}';
        STS :   STS ST |  ;
        ST :    FOR_STMT
                | BLOCK
                | IF_STMT
                | DT DEST';'
                | DEST';'
                ;
        
        VAL  : ID | CONST;
        
        DEST :  ID ASMTOP DEST | VAL;
        
        INCR :  ID UNI | UNI ID;
        
        INIT : EXPR | DT DEST | DEST;
        
        EXPR :  EXPR LGOP EXPR
                | EXPR REOP EXPR
                | EXPR AROP VAL
                | INCR
                | DEST
                | '(' EXPR ')'
                | 
                ;

        FOR_STMT : FOR '(' INIT ';' EXPR ';' EXPR ')' ST {printf("For loop accepted \n");};

        IF_STMT : IF '(' EXPR ')' ST {printf("if statement accepted \n");}
                  | IF '(' EXPR ')' ST ELSE ST {printf("if else statement accepted \n");}
                  ;

%%

int main()
{
    yyparse();
    return 0;
}
void yyerror(char *msg)
{
    printf("\nError Message :- %s! Line number %d violates grammar rules.", msg, line);
}
void yywrap()
{
    
}