%defines
%{ 
	/* Definition section */
	#include<stdio.h> 
	int flag=0;
	int yylex();
	void yyerror(const char *s);
%} 

%token NUMBER 
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%
// rule section
Line: Expression {printf("\nResult=%d\n", $$); };

Expression:Expression '+' Expression {$$=$1+$3;} 
		|  Expression '-' Expression {$$=$1-$3;} 
		|  Expression '*' Expression {$$=$1*$3;} 
		|  Expression '/' Expression {$$=$1/$3;} 
		|  Expression '%' Expression {$$=$1%$3;} 
		|  '(' Expression ')' {$$=$2;} 
		|  NUMBER {$$=$1;} 
		; 

%% 
//driver code 
int main() { 
	printf("\nEnter Any Arithmetic Expression:\n"); 

	yyparse(); 
	if(flag==0) 
		printf("\nEntered arithmetic expression is Valid\n\n"); 
} 

void yyerror() 
{ 
printf("\nEntered arithmetic expression is Invalid\n\n"); 
flag=1; 
} 
