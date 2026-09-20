.text
.globl main
main:
    li x10, 0x100           # x (destination array)
    li x11, 0x200           # y (source array string)
    
    # Setup y = "hello\0" contiguously in memory (1 byte each)
    li x6, 'h'
    sb x6, 0(x11)
    li x29, 'e'
    sb x29, 1(x11)
    li x30, 'l'
    sb x30, 2(x11)
    li x31, 'l'
    sb x31, 3(x11)
    li x5, 'o'
    sb x5, 4(x11)
    sb x0, 5(x11)           # Null terminator '\0'

    jal x1, strcpy          # Call the function
    j exit

strcpy:
    addi sp, sp, -16        # Allocate stack space (16-byte aligned)
    sw x19, 0(sp)           # Save register x19 to the stack
    
    li x19, 0               # i = 0
loop:
    add x5, x11, x19        # Address of y[i]
    lb x28, 0(x5)           # Load byte from y[i]
    
    add x6, x10, x19        # Address of x[i]
    sb x28, 0(x6)           # Store byte to x[i]
    
    beq x28, x0, done       # Check for null terminator
    
    addi x19, x19, 1        # i += 1
    j loop
done:
    lw x19, 0(sp)           # Restore original value of x19
    addi sp, sp, 16         # Deallocate stack space
    jalr x0, 0(x1)          # Return from function
exit: