%option noyywrap
%{
	#include<stdio.h>
	#include<string.h>
	int comment=0, state=1;
%}

%%
"//".*[\n] {comment++;} 
"/*" {state=0;}
"*/" {if(state==0)
	  {comment++;
	    state=1;}
      }
.|\n { if(state==1)
	{
	   fprintf(yyout, "%s", yytext);
	}
     }

%%
int main()
{

	char infile[100],outfile[100];
	printf("enter input file name");
	scanf("%s", infile);
	printf("enter output file name");
	scanf("%s", outfile);
	yyin=fopen(infile, "r");
	yyout=fopen(outfile, "w");
	yylex();
	printf("total comment lines are =%d", comment);
	return 0;
}