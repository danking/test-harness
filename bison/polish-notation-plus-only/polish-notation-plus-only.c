#include "polish-notation-plus-only.tab.grm"
#include "polish-notation-plus-only.lex"

int
main (void)
{
  return yyparse ();
}
