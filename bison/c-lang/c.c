/* #include "c.tab.grm" */
/* #include "lex.yy.c" */
#include "c-parser.h"
#include <stdio.h>

int
main (void)
{
  char* result;
  yyparse(&result);
  printf("%s", result);
  return 0;
}
