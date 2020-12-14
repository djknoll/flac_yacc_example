/* Definition section */
%{ 
	#include<stdio.h> 
	#include "calc.tab.h" 
	extern int yylval; 
%} 

/* Rule Section */
%% 
[[:digit:]]+       { yylval = atoi(yytext); return NUMBER; }

[\t] ; 

[\n] return 0; 

. return yytext[0]; 

%% 

int yywrap() 
{ 
return 1; 
} 
