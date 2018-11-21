%{
#  include <stdio.h>
%}

/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV 
%token BITWISE_AND BITWISE_OR
%token OPEN_PAREN CLOSE_PAREN
%token OPEN_ABS CLOSE_ABS
%token EOL

%%

calclist: /* nothing */
 | calclist exp EOL { printf("= %d\n> ", $2); }
 | calclist EOL { printf("> "); } /* blank line or a comment */
 ;

exp: factor
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
 ;

factor: term
 | factor MUL term { $$ = $1 * $3; }
 | factor DIV term { $$ = $1 / $3; }
 | factor BITWISE_AND term { $$ = $1 & $3; }
 | factor BITWISE_OR  term { $$ = $1 | $3; }
 ;

term: NUMBER
 | OPEN_ABS term CLOSE_ABS { $$ = $2 >= 0? $2 : - $2; }
 | OPEN_PAREN exp CLOSE_PAREN { $$ = $2; }
 ;

%%

#include <signal.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void my_handler(int s) {
    printf("Caught signal %d\n", s);
    exit(1);
}

int main()
{
  printf("> "); 
  yyparse();
  return 0;
}

yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}
