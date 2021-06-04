%{
	#include<stdio.h>
	#include<stdlib.h>
	extern int yylval;
	int id=0, dig=0, keyword=0, op=0;
%}

%token OP KEYWORD ID DIGIT

%% 
S: DIGIT S  { dig++;}
   |ID S    { id++;}
   |KEYWORD S {keyword++;}
   |OP S     {op++;}
   |DIGIT    { dig++;}
   |ID      { id++;}
   |KEYWORD  {keyword++;}
   |OP	     {op++;}
  


%%
extern FILE *yyin;
void main()
{
yyin= fopen("inputfile.c", "r");
do
{
    yyparse();
}
while(!feof(yyin));
fclose(yyin);
printf("total number of operators= %d", op);
printf("total number of digits= %d", dig);
printf("total number of identifiers= %d", id);
printf("total number of keywords= %d", keyword);
}

int yyerror ()
{
	printf("error");
}