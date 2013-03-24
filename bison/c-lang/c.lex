D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]
E			[Ee][+-]?{D}+
FS			(f|F|l|L)
IS			(u|U|l|L)*

%{
#define YYSTYPE char*
#include <stdio.h>
#include "c-parser.h"

void count();
%}

%%
"/*"			{ comment(); }

"auto"			{ count(); yylval = "auto"; return(AUTO); }
"break"			{ count(); yylval = "break"; return(BREAK); }
"case"			{ count(); yylval = "case"; return(CASE); }
"char"			{ count(); yylval = "char"; return(CHAR); }
"const"			{ count(); yylval = "const"; return(CONST); }
"continue"		{ count(); yylval = "continue"; return(CONTINUE); }
"default"		{ count(); yylval = "default"; return(DEFAULT); }
"do"			{ count(); yylval = "do"; return(DO); }
"double"		{ count(); yylval = "double"; return(DOUBLE); }
"else"			{ count(); yylval = "else"; return(ELSE); }
"enum"			{ count(); yylval = "enum"; return(ENUM); }
"extern"		{ count(); yylval = "extern"; return(EXTERN); }
"float"			{ count(); yylval = "float"; return(FLOAT); }
"for"			{ count(); yylval = "for"; return(FOR); }
"goto"			{ count(); yylval = "goto"; return(GOTO); }
"if"			{ count(); yylval = "if"; return(IF); }
"int"			{ count(); yylval = "int"; return(INT); }
"long"			{ count(); yylval = "long"; return(LONG); }
"register"		{ count(); yylval = "register"; return(REGISTER); }
"return"		{ count(); yylval = "return"; return(RETURN); }
"short"			{ count(); yylval = "short"; return(SHORT); }
"signed"		{ count(); yylval = "signed"; return(SIGNED); }
"sizeof"		{ count(); yylval = "sizeof"; return(SIZEOF); }
"static"		{ count(); yylval = "static"; return(STATIC); }
"struct"		{ count(); yylval = "struct"; return(STRUCT); }
"switch"		{ count(); yylval = "switch"; return(SWITCH); }
"typedef"		{ count(); yylval = "typedef"; return(TYPEDEF); }
"union"			{ count(); yylval = "union"; return(UNION); }
"unsigned"		{ count(); yylval = "unsigned"; return(UNSIGNED); }
"void"			{ count(); yylval = "void"; return(VOID); }
"volatile"		{ count(); yylval = "volatile"; return(VOLATILE); }
"while"			{ count(); yylval = "while"; return(WHILE); }

{L}({L}|{D})*		{ count(); yylval = strdup(yytext); return(check_type()); }

0[xX]{H}+{IS}?		{ count(); yylval = strdup(yytext); return(CONSTANT); }
0{D}+{IS}?		{ count(); yylval = strdup(yytext); return(CONSTANT); }
{D}+{IS}?		{ count(); yylval = strdup(yytext); return(CONSTANT); }
L?'(\\.|[^\\'])+'	{ count(); yylval = strdup(yytext); return(CONSTANT); }

{D}+{E}{FS}?		{ count(); yylval = strdup(yytext); return(CONSTANT); }
{D}*"."{D}+({E})?{FS}?	{ count(); yylval = strdup(yytext); return(CONSTANT); }
{D}+"."{D}*({E})?{FS}?	{ count(); yylval = strdup(yytext); return(CONSTANT); }

L?\"(\\.|[^\\"])*\"	{ count(); yylval = strdup(yytext); return(STRING_LITERAL); }

"..."			{ count(); yylval = "..."; return(ELLIPSIS); }
">>="			{ count(); yylval = ">>="; return(RIGHT_ASSIGN); }
"<<="			{ count(); yylval = "<<="; return(LEFT_ASSIGN); }
"+="			{ count(); yylval = "+="; return(ADD_ASSIGN); }
"-="			{ count(); yylval = "-="; return(SUB_ASSIGN); }
"*="			{ count(); yylval = "*="; return(MUL_ASSIGN); }
"/="			{ count(); yylval = "/="; return(DIV_ASSIGN); }
"%="			{ count(); yylval = "%="; return(MOD_ASSIGN); }
"&="			{ count(); yylval = "&="; return(AND_ASSIGN); }
"^="			{ count(); yylval = "^="; return(XOR_ASSIGN); }
"|="			{ count(); yylval = "|="; return(OR_ASSIGN); }
">>"			{ count(); yylval = ">>"; return(RIGHT_OP); }
"<<"			{ count(); yylval = "<<"; return(LEFT_OP); }
"++"			{ count(); yylval = "++"; return(INC_OP); }
"--"			{ count(); yylval = "--"; return(DEC_OP); }
"->"			{ count(); yylval = "->"; return(PTR_OP); }
"&&"			{ count(); yylval = "&&"; return(AND_OP); }
"||"			{ count(); yylval = "||"; return(OR_OP); }
"<="			{ count(); yylval = "<="; return(LE_OP); }
">="			{ count(); yylval = ">="; return(GE_OP); }
"=="			{ count(); yylval = "=="; return(EQ_OP); }
"!="			{ count(); yylval = "!="; return(NE_OP); }
";"			{ count(); yylval = ";"; return(';'); }
("{"|"<%")		{ count(); yylval = strdup(yytext); return('{'); }
("}"|"%>")		{ count(); yylval = strdup(yytext); return('}'); }
","			{ count(); yylval = ","; return(','); }
":"			{ count(); yylval = ":"; return(':'); }
"="			{ count(); yylval = "="; return('='); }
"("			{ count(); yylval = "("; return('('); }
")"			{ count(); yylval = ")"; return(')'); }
("["|"<:")		{ count(); yylval = strdup(yytext); return('['); }
("]"|":>")		{ count(); yylval = strdup(yytext); return(']'); }
"."			{ count(); yylval = "."; return('.'); }
"&"			{ count(); yylval = "&"; return('&'); }
"!"			{ count(); yylval = "!"; return('!'); }
"~"			{ count(); yylval = "~"; return('~'); }
"-"			{ count(); yylval = "-"; return('-'); }
"+"			{ count(); yylval = "+"; return('+'); }
"*"			{ count(); yylval = "*"; return('*'); }
"/"			{ count(); yylval = "/"; return('/'); }
"%"			{ count(); yylval = "%"; return('%'); }
"<"			{ count(); yylval = "<"; return('<'); }
">"			{ count(); yylval = ">"; return('>'); }
"^"			{ count(); yylval = "^"; return('^'); }
"|"			{ count(); yylval = "|"; return('|'); }
"?"			{ count(); yylval = "?"; return('?'); }

[ \t\v\n\f]		{ count(); }
.			{ /* ignore bad characters */ }

%%

yywrap()
{
	return(1);
}


comment()
{
	char c, c1;

loop:
	while ((c = input()) != '*' && c != 0)
		putchar(c);

	if ((c1 = input()) != '/' && c != 0)
	{
		unput(c1);
		goto loop;
	}

	if (c != 0)
		putchar(c1);
}


int column = 0;

void count()
{
	int i;

	for (i = 0; yytext[i] != '\0'; i++)
		if (yytext[i] == '\n')
			column = 0;
		else if (yytext[i] == '\t')
			column += 8 - (column % 8);
		else
			column++;

	ECHO;
}


int check_type()
{
/*
* pseudo code --- this is what it should check
*
*	if (yytext == type_name)
*		return(TYPE_NAME);
*
*	return(IDENTIFIER);
*/

/*
*	it actually will only return IDENTIFIER
*/

	return(IDENTIFIER);
}
