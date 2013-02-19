BINARY_NAME=parser

default: grammar c-files

c-files: *.c
	gcc -c $^
	gcc *.o -o $(BINARY_NAME)

grammar: *.grm
	bison $^

clean:
	rm -f *.o
	rm -f *.tab.grm
	rm -f $(BINARY_NAME)
