.text

.globl __ctx_record
__ctx_record:
endbr64
movq %rsp,0(%rdi)
movq %rbp,8(%rdi)
movq (%rsp),%rdx
movq %rdx,16(%rdi)
movq $0,%rax
retq

.globl __ctx_recover
__ctx_recover:
endbr64
movq 0(%rdi),%rsp
movq 8(%rdi),%rbp
movq 16(%rdi),%rdx
movq %rdx,(%rsp)
movq %rsi,%rax
retq
