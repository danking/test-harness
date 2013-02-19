#include "data.h"
#include "data-creators.h"
#include <stdio.h>
#include <stdlib.h>

exp_holder * make_num(int i) {
  num n = {i};
  exp n_exp;
  n_exp.numval = n;
  exp_holder * e_hold = allocate_exp_holder();
  e_hold->val = n_exp;
  e_hold->tag = E_NUM;
  return e_hold;
}

exp_holder * make_add(char op,
                      exp_holder * e1,
                      exp_holder * e2) {
  add a = {op, e1, e2};
  exp a_exp;
  a_exp.addval = a;
  exp_holder * e_hold = allocate_exp_holder();
  e_hold->val = a_exp;
  e_hold->tag = E_ADD;
  return e_hold;
}


/*******************
 * allocate and free
 */

/*
 * exit code 1 means that we ran out of space
 */

exp_holder * allocate_exp_holder() {
  exp_holder * e_hold = (exp_holder *) malloc(sizeof(exp_holder));
  if (e_hold == NULL) {
    printf("no memory to allocate an exp_holder!");
    exit(1);
  }
  return e_hold;
}

void free_exp(exp_holder * exp) {
  if (exp->tag == E_NUM) {
    free(exp);
  } else {
    free_add(exp->val.addval);
    free(exp);
  }
}

void free_add(add a) {
  free_exp(a.e1);
  free_exp(a.e2);
}

