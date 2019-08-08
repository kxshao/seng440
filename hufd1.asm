join:
        stmfd   sp!, {fp, lr}
        add     fp, sp, #4
        sub     sp, sp, #16
        str     r0, [fp, #-16]
        str     r1, [fp, #-20]
        mov     r0, #20
        bl      malloc
        mov     r3, r0
        str     r3, [fp, #-8]
        ldr     r3, [fp, #-8]
        ldr     r2, [fp, #-16]
        str     r2, [r3]
        ldr     r3, [fp, #-8]
        ldr     r2, [fp, #-20]
        str     r2, [r3, #4]
        ldr     r3, [fp, #-8]
        mov     r2, #0
        str     r2, [r3, #8]
        ldr     r3, [fp, #-8]
        mov     r2, #0
        strb    r2, [r3, #12]
        ldr     r3, [fp, #-20]
        cmp     r3, #0
        bne     .L2
        ldr     r3, [fp, #-16]
        ldr     r2, [r3, #16]
        ldr     r3, [fp, #-8]
        str     r2, [r3, #16]
        b       .L3
.L2:
        ldr     r3, [fp, #-16]
        ldr     r2, [r3, #16]
        ldr     r3, [fp, #-20]
        ldr     r3, [r3, #16]
        add     r2, r2, r3
        ldr     r3, [fp, #-8]
        str     r2, [r3, #16]
.L3:
        ldr     r3, [fp, #-8]
        mov     r0, r3
        sub     sp, fp, #4
        ldmfd   sp!, {fp, lr}
        bx      lr
insert:
        str     fp, [sp, #-4]!
        add     fp, sp, #0
        sub     sp, sp, #28
        str     r0, [fp, #-16]
        str     r1, [fp, #-20]
        str     r2, [fp, #-24]
        str     r3, [fp, #-28]
        ldr     r3, [fp, #-24]
        add     r3, r3, #1
        str     r3, [fp, #-8]
        b       .L6
.L9:
        ldr     r3, [fp, #-16]
        ldr     r2, [r3, #16]
        ldr     r3, [fp, #-8]
        mov     r3, r3, asl #2
        ldr     r1, [fp, #-20]
        add     r3, r1, r3
        ldr     r3, [r3]
        ldr     r3, [r3, #16]
        cmp     r2, r3
        blt     .L10
        ldr     r3, [fp, #-8]
        sub     r3, r3, #-1073741823
        mov     r3, r3, asl #2
        ldr     r2, [fp, #-20]
        add     r3, r2, r3
        ldr     r2, [fp, #-8]
        mov     r2, r2, asl #2
        ldr     r1, [fp, #-20]
        add     r2, r1, r2
        ldr     r2, [r2]
        str     r2, [r3]
        ldr     r3, [fp, #-8]
        add     r3, r3, #1
        str     r3, [fp, #-8]
.L6:
        ldr     r2, [fp, #-8]
        ldr     r3, [fp, #-28]
        cmp     r2, r3
        blt     .L9
        b       .L8
.L10:
        mov     r0, r0    @ nop
.L8:
        ldr     r3, [fp, #-8]
        sub     r3, r3, #-1073741823
        mov     r3, r3, asl #2
        ldr     r2, [fp, #-20]
        add     r3, r2, r3
        ldr     r2, [fp, #-16]
        str     r2, [r3]
        mov     r0, r0    @ nop
        sub     sp, fp, #0
        ldr     fp, [sp], #4
        bx      lr
makeTree:
        stmfd   sp!, {r4, r5, r6, r7, r8, fp, lr}
        add     fp, sp, #24
        sub     sp, sp, #36
        str     r0, [fp, #-48]
        str     r1, [fp, #-52]
        str     r2, [fp, #-56]
        str     r3, [fp, #-60]
        mov     r3, sp
        mov     r8, r3
        ldr     r1, [fp, #-60]
        sub     r3, r1, #1
        str     r3, [fp, #-36]
        mov     r3, r1
        mov     r2, r3
        mov     r3, #0
        mov     r7, r3, asl #5
        orr     r7, r7, r2, lsr #27
        mov     r6, r2, asl #5
        mov     r3, r1
        mov     r2, r3
        mov     r3, #0
        mov     r5, r3, asl #5
        orr     r5, r5, r2, lsr #27
        mov     r4, r2, asl #5
        mov     r3, r1
        mov     r3, r3, asl #2
        add     r3, r3, #3
        add     r3, r3, #7
        mov     r3, r3, lsr #3
        mov     r3, r3, asl #3
        sub     sp, sp, r3
        mov     r3, sp
        add     r3, r3, #3
        mov     r3, r3, lsr #2
        mov     r3, r3, asl #2
        str     r3, [fp, #-40]
        mov     r3, #0
        str     r3, [fp, #-32]
        b       .L12
.L13:
        mov     r0, #20
        bl      malloc
        mov     r3, r0
        mov     r1, r3
        ldr     r3, [fp, #-40]
        ldr     r2, [fp, #-32]
        str     r1, [r3, r2, asl #2]
        ldr     r3, [fp, #-40]
        ldr     r2, [fp, #-32]
        ldr     r3, [r3, r2, asl #2]
        mov     r2, #0
        str     r2, [r3]
        ldr     r3, [fp, #-40]
        ldr     r2, [fp, #-32]
        ldr     r3, [r3, r2, asl #2]
        mov     r2, #0
        str     r2, [r3, #4]
        ldr     r3, [fp, #-40]
        ldr     r2, [fp, #-32]
        ldr     r3, [r3, r2, asl #2]
        mov     r2, #0
        str     r2, [r3, #8]
        ldr     r3, [fp, #-40]
        ldr     r2, [fp, #-32]
        ldr     r3, [r3, r2, asl #2]
        ldr     r2, [fp, #-32]
        ldr     r1, [fp, #-52]
        add     r2, r1, r2
        ldrb    r2, [r2]        @ zero_extendqisi2
        strb    r2, [r3, #12]
        ldr     r3, [fp, #-40]
        ldr     r2, [fp, #-32]
        ldr     r3, [r3, r2, asl #2]
        ldr     r2, [fp, #-32]
        mov     r2, r2, asl #2
        ldr     r1, [fp, #-56]
        add     r2, r1, r2
        ldr     r2, [r2]
        str     r2, [r3, #16]
        ldr     r3, [fp, #-32]
        add     r3, r3, #1
        str     r3, [fp, #-32]
.L12:
        ldr     r2, [fp, #-32]
        ldr     r3, [fp, #-60]
        cmp     r2, r3
        blt     .L13
        ldr     r3, [fp, #-60]
        cmp     r3, #1
        bne     .L14
        ldr     r3, [fp, #-40]
        ldr     r3, [r3]
        mov     r1, #0
        mov     r0, r3
        bl      join
        mov     r2, r0
        ldr     r3, [fp, #-48]
        str     r2, [r3]
        mov     r3, #0
        b       .L15
.L14:
        mov     r3, #1
        str     r3, [fp, #-32]
        b       .L16
.L17:
        ldr     r3, [fp, #-32]
        sub     r2, r3, #1
        ldr     r3, [fp, #-40]
        ldr     r0, [r3, r2, asl #2]
        ldr     r3, [fp, #-40]
        ldr     r2, [fp, #-32]
        ldr     r3, [r3, r2, asl #2]
        mov     r1, r3
        bl      join
        str     r0, [fp, #-44]
        ldr     r1, [fp, #-40]
        ldr     r3, [fp, #-60]
        ldr     r2, [fp, #-32]
        ldr     r0, [fp, #-44]
        bl      insert
        ldr     r3, [fp, #-32]
        add     r3, r3, #1
        str     r3, [fp, #-32]
.L16:
        ldr     r2, [fp, #-32]
        ldr     r3, [fp, #-60]
        cmp     r2, r3
        blt     .L17
        ldr     r3, [fp, #-60]
        sub     r2, r3, #1
        ldr     r3, [fp, #-40]
        ldr     r2, [r3, r2, asl #2]
        ldr     r3, [fp, #-48]
        str     r2, [r3]
        mov     r3, #1
.L15:
        mov     sp, r8
        cmp     r3, #1
        sub     sp, fp, #24
        ldmfd   sp!, {r4, r5, r6, r7, r8, fp, lr}
        bx      lr
.LC2:
        .ascii  "Printing tree: (total weight %d)\012\000"
.LC3:
        .ascii  "Leaf,\"%c\",%s,%d\012\000"
.LC4:
        .ascii  "Intermediate,%s,%d\012\000"
printTree:
        stmfd   sp!, {r4, r5, r6, r7, r8, fp, lr}
        add     fp, sp, #24
        sub     sp, sp, #28
        str     r0, [fp, #-48]
        str     r1, [fp, #-52]
        mov     r3, sp
        mov     r8, r3
        ldr     r3, [fp, #-48]
        cmp     r3, #0
        bne     .L21
        mov     r3, #0
        b       .L22
.L21:
        ldr     r3, [fp, #-52]
        ldrb    r3, [r3]        @ zero_extendqisi2
        cmp     r3, #0
        bne     .L23
        ldr     r3, [fp, #-48]
        ldr     r3, [r3, #16]
        mov     r1, r3
        ldr     r0, .L28
        bl      printf
        b       .L24
.L23:
        ldr     r3, [fp, #-48]
        ldrb    r3, [r3, #12]   @ zero_extendqisi2
        cmp     r3, #0
        beq     .L25
        ldr     r3, [fp, #-48]
        ldrb    r3, [r3, #12]   @ zero_extendqisi2
        mov     r1, r3
        ldr     r3, [fp, #-48]
        ldr     r3, [r3, #16]
        ldr     r2, [fp, #-52]
        ldr     r0, .L28+4
        bl      printf
        b       .L24
.L25:
        ldr     r3, [fp, #-48]
        ldr     r3, [r3, #16]
        mov     r2, r3
        ldr     r1, [fp, #-52]
        ldr     r0, .L28+8
        bl      printf
.L24:
        ldr     r0, [fp, #-52]
        bl      strlen
        mov     r3, r0
        str     r3, [fp, #-32]
        ldr     r3, [fp, #-32]
        add     r1, r3, #2
        sub     r3, r1, #1
        str     r3, [fp, #-36]
        mov     r3, r1
        mov     r2, r3
        mov     r3, #0
        mov     r7, r3, asl #3
        orr     r7, r7, r2, lsr #29
        mov     r6, r2, asl #3
        mov     r3, r1
        mov     r2, r3
        mov     r3, #0
        mov     r5, r3, asl #3
        orr     r5, r5, r2, lsr #29
        mov     r4, r2, asl #3
        mov     r3, r1
        add     r3, r3, #7
        mov     r3, r3, lsr #3
        mov     r3, r3, asl #3
        sub     sp, sp, r3
        mov     r3, sp
        add     r3, r3, #0
        str     r3, [fp, #-40]
        ldr     r3, [fp, #-40]
        ldr     r1, [fp, #-52]
        mov     r0, r3
        bl      strcpy
        ldr     r2, [fp, #-40]
        ldr     r3, [fp, #-32]
        add     r3, r2, r3
        mov     r2, #48
        strb    r2, [r3]
        ldr     r3, [fp, #-32]
        add     r3, r3, #1
        ldr     r2, [fp, #-40]
        mov     r1, #0
        strb    r1, [r2, r3]
        ldr     r3, [fp, #-48]
        ldr     r3, [r3]
        ldr     r2, [fp, #-40]
        mov     r1, r2
        mov     r0, r3
        bl      printTree
        ldr     r2, [fp, #-40]
        ldr     r3, [fp, #-32]
        add     r3, r2, r3
        mov     r2, #49
        strb    r2, [r3]
        ldr     r3, [fp, #-48]
        ldr     r3, [r3, #4]
        ldr     r2, [fp, #-40]
        mov     r1, r2
        mov     r0, r3
        bl      printTree
        mov     r3, #1
.L22:
        mov     sp, r8
        cmp     r3, #1
        sub     sp, fp, #24
        ldmfd   sp!, {r4, r5, r6, r7, r8, fp, lr}
        bx      lr
.L28:
        .word   .LC2
        .word   .LC3
        .word   .LC4
makeLookupTable:
        stmfd   sp!, {r4, r5, r6, r7, r8, r9, fp, lr}
        add     fp, sp, #28
        sub     sp, sp, #32
        str     r0, [fp, #-48]
        str     r1, [fp, #-52]
        str     r2, [fp, #-56]
        mov     r3, sp
        mov     r9, r3
        ldr     r3, [fp, #-48]
        cmp     r3, #0
        bne     .L31
        mov     r3, #0
        b       .L32
.L31:
        ldr     r3, [fp, #-52]
        ldrb    r3, [r3]        @ zero_extendqisi2
        cmp     r3, #0
        beq     .L33
        ldr     r3, [fp, #-48]
        ldrb    r3, [r3, #12]   @ zero_extendqisi2
        cmp     r3, #0
        beq     .L33
        ldr     r3, [fp, #-48]
        ldrb    r3, [r3, #12]   @ zero_extendqisi2
        mov     r3, r3, asl #2
        ldr     r2, [fp, #-56]
        add     r8, r2, r3
        ldr     r0, [fp, #-52]
        bl      strlen
        mov     r3, r0
        add     r3, r3, #1
        mov     r0, r3
        bl      malloc
        mov     r3, r0
        str     r3, [r8]
        ldr     r3, [fp, #-48]
        ldrb    r3, [r3, #12]   @ zero_extendqisi2
        mov     r3, r3, asl #2
        ldr     r2, [fp, #-56]
        add     r3, r2, r3
        ldr     r3, [r3]
        ldr     r1, [fp, #-52]
        mov     r0, r3
        bl      strcpy
.L33:
        ldr     r0, [fp, #-52]
        bl      strlen
        mov     r3, r0
        str     r3, [fp, #-32]
        ldr     r3, [fp, #-32]
        add     r1, r3, #2
        sub     r3, r1, #1
        str     r3, [fp, #-36]
        mov     r3, r1
        mov     r2, r3
        mov     r3, #0
        mov     r7, r3, asl #3
        orr     r7, r7, r2, lsr #29
        mov     r6, r2, asl #3
        mov     r3, r1
        mov     r2, r3
        mov     r3, #0
        mov     r5, r3, asl #3
        orr     r5, r5, r2, lsr #29
        mov     r4, r2, asl #3
        mov     r3, r1
        add     r3, r3, #7
        mov     r3, r3, lsr #3
        mov     r3, r3, asl #3
        sub     sp, sp, r3
        mov     r3, sp
        add     r3, r3, #0
        str     r3, [fp, #-40]
        ldr     r3, [fp, #-40]
        ldr     r1, [fp, #-52]
        mov     r0, r3
        bl      strcpy
        ldr     r2, [fp, #-40]
        ldr     r3, [fp, #-32]
        add     r3, r2, r3
        mov     r2, #48
        strb    r2, [r3]
        ldr     r3, [fp, #-32]
        add     r3, r3, #1
        ldr     r2, [fp, #-40]
        mov     r1, #0
        strb    r1, [r2, r3]
        ldr     r3, [fp, #-48]
        ldr     r3, [r3]
        ldr     r1, [fp, #-40]
        ldr     r2, [fp, #-56]
        mov     r0, r3
        bl      makeLookupTable
        ldr     r2, [fp, #-40]
        ldr     r3, [fp, #-32]
        add     r3, r2, r3
        mov     r2, #49
        strb    r2, [r3]
        ldr     r3, [fp, #-48]
        ldr     r3, [r3, #4]
        ldr     r1, [fp, #-40]
        ldr     r2, [fp, #-56]
        mov     r0, r3
        bl      makeLookupTable
        mov     r3, #1
.L32:
        mov     sp, r9
        cmp     r3, #1
        sub     sp, fp, #28
        ldmfd   sp!, {r4, r5, r6, r7, r8, r9, fp, lr}
        bx      lr
.LC5:
        .ascii  "file open failed\000"
.LC0:
        .byte   90
        .byte   74
        .byte   81
        .byte   88
        .byte   86
        .byte   75
        .byte   66
        .byte   80
        .byte   71
        .byte   89
        .byte   67
        .byte   70
        .byte   77
        .byte   87
        .byte   85
        .byte   76
        .byte   68
        .byte   82
        .byte   73
        .byte   83
        .byte   72
        .byte   78
        .byte   79
        .byte   65
        .byte   84
        .byte   69
.LC1:
        .word   280
        .word   492
        .word   545
        .word   813
        .word   5635
        .word   6305
        .word   8838
        .word   9183
        .word   12647
        .word   12806
        .word   13646
        .word   14213
        .word   17246
        .word   17415
        .word   18492
        .word   26101
        .word   28679
        .word   36136
        .word   38381
        .word   39632
        .word   42403
        .word   44551
        .word   51607
        .word   52583
        .word   58279
        .word   81286
main:
        stmfd   sp!, {fp, lr}
        add     fp, sp, #4
        sub     sp, sp, #4980736
        sub     sp, sp, #19200
        sub     sp, sp, #232
        ldr     r3, .L49
        ldr     r3, [r3]
        str     r3, [fp, #-24]
        ldr     r3, [fp, #-24]
        cmp     r3, #0
        bne     .L37
        ldr     r0, .L49+4
        bl      puts
        mov     r3, #1
        b       .L47
.L37:
        mov     r3, #26
        str     r3, [fp, #-28]
        ldr     r2, .L49+8
        sub     r3, fp, #60
        mov     r1, r2
        mov     r2, #26
        mov     r0, r3
        bl      memcpy
        ldr     r2, .L49+12
        sub     r3, fp, #164
        mov     r1, r2
        mov     r2, #104
        mov     r0, r3
        bl      memcpy
        ldr     r3, .L49+16
        sub     r2, fp, #4
        add     r3, r2, r3
        str     r3, [fp, #-8]
        mov     r3, #0
        str     r3, [fp, #-12]
        b       .L39
.L41:
        ldr     r3, [fp, #-8]
        add     r2, r3, #1
        str     r2, [fp, #-8]
        ldr     r2, [fp, #-32]
        and     r2, r2, #255
        strb    r2, [r3]
        ldr     r3, [fp, #-12]
        add     r3, r3, #1
        str     r3, [fp, #-12]
        ldr     r3, [fp, #-12]
        ldr     r2, .L49+20
        cmp     r3, r2
        bgt     .L48
.L39:
        ldr     r0, [fp, #-24]
        bl      fgetc
        str     r0, [fp, #-32]
        ldr     r3, [fp, #-32]
        cmn     r3, #1
        bne     .L41
        b       .L40
.L48:
        mov     r0, r0    @ nop
.L40:
        sub     r2, fp, #164
        sub     r1, fp, #60
        ldr     r0, .L49+24
        sub     r3, fp, #4
        add     r0, r3, r0
        ldr     r3, [fp, #-28]
        bl      makeTree
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        ldr     r3, [r3, #-3044]
        str     r3, [fp, #-16]
        mov     r3, #0
        str     r3, [fp, #-20]
        b       .L42
.L46:
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        mov     r2, r3
        ldr     r3, [fp, #-20]
        add     r3, r2, r3
        sub     r3, r3, #3040
        ldrb    r3, [r3]
        strb    r3, [fp, #-33]
        ldrb    r3, [fp, #-33]  @ zero_extendqisi2
        cmp     r3, #48
        bne     .L43
        ldr     r3, [fp, #-16]
        ldr     r3, [r3]
        str     r3, [fp, #-16]
        ldr     r3, [fp, #-16]
        ldrb    r3, [r3, #12]   @ zero_extendqisi2
        cmp     r3, #0
        beq     .L45
        ldr     r3, [fp, #-16]
        ldrb    r3, [r3, #12]   @ zero_extendqisi2
        mov     r2, r3
        ldr     r3, .L49+28
        ldr     r3, [r3]
        mov     r1, r3
        mov     r0, r2
        bl      _IO_putc
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        ldr     r3, [r3, #-3044]
        str     r3, [fp, #-16]
        b       .L45
.L43:
        ldr     r3, [fp, #-16]
        ldr     r3, [r3, #4]
        str     r3, [fp, #-16]
        ldr     r3, [fp, #-16]
        ldrb    r3, [r3, #12]   @ zero_extendqisi2
        cmp     r3, #0
        beq     .L45
        ldr     r3, [fp, #-16]
        ldrb    r3, [r3, #12]   @ zero_extendqisi2
        mov     r2, r3
        ldr     r3, .L49+28
        ldr     r3, [r3]
        mov     r1, r3
        mov     r0, r2
        bl      _IO_putc
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        ldr     r3, [r3, #-3044]
        str     r3, [fp, #-16]
.L45:
        ldr     r3, [fp, #-20]
        add     r3, r3, #1
        str     r3, [fp, #-20]
.L42:
        ldr     r2, [fp, #-20]
        ldr     r3, [fp, #-12]
        cmp     r2, r3
        blt     .L46
        mov     r3, #0
.L47:
        mov     r0, r3
        sub     sp, fp, #4
        ldmfd   sp!, {fp, lr}
        bx      lr
.L49:
        .word   stdin
        .word   .LC5
        .word   .LC0
        .word   .LC1
        .word   -5000160
        .word   4999998
        .word   -5000164
        .word   stdout