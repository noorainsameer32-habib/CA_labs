.text
.globl main
main:
    li x10, 0x100
    li x11, 0x200
    li x12, 0x300



    lb x5, 0(x10)
    lh x6, 0(x11)
    add x7,x5,x6
    sw x7, 0(x12)

    lb x5, 1(x10)
    lh x6, 2(x11)
    add x7, x5, x6
    sw x7, 4(x12)

    lb x5, 2(x10)
    lh x6, 4(x11)
    add x7,x5,x6
    sw x7, 8(x12)

    lb x5, 3(x10)
    lh x6, 6(x11)
    add x7, x5, x6
    sw x7, 12(x12)
end:
    j end
