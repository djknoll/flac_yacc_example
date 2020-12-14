#build program
calc: calc.tab.c calc.yy.c
	gcc -o calc calc.tab.c calc.yy.c

#generate parser
calc.tab.c: calc.y
	bison -v calc.y

#generate lexer
calc.yy.c: calc.l
	flex -o calc.yy.c calc.l

