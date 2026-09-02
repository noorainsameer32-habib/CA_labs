




.text
.globl main
main:
     li x1, 5
     li x9, 5
     add x2, x0, x0
     addi x1, x2, 32
     add x3, x1, x2
     sub x3, x3, x9
     sub x4, x1, x3
     sub x5, x2, x1
     add x6, x4, x5
     add x6, x6, x3
     add x6, x6, x1
     add x6, x6, x2
     add x6, x6, x3
end:
    j end    