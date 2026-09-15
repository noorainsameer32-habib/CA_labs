.text
.globl main
main:
    li x22, 0
    li x23, 0
    li x24, 0x200
    li x11, 10

loop:
    bge x22, x11, L1_end
    slli x10, x22, 2
    add x10, x10, x24
    sw x22, 0(x10)
    addi x22, x22, 1
    beq x0, x0, loop

L1_end:
    li x22, 0

loop2:
    bge x22, x11, l_end
    slli x10, x22, 2
    add x10, x10, x24
    lw x12, 0(x10)
    add x23, x23, x12
    addi x22, x22, 1
    beq x0, x0, loop2

l_end:

end:
    j end