.section .data
array:
.long 42,45,87,3,69
array_end:

.section .text
.globl _start

_start:
movl  array, %eax        
movl  $array+4, %ebx 
jmp   ch_end
       
look_start:                    
        cmpl  %eax, (%ebx)     
        jge   els                                             
        movl  (%ebx), %eax    
         
els:
        addl  $4, %ebx         
               
ch_end:
        cmpl  $array_end, %ebx  
        jne    look_start       

movl %eax, %ebx
movl $1, %eax
int $0x80

