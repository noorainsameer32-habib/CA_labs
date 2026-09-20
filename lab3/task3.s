.text
.globl main
main:
    li x10, 0x100       # Base address of array v
    li x11, 1           # k = 1

    # Setup 32-bit data in memory (using 4-byte offsets)
    li x5, 23
    sw x5, 0(x10)       # v[0]
    li x5, 12
    sw x5, 4(x10)       # v[1]
    li x5, 5
    sw x5, 8(x10)       # v[2]
    
    jal x1, swap        # Call swap(v, k)
    
    li x10, 1
    ecall
    j exit

swap:
    slli x15, x11, 2    # Multiply index k by 4 (for 32-bit elements)
    add x17, x10, x15   # x17 = &v[k]
    
    lw x14, 0(x17)      # Load 32-bit v[k]
    lw x16, 4(x17)      # Load 32-bit v[k+1] (4 bytes ahead)
    
    sw x16, 0(x17)      # v[k] = v[k+1]
    sw x14, 4(x17)      # v[k+1] = old v[k]
    
    jalr x0, 0(x1)

exit:
