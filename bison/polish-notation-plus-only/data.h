#ifndef PARSE_DATA
#define PARSE_DATA

typedef enum exp_tag { E_NUM, E_ADD } exp_tag;

typedef struct exp_holder exp_holder;

typedef struct {
  char op;

  exp_holder * e1;
  exp_holder * e2;
} add;

typedef struct {
  int value;
} num;

typedef union {
  add addval;
  num numval;
} exp;

typedef struct exp_holder {
  exp val;
  exp_tag tag;
} exp_holder;

#endif
