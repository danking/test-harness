default: lexer grammar c-files

c-files: *.c
	gcc -ggdb3 -c $^
	gcc -ggdb3 -c c-parser.c
	gcc -ggdb3 -c lex.yy.c
	#
	gcc -ggdb3 c.o c-parser.o lex.yy.o -o parser

grammar: c.grm
	bison c.grm

lexer: c.lex
	flex c.lex

clean:
	rm -f *.o
	rm -f *-parser.c
	rm -f *-parser.h
	rm -f lex.yy.o
	rm -f lex.yy.c
	rm -f y.tab.h
	rm -f parser

