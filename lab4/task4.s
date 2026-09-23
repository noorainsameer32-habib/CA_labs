.text
.globl main

main:
    li x10, 6           # Feed the starting Fibonacci index (6) into x10
    jal x1, fib         # Call the recursive fib function
    
    li x10, 10          # Setup exit ecall
    ecall

fib:
    addi sp, sp, -16       # allocate stack frame
    sw x1, 8(sp)           # save return address
    sw x10, 0(sp)          # save n
    
    li x5, 1
    bge x5, x10, fib_base  # if 1 >= n, return n
    
    addi x10, x10, -1      # n - 1
    jal x1, fib            # call fib(n-1)
    
    sw x10, 4(sp)          # save result of fib(n-1) on stack
    
    lw x10, 0(sp)          # restore original n
    addi x10, x10, -2      # n - 2
    jal x1, fib            # call fib(n-2)
    
    lw x5, 4(sp)           # load fib(n-1)
    add x10, x10, x5       # fib(n) = fib(n-1) + fib(n-2)
    
    lw x1, 8(sp)           # restore return address
    addi sp, sp, 16        # deallocate stack frame
    jalr x0, 0(x1)         # return

fib_base:
    # x10 already contains n (which is 0 or 1)
    lw x1, 8(sp)           # restore return address
    addi sp, sp, 16        # deallocate stack frame
    jalr x0, 0(x1)         # return