#include "data.h"
#include <stdio.h>
#include "unparser.h"

void unparse_exp(exp_holder * exp) {
  if (exp->tag == E_NUM) {
    unparse_num(exp->val.numval);
  } else {
    unparse_add(exp->val.addval);
  }
}

void unparse_add(add a) {
  printf("(%c ", a.op);
  unparse_exp(a.e1);
  printf(" ");
  unparse_exp(a.e2);
  printf(")");
}

void unparse_num(num n) {
  printf("%d", n.value);
}
