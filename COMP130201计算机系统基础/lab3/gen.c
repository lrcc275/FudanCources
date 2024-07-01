#include "happy.h"

static struct gen
{
    int error;
    int data;
    void* stack;
    __ctx_type ctx;
    struct gen* caller;
    void* eh_list;
    void (*f)(int);
} __gen_0;
struct gen* __this_gen = &__gen_0;

int yield(int value)
{
    if (__this_gen->caller == NULL)
        throw(ERR_GENNIL);
    __this_gen->data = value;
    int n = __ctx_record(&(__this_gen->ctx));
    if(n == 0){
        __this_gen = __this_gen->caller;
        __ctx_recover(&(__this_gen->ctx),1);
    }
    return __this_gen->data;
}

int send(struct gen* gen, int value)
{
    if (gen == NULL)
        throw(ERR_GENNIL);
    if (gen->error)
        throw(gen->error);
    gen->data = value;
    int n;
    n = __ctx_record(&(__this_gen->ctx));
    gen->caller = __this_gen;
    if(n == 0){
        __this_gen = gen;
        __ctx_recover(&(gen->ctx),1);
    }
    if (gen->error)
        throw(gen->error);
    return gen->data;
}

void initial(){
    u64* t = __this_gen->stack;
    u64 arg = *t;
    __this_gen->f(arg);
    return;
}

void over(){
    __this_gen->error = ERR_GENEND;
    __this_gen = __this_gen->caller;
    __ctx_recover(&(__this_gen->ctx),1);
    return;
}

struct gen* generator(void (*f)(int), int arg)
{
    struct gen* g = malloc(sizeof(*g));
    memset(g, 0, sizeof(*g));
    g->f = f;
    g->stack = malloc(8192);
    u64* t1 = g->stack;
    *t1 = arg;
    u64* t2 = g->stack + 8184;
    u64* t3 = g->stack + 8176;
    *t2 = over;
    *t3 = initial;
    g->ctx.rsp = t3;
    g->ctx.rip = *t3;
    return g;
}

void genfree(struct gen** g)
{
    if (*g == NULL)
        throw(ERR_GENNIL);
    free((*g)->stack);
    free(*g);
    *g = NULL;
}

void __eh_push(void* ctx)
{
    assert(ctx != NULL);
    __ctx_type* x = ctx;
    x->next = __this_gen->eh_list;
    __this_gen->eh_list = x;
}

void* __eh_pop()
{
    assert(__this_gen->eh_list != NULL);
    __ctx_type* t = __this_gen->eh_list;
    __this_gen->eh_list = t->next;
    t->next = NULL;
    return t;
}

void* __eh_head()
{
    return __this_gen->eh_list;
}

void throw(int error)
{
    if (error == 0)
        throw(ERR_THROW0);
    if(__this_gen->eh_list == NULL){
        __this_gen = __this_gen->caller;
        throw(error);
        return;
    }
    __ctx_type* ttx = __eh_pop();
    __ctx_recover(ttx,error);
    assert(0); // shouldn't run here
}
