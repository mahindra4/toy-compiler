%{

#include <stdio.h>
#include <string.h>

void yyerror(char const *);
extern FILE *lexi,*yyin,*yyout;
int yylex();

%}

/* toke function_definition */

%token INT CHAR WHILE IF ELSE MINUS RIGHT_SQB GREATER_THAN
    LEFT_SQB RETURN COMMA ASSIGN PLUS LESS_THAN LOGICAL_EQUAL 
    DIV MUL SEMI_COLON LEFT_FLOWER RIGHT_FLOWER LEFT_B RIGHT_B 
    LESS_THAN_EQUAL GREATER_THAN_EQUAL LOGICAL_NOT_EQUAL

/* union */

%union{int num;char *str;}


%token <str> STRING
%token <num> NUM
%token <str> ID


%left PLUS MINUS
%left MUL DIV
%left LEFT_B RIGHT_B

%%

programs : program
;

program : program variable_declaration      {fprintf(yyout,"\n");}
    
    | program function_declaration     {fprintf(yyout,"\n");}
    
    | program function_definition      {fprintf(yyout,"\n");}
    
    |variable_declaration          {fprintf(yyout,"\n");}
    
    | function_declaration             {fprintf(yyout,"\n");}
    
    | function_definition              {fprintf(yyout,"\n");}
    
    ;

function_declaration : int ident LEFT_B function_arguments RIGHT_B SEMI_COLON           {fprintf(yyout,"above function was declared\n\n");}
    
    | int ident LEFT_B RIGHT_B SEMI_COLON                           {fprintf(yyout,"above function was declared\n\n");}
    
    | char ident LEFT_B function_arguments RIGHT_B SEMI_COLON                {fprintf(yyout,"above function was declared\n\n");}
    
    | char ident LEFT_B RIGHT_B SEMI_COLON                          {fprintf(yyout,"above function was declared\n\n");}
    
    ;

function_definition : int ident LEFT_B function_arguments RIGHT_B function_body       {fprintf(yyout,"above function was defined\n\n");}
    
    | int ident LEFT_B RIGHT_B function_body                      {fprintf(yyout,"above function was defined\n\n");}
    
    | char ident LEFT_B function_arguments RIGHT_B function_body           {fprintf(yyout,"above function was defined\n\n");}
    
    | char ident LEFT_B RIGHT_B function_body                     {fprintf(yyout,"above function was defined\n\n");}
    ;

function_body : LEFT_FLOWER stmt_list RIGHT_FLOWER
    
    | stmt
    ;


function_arguments : int ident                   {fprintf(yyout,"above function arguments were passed\n\n");}
    
    | int ident COMMA function_arguments
    
    | char ident                        {fprintf(yyout,"above function arguments were passed\n\n");}
    
    | char ident COMMA function_arguments
    ;

function_call : ident LEFT_B RIGHT_B SEMI_COLON
    | ident LEFT_B expr
    ;

variable_declaration : int ident SEMI_COLON  
    
    | char ident SEMI_COLON 
    
    | int ident ASSIGN expr SEMI_COLON        {fprintf(yyout,"Assignment : =\n");}
    
    | char ident ASSIGN string SEMI_COLON     {fprintf(yyout,"Assignment : =\n");}              
    
    ;

int : INT       {fprintf(yyout,"Datatype : int\n");}
    ;

char : CHAR     {fprintf(yyout,"Datatype : char *\n");}
    ;

stmt_list : stmt_list stmt
    | stmt
    ;

stmt : assign_statement
    
    | function_call             {fprintf(yyout,"Function call ends\n\n");}
    
    | return_statement           {fprintf(yyout,"Return statement\n\n");}
    
    | condition             {fprintf(yyout,"If Condition Ends\n\n");}
    
    | loop                  {fprintf(yyout,"While Loop Ends\n\n");}
    
    | variable_declaration
    
    ;

assign_statement : expr ASSIGN expr SEMI_COLON
    ;

return_statement : RETURN SEMI_COLON
    
    | RETURN expr SEMI_COLON
    
    ;

condition : IF LEFT_B bool RIGHT_B function_body
    
    | IF LEFT_B bool RIGHT_B function_body ELSE function_body
    ;

loop : WHILE LEFT_B bool RIGHT_B function_body
    ;

bool : expr
    |bool LESS_THAN bool              {fprintf(yyout,"operator : <\n");}
    
    | bool GREATER_THAN bool            {fprintf(yyout,"operator : >\n");}
    
    | bool LESS_THAN_EQUAL bool         {fprintf(yyout,"operator : <=\n");}
    
    | bool GREATER_THAN_EQUAL bool      {fprintf(yyout,"operator : >=\n");}
    
    | bool LOGICAL_EQUAL bool           {fprintf(yyout,"operator : ==\n");}
    
    | bool LOGICAL_NOT_EQUAL bool       {fprintf(yyout,"operator : !=\n");}
    
    ;

ident : ID      {fprintf(yyout,"identifier : %s\n", $1);}
    ;

number : NUM    {fprintf(yyout,"Value : %d\n", $1);}
    ;

string : STRING {fprintf(yyout,"Value : %s\n", $1);}
    ;

expr : LEFT_B expr RIGHT_B
    | expr MINUS expr           {fprintf(yyout,"operator : -\n");}

    | expr MUL expr             {fprintf(yyout,"operator : *\n");}
    
    | expr PLUS expr            {fprintf(yyout,"operator : +\n");}
    
    | expr DIV expr             {fprintf(yyout,"operator : /\n");}
    
    | number                    
    
    | ident
    ;

%%

void yyerror(char const *s){
    printf("Error\n");
}

int main()
{
    yyin=fopen("Sample1.cu","r");
    yyout=fopen("parser.txt","w");
    lexi=fopen("lexer.txt","w");
    yyparse();
    return 0;
}

