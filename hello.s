.section __DATA,__data
str:
  .asciz "Hello shov\n"

.section __TEXT,__text
.globl _main
_main:
  movl $0x2000004, %eax           # preparing system call 4
  movl $1, %edi                   # STDOUT file descriptor is 1
  movq str@GOTPCREL(%rip), %rsi   # The value to print
  movq $100, %rdx                 # the size of the value to print
  syscall

  movl $0, %ebx
  movl $0x2000001, %eax           # exit 0
  syscall
