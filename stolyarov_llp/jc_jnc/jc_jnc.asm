global _start

%include "syscalls.inc"

section .data
msg_1 db  "CF=1", 0xa
msg_2 db  "CF=0", 0xa

section .text
_start:

print:
  mov al, 255
  mov bl, 2
  mul bl        ; multiple al:255 * bl:2 = 510
  jc print_sf   ; jump to print_eq if CF=1 
  _syscall_print_stdout msg_2, 5
  jnc exit      ; jump to exit if CF=0 

print_sf:
  _syscall_print_stdout msg_1, 5 

exit:
  _syscall_exit 0
 
