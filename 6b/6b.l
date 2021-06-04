%option noyywrap
%{
	#include<stdio.h>
	#include"y.tab.h"
	extern int yylval;
%}

%%

[\+\-\*\/\=] {printf("%s is operator\n", yytext);
		return OP;}
int|float|char|bool|void|for|do|while|if|else|return|printf|scanf {printf("%s is a keyword\n", yytext);
								      return KEYWORD; }
[0-9]*  {yylval=atoi(yytext);
	  printf("%d is number", yylval);
	  return DIGIT; 
	  }
[A-Za-z_][a-zA-Z0-9]* {printf("%s is a identifier\n", yytext);
		return ID;
	      }
.|\n ;
%%