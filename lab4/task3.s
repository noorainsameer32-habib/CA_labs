.text
.globl main

main:
    # 1. Load the starting memory address (0x10000000) into x10
    lui x10, 0x10000        # lui shifts the value into the upper 20 bits
    
    # 2. Manually store the unsorted numbers: 5, 2, 9, 1, 6
    li x5, 5
    sw x5, 0(x10)           # array[0] = 5
    
    li x5, 2
    sw x5, 4(x10)           # array[1] = 2
    
    li x5, 9
    sw x5, 8(x10)           # array[2] = 9
    
    li x5, 1
    sw x5, 12(x10)          # array[3] = 1
    
    li x5, 6
    sw x5, 16(x10)          # array[4] = 6
    
    # 3. Set up the second argument (array size)
    li x11, 5               # Load size (5) into x11
    
    # 4. Call your bubble sort function
    jal x1, bsort
    
    # 5. Exit cleanly
    li x10, 10
    ecall


bsort:                      # Changed to match jal x1, bsort
    beq x10, x0, end_bubble # if a == NULL, return
    beq x11, x0, end_bubble # if len == 0, return
    li x5, 0                # i = 0
outer_loop:
    bge x5, x11, end_bubble # if i >= len, end
    addi x6, x5, 0          # j = i
inner_loop:
    bge x6, x11, end_inner  # if j >= len, end inner loop
    
    slli x7, x5, 2          # offset = i * 4
    add x7, x10, x7         # address of a[i]
    lw x28, 0(x7)           # load a[i]
    
    slli x29, x6, 2         # offset = j * 4
    add x29, x10, x29       # address of a[j]
    lw x30, 0(x29)          # load a[j]
    
    ble x28, x30, skip_swap # CHANGED: if a[i] <= a[j], skip swap (sorts ascending)
    
    sw x30, 0(x7)           # a[i] = a[j]
    sw x28, 0(x29)          # a[j] = temp
    
skip_swap:
    addi x6, x6, 1          # j++
    beq x0, x0, inner_loop
end_inner:
    addi x5, x5, 1          # i++
    beq x0, x0, outer_loop
end_bubble:
    jalr x0, 0(x1)          # return