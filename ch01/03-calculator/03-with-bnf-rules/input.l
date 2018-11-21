%{
# include "input.tab.h"
%}

%%
"+"	{ return ADD; }
"-"	{ return SUB; }
"*"	{ return MUL; }
"/"	{ return DIV; }
"_|"     { return OPEN_ABS; }
"|_"     { return CLOSE_ABS; }
"("     { return OPEN_PAREN; }
")"     { return CLOSE_PAREN; }
[+-]?[0-9]+	{ yylval = atoi(yytext); return NUMBER; }

\n      { return EOL; }
"//".*  
[ \t]   { /* ignore white space */ }
.	{ yyerror("Mystery character %c\n", *yytext); }
%%
