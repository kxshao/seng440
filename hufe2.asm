.LC28:
        .ascii  "file open failed\000"
.LC29:
        .ascii  "%s\000"
.LC0:
        .ascii  "1110\000"
.LC1:
        .ascii  "010010\000"
.LC2:
        .ascii  "111110\000"
.LC3:
        .ascii  "0010\000"
.LC4:
        .ascii  "100\000"
.LC5:
        .ascii  "00110\000"
.LC6:
        .ascii  "101110\000"
.LC7:
        .ascii  "1010\000"
.LC8:
        .ascii  "0110\000"
.LC9:
        .ascii  "11111110111\000"
.LC10:
        .ascii  "1111110\000"
.LC11:
        .ascii  "11110\000"
.LC12:
        .ascii  "00111\000"
.LC13:
        .ascii  "1100\000"
.LC14:
        .ascii  "1101\000"
.LC15:
        .ascii  "010011\000"
.LC16:
        .ascii  "1111111010\000"
.LC17:
        .ascii  "0101\000"
.LC18:
        .ascii  "0111\000"
.LC19:
        .ascii  "000\000"
.LC20:
        .ascii  "10110\000"
.LC21:
        .ascii  "11111111\000"
.LC22:
        .ascii  "01000\000"
.LC23:
        .ascii  "111111100\000"
.LC24:
        .ascii  "101111\000"
.LC25:
        .ascii  "11111110110\000"
.LC27:
        .word   .LC0
        .word   .LC1
        .word   .LC2
        .word   .LC3
        .word   .LC4
        .word   .LC5
        .word   .LC6
        .word   .LC7
        .word   .LC8
        .word   .LC9
        .word   .LC10
        .word   .LC11
        .word   .LC12
        .word   .LC13
        .word   .LC14
        .word   .LC15
        .word   .LC16
        .word   .LC17
        .word   .LC18
        .word   .LC19
        .word   .LC20
        .word   .LC21
        .word   .LC22
        .word   .LC23
        .word   .LC24
        .word   .LC25
main:
        stmfd   sp!, {fp, lr}
        add     fp, sp, #4
        sub     sp, sp, #120
        ldr     r2, .L11
        sub     r3, fp, #120
        mov     r1, r2
        mov     r2, #104
        mov     r0, r3
        bl      memcpy
        ldr     r3, .L11+4
        ldr     r3, [r3]
        str     r3, [fp, #-12]
        ldr     r3, [fp, #-12]
        cmp     r3, #0
        bne     .L2
        ldr     r0, .L11+8
        bl      puts
        mov     r3, #1
        b       .L8
.L2:
        mov     r3, #0
        str     r3, [fp, #-8]
        b       .L4
.L7:
        ldr     r3, [fp, #-16]
        cmp     r3, #64
        ble     .L5
        ldr     r3, [fp, #-16]
        cmp     r3, #90
        bgt     .L5
        ldr     r3, [fp, #-16]
        sub     r3, r3, #65
        mov     r3, r3, asl #2
        sub     r2, fp, #4
        add     r3, r2, r3
        ldr     r3, [r3, #-116]
        mov     r1, r3
        ldr     r0, .L11+12
        bl      printf
.L5:
        ldr     r3, [fp, #-8]
        add     r3, r3, #1
        str     r3, [fp, #-8]
        ldr     r3, [fp, #-8]
        ldr     r2, .L11+16
        cmp     r3, r2
        bgt     .L10
.L4:
        ldr     r0, [fp, #-12]
        bl      fgetc
        str     r0, [fp, #-16]
        ldr     r3, [fp, #-16]
        cmn     r3, #1
        bne     .L7
        b       .L9
.L10:
        mov     r0, r0    @ nop
.L9:
        ldr     r0, [fp, #-12]
        bl      fclose
        mov     r3, #0
.L8:
        mov     r0, r3
        sub     sp, fp, #4
        ldmfd   sp!, {fp, lr}
        bx      lr
.L11:
        .word   .LC27
        .word   stdin
        .word   .LC28
        .word   .LC29
        .word   999998