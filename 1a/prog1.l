%option noyywrap
%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
	int num=0,op=0,i=0, top=-1;
	char stack[10], opr[10];
	int number[10];
%}

%%
[0-9]+ {number[num++]=atoi(yytext);}
"+" {opr[op++]='+';}
"*" {opr[op++]='*';}
"(" {stack[++top]= '(';}
")" {
	if(stack[top]=='(' && top!=-1)
	{
        top--;
	}
	else
	{ 
	printf("invalid expression");
	   exit(0);
	}
}
. ;
%%
int main()
{
	printf("enter expression");
	yylex();
	if(top==-1&& num==op+1)
{
	printf("valid exp\n");
	printf("number of identifier=%d\t",num);
	printf("list of identifiers present are\t");
	for(i=0;i<num;i++)
	{
	printf("%d\t", number[i]);
	}
	printf("\n");
	printf("number of operators=%d\t",op);
	printf("list of operators present are\t");
	for(i=0;i<op;i++)
	{
	printf("%c\t", opr[i]);
	}
	printf("\n");

}
	else 
	{
	printf("invalid exp");
	}
	return 0;
}