.text
.globl main

main:
    li x10, 5           # Feed the starting number (5) into x10
    jal x1, fact_iter       # Call the factorial function
    li x10, 10          
    ecall


fact_iter:
    li x11, 1              # acc = 1
loop:
    bge x0, x10, end       # if 0 >= n, exit loop
    mul x11, x11, x10      # acc = acc * n
    addi x10, x10, -1      # n = n - 1
    beq x0, x0, loop       # repeat loop
end:
    addi x10, x11, 0       # move result to return register
    jalr x0, 0(x1)         # return to caller