/* british -> american english */
%%
"colour" { printf("color");}
"flavour" {printf("flavor");}
"clever" {printf("smart");}
. {printf("%s", yytext);} /* if not in the list above, then give the original */
%%