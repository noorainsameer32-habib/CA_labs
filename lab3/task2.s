.text
.globl main
main:
    li x10,12       #g
    li x11,12       #h
    li x12,10       #i
    li x13,10       #j
    li x20,1        #f
    jal x1, leaf_example

    addi x11, x10, 0
    li x10, 1
    j exit

leaf_example:
    addi sp, sp, -16    # 16-byte alignment
    sw x18, 8(sp)       # Save x18
    sw x19, 4(sp)       # Save x19
    sw x20, 0(sp)       # Save x20

    add x18, x10, x11   # x18 = g + h
    add x19, x12, x13   # x19 = i + j
    sub x20, x18, x19   # x20 = (g + h) - (i + j)
    addi x10, x20, 0    # Move result to return register x10

    lw x20, 0(sp)       # Restore x20
    lw x19, 4(sp)       # Restore x19
    lw x18, 8(sp)       # Restore x18
    addi sp, sp, 16     # Restore stack pointer
    jalr x0, 0(x1)      # Return
exit: