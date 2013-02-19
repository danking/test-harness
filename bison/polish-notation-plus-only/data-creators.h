#ifndef DATA_CREATORS
#define DATA_CREATORS

exp_holder * make_num(int);
exp_holder * make_add(char, exp_holder *, exp_holder *);

exp_holder * allocate_exp_holder();
void free_exp(exp_holder *);
void free_add(add);

#endif
