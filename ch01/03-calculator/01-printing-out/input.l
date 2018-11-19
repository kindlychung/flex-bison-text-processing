%%
[0-9]+ {printf("NUMBER: %s\n", yytext);}
"+" {printf("PLUS\n");}
"-" {printf("MINUS \n");}
"*" {printf("TIMES \n");}
"/" {printf("DIVIDE\n");}
"|" {printf("abs\n");}
\n {printf("NEWLINE\n");}
[ \t] {printf("WHITESPACE\n");} 
. {printf("UNKNOWN: %s\n", yytext);} 
%%