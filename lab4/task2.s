main:
    li x10, 5              # num = 5
    jal x1, ntri           # call ntri(5)
    
    addi x11, x10, 0       # move result for ecall
    li x10, 1              # print_int ecall
    ecall
    li x10, 10             # exit ecall
    ecall

ntri:
    addi sp, sp, -16       # allocate stack frame
    sw x1, 8(sp)           # save return address
    sw x10, 0(sp)          # save num
    
    li x5, 1
    bge x5, x10, base      # if 1 >= num, go to base case
    
    addi x10, x10, -1      # num - 1
    jal x1, ntri           # recursive call: ntri(num - 1)
    
    lw x5, 0(sp)           # restore num
    add x10, x10, x5       # result = num + ntri(num - 1)
    
    lw x1, 8(sp)           # restore return address
    addi sp, sp, 16        # deallocate stack frame
    jalr x0, 0(x1)         # return

base:
    li x10, 1              # base case return 1
    lw x1, 8(sp)           # restore return address
    addi sp, sp, 16        # deallocate stack frame
    jalr x0, 0(x1)         # return