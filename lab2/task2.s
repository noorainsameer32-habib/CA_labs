.text
.globl main
main:
    li x1, 1
    li x2, 2
    li x3, 3
    li x4, 4
    li x20, 6 #x
    li x21, 1 #a
    li x22, 4 #b
    li x23, 4 #c

    beq x20, x1, L1
    beq x20, x2, L2
    beq x20, x3, l3
    beq x20, x4, l4

    j default

default:
    li x21, 0
    beq x0, x0, Exit

L1:
    add x21, x22, x23
    beq x0, x0, Exit

L2:
    sub x21, x22, x23
    beq x0, x0, Exit

l3:
    mul x21, x22, x2
    beq x0, x0, Exit

l4:
    div x21, x22, x2
    beq x0, x0, Exit

Exit:
end:
<<<<<<< HEAD
   j end
=======
    j end
>>>>>>> d8383ff38a60a72fe00a00d8ca9362c1a46520d3
