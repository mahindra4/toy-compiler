%{

#include <stdio.h>
#include <string.h>

#include "cucu.tab.h"
FILE *lexi;

%}

%%


"int"                   {fprintf (lexi,"data type : int\n"); return INT;}
"char *"                {fprintf (lexi,"data type : char*\n"); return CHAR;}
"while"                 {fprintf (lexi,"while_stmt : while\n"); return WHILE;}


"if"                    {fprintf (lexi,"if_stmt : if\n"); return IF;}
"else"                  {fprintf (lexi,"Else : else\n"); return ELSE;}

"return"                {fprintf (lexi, "return_stmt : return\n"); return RETURN;}


[a-zA-Z_][a-zA-Z0-9_]*  {fprintf (lexi,"identifier : %s\n", yytext); yylval.str=strdup(yytext); return ID;}

(\"[a-zA-Z0-9]*\")      {fprintf (lexi, "type : string"); yylval.str=strdup(yytext); return STRING;}
[0-9]+                  {fprintf (lexi,"num : %d\n", yylval.num=atoi(yytext)); return NUM;}


\{                    {fprintf (lexi,"left flower bracket : {\n"); return LEFT_FLOWER;}
\}                    {fprintf (lexi,"right flower bracket : }\n"); return RIGHT_FLOWER;}
\(                    {fprintf (lexi,"left round bracket : (\n"); return LEFT_B;}
\)                    {fprintf (lexi,"right round bracket: )\n"); return RIGHT_B;}
\[                    {fprintf (lexi,"left square bracket : [\n"); return LEFT_SQB;}
\]                    {fprintf (lexi,"right square bracket : ]\n"); return RIGHT_SQB;}


"="                    {fprintf (lexi,"assign : =\n"); return ASSIGN;}


"+"                     {fprintf (lexi,"plus : +\n"); return PLUS;}
"-"                     {fprintf (lexi,"minus : +\n"); return MINUS;}
"/"                     {fprintf (lexi,"div : /\n"); return DIV;}
"*"                     {fprintf (lexi,"mul : *\n"); return MUL;}

","                     {fprintf (lexi,"comma : ,\n"); return COMMA;}
";"                     {fprintf (lexi,"semi colon : ;\n"); return SEMI_COLON;}

">"                     {fprintf (lexi,"greater than : >\n"); return GREATER_THAN;}
"<"                    {fprintf (lexi,"less than : <\n"); return LESS_THAN;}
"=="                    {fprintf (lexi,"logical equal : ==\n"); return LOGICAL_EQUAL;}
"<="                    {fprintf (lexi,"less than or equal : <=\n"); return LESS_THAN_EQUAL;}
">="                    {fprintf (lexi,"greater than or equal : >=\n"); return GREATER_THAN_EQUAL;}
"!="                    {fprintf (lexi,"logical not equals: !=\n"); return LOGICAL_NOT_EQUAL;}

\/\*(.|\n)*\*\/         {;}
[ \t\n]+                {;}

%%

int yywrap(void){
    return 1;
}
