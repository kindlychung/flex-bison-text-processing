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
"|"     { return BITWISE_OR; }
"&"     { return BITWISE_AND; }
"("     { return OPEN_PAREN; }
")"     { return CLOSE_PAREN; }
[+-]?[0-9]+	{ yylval = atoi(yytext); return NUMBER; }
[+-]?"0x"[0-9a-f]+	{ yylval = strtol(yytext, NULL, 16); return NUMBER; }

\n      { return EOL; }
"//".*  
[ \t]   { /* ignore white space */ }
.	{ yyerror("Mystery character %c\n", *yytext); }
%%
