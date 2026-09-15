.text
.globl main
main:
    li x5, 3          
    li x6, 3         
    li x7, 0          
    li x10, 0x100     

L0:
    bge x7, x5, end   
    li  x29, 0      

L1:
    bge  x29, x6, next   
    slli x11, x29, 4     
    add  x11, x11, x10   
    add  x12, x7, x29   
    sw   x12, 0(x11)     
    addi x29, x29, 1    
    beq  x0, x0, L1

next:
    addi x7, x7, 1       
    beq  x0, x0, L0

end:
    j end