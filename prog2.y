%{
	#include<stdio.h>
	#include<stdlib.h>
%}

%token A B

%% 
S:X B
X:A X
 |;

%%
int main()
{
printf("Enter an string: ");
yyparse();
printf("valid string");
}

yyerror()
{
printf("invalid string");
exit(0);
}