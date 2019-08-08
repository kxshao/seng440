cache6:
        .byte   84
        .word   3
        .byte   84
        .word   3
        .byte   84
        .word   3
        .byte   84
        .word   3
        .byte   84
        .word   3
        .byte   84
        .word   3
        .byte   84
        .word   3
        .byte   84
        .word   3
        .byte   68
        .word   4
        .byte   68
        .word   4
        .byte   68
        .word   4
        .byte   68
        .word   4
        .byte   70
        .word   5
        .byte   70
        .word   5
        .byte   77
        .word   5
        .byte   77
        .word   5
        .byte   87
        .word   5
        .byte   87
        .word   5
        .byte   66
        .word   6
        .byte   80
        .word   6
        .byte   82
        .word   4
        .byte   82
        .word   4
        .byte   82
        .word   4
        .byte   82
        .word   4
        .byte   73
        .word   4
        .byte   73
        .word   4
        .byte   73
        .word   4
        .byte   73
        .word   4
        .byte   83
        .word   4
        .byte   83
        .word   4
        .byte   83
        .word   4
        .byte   83
        .word   4
        .byte   69
        .word   3
        .byte   69
        .word   3
        .byte   69
        .word   3
        .byte   69
        .word   3
        .byte   69
        .word   3
        .byte   69
        .word   3
        .byte   69
        .word   3
        .byte   69
        .word   3
        .byte   72
        .word   4
        .byte   72
        .word   4
        .byte   72
        .word   4
        .byte   72
        .word   4
        .byte   85
        .word   5
        .byte   85
        .word   5
        .byte   71
        .word   6
        .byte   89
        .word   6
        .byte   78
        .word   4
        .byte   78
        .word   4
        .byte   78
        .word   4
        .byte   78
        .word   4
        .byte   79
        .word   4
        .byte   79
        .word   4
        .byte   79
        .word   4
        .byte   79
        .word   4
        .byte   65
        .word   4
        .byte   65
        .word   4
        .byte   65
        .word   4
        .byte   65
        .word   4
        .byte   76
        .word   5
        .byte   76
        .word   5
        .byte   0
        .word   5
main:
        stmfd   sp!, {fp, lr}
        add     fp, sp, #4
        sub     sp, sp, #4980736
        sub     sp, sp, #19200
        sub     sp, sp, #88
        ldr     r3, .L20
        ldr     r3, [r3]
        str     r3, [fp, #-20]
        ldr     r3, [fp, #-20]
        cmp     r3, #0
        bne     .L2
        mov     r3, #1
        b       .L18
.L2:
        ldr     r3, .L20+4
        sub     r2, fp, #4
        add     r3, r2, r3
        str     r3, [fp, #-8]
        mov     r3, #0
        str     r3, [fp, #-12]
.L6:
        ldr     r0, [fp, #-20]
        bl      fgetc
        mov     r3, r0
        str     r3, [fp, #-24]
        ldr     r3, [fp, #-24]
        cmn     r3, #1
        movne   r3, #1
        moveq   r3, #0
        and     r3, r3, #255
        cmp     r3, #0
        beq     .L4
        ldr     r3, [fp, #-8]
        add     r2, r3, #1
        str     r2, [fp, #-8]
        ldr     r2, [fp, #-24]
        and     r2, r2, #255
        sub     r2, r2, #48
        and     r2, r2, #255
        strb    r2, [r3]
        ldr     r3, [fp, #-12]
        add     r3, r3, #1
        str     r3, [fp, #-12]
        ldr     r3, [fp, #-12]
        ldr     r2, .L20+8
        cmp     r3, r2
        movgt   r3, #1
        movle   r3, #0
        and     r3, r3, #255
        cmp     r3, #0
        bne     .L19
        b       .L6
.L19:
        mov     r0, r0    @ nop
.L4:
        mov     r3, #0
        str     r3, [fp, #-16]
.L17:
        ldr     r3, [fp, #-12]
        sub     r2, r3, #11
        ldr     r3, [fp, #-16]
        cmp     r2, r3
        ble     .L7
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        mov     r2, r3
        ldr     r3, [fp, #-16]
        add     r3, r2, r3
        sub     r3, r3, #2896
        sub     r3, r3, #8
        ldrb    r3, [r3]
        strb    r3, [fp, #-25]
        ldrb    r3, [fp, #-25]  @ zero_extendqisi2
        cmp     r3, #1
        bls     .L8
        mov     r3, #1
        b       .L18
.L8:
        ldrb    r3, [fp, #-25]
        mov     r3, r3, asl #1
        strb    r3, [fp, #-25]
        ldr     r3, [fp, #-16]
        add     r2, r3, #1
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        add     r3, r3, r2
        ldrb    r2, [r3, #-2904]        @ zero_extendqisi2
        ldrb    r3, [fp, #-25]
        orr     r3, r2, r3
        strb    r3, [fp, #-25]
        ldrb    r3, [fp, #-25]
        mov     r3, r3, asl #1
        strb    r3, [fp, #-25]
        ldr     r3, [fp, #-16]
        add     r2, r3, #2
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        add     r3, r3, r2
        ldrb    r2, [r3, #-2904]        @ zero_extendqisi2
        ldrb    r3, [fp, #-25]
        orr     r3, r2, r3
        strb    r3, [fp, #-25]
        ldrb    r3, [fp, #-25]
        mov     r3, r3, asl #1
        strb    r3, [fp, #-25]
        ldr     r3, [fp, #-16]
        add     r2, r3, #3
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        add     r3, r3, r2
        ldrb    r2, [r3, #-2904]        @ zero_extendqisi2
        ldrb    r3, [fp, #-25]
        orr     r3, r2, r3
        strb    r3, [fp, #-25]
        ldrb    r3, [fp, #-25]
        mov     r3, r3, asl #1
        strb    r3, [fp, #-25]
        ldr     r3, [fp, #-16]
        add     r2, r3, #4
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        add     r3, r3, r2
        ldrb    r2, [r3, #-2904]        @ zero_extendqisi2
        ldrb    r3, [fp, #-25]
        orr     r3, r2, r3
        strb    r3, [fp, #-25]
        ldrb    r3, [fp, #-25]
        mov     r3, r3, asl #1
        strb    r3, [fp, #-25]
        ldr     r3, [fp, #-16]
        add     r2, r3, #5
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        add     r3, r3, r2
        ldrb    r2, [r3, #-2904]        @ zero_extendqisi2
        ldrb    r3, [fp, #-25]
        orr     r3, r2, r3
        strb    r3, [fp, #-25]
        ldrb    r3, [fp, #-25]  @ zero_extendqisi2
        ldr     r2, .L20+12
        ldrb    r3, [r2, r3, asl #3]    @ zero_extendqisi2
        cmp     r3, #0
        beq     .L9
        ldrb    r3, [fp, #-25]  @ zero_extendqisi2
        ldr     r2, .L20+12
        ldrb    r3, [r2, r3, asl #3]    @ zero_extendqisi2
        mov     r2, r3
        ldr     r3, .L20+16
        ldr     r3, [r3]
        mov     r1, r3
        mov     r0, r2
        bl      _IO_putc
        ldrb    r3, [fp, #-25]  @ zero_extendqisi2
        ldr     r2, .L20+12
        mov     r3, r3, asl #3
        add     r3, r2, r3
        ldr     r3, [r3, #4]
        ldr     r2, [fp, #-16]
        add     r3, r2, r3
        str     r3, [fp, #-16]
        b       .L17
.L9:
        ldr     r3, [fp, #-16]
        add     r2, r3, #5
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        add     r3, r3, r2
        ldrb    r3, [r3, #-2904]        @ zero_extendqisi2
        cmp     r3, #0
        bne     .L11
        ldr     r3, .L20+16
        ldr     r3, [r3]
        mov     r1, r3
        mov     r0, #67
        bl      _IO_putc
        ldr     r3, [fp, #-16]
        add     r3, r3, #6
        str     r3, [fp, #-16]
        b       .L17
.L11:
        ldr     r3, [fp, #-16]
        add     r2, r3, #6
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        add     r3, r3, r2
        ldrb    r3, [r3, #-2904]        @ zero_extendqisi2
        cmp     r3, #0
        bne     .L12
        ldr     r3, .L20+16
        ldr     r3, [r3]
        mov     r1, r3
        mov     r0, #75
        bl      _IO_putc
        ldr     r3, [fp, #-16]
        add     r3, r3, #7
        str     r3, [fp, #-16]
        b       .L17
.L12:
        ldr     r3, [fp, #-16]
        add     r2, r3, #7
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        add     r3, r3, r2
        ldrb    r3, [r3, #-2904]        @ zero_extendqisi2
        cmp     r3, #0
        beq     .L13
        ldr     r3, .L20+16
        ldr     r3, [r3]
        mov     r1, r3
        mov     r0, #86
        bl      _IO_putc
        ldr     r3, [fp, #-16]
        add     r3, r3, #8
        str     r3, [fp, #-16]
        b       .L17
.L13:
        ldr     r3, [fp, #-16]
        add     r2, r3, #8
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        add     r3, r3, r2
        ldrb    r3, [r3, #-2904]        @ zero_extendqisi2
        cmp     r3, #0
        bne     .L14
        ldr     r3, .L20+16
        ldr     r3, [r3]
        mov     r1, r3
        mov     r0, #88
        bl      _IO_putc
        ldr     r3, [fp, #-16]
        add     r3, r3, #9
        str     r3, [fp, #-16]
        b       .L17
.L14:
        ldr     r3, [fp, #-16]
        add     r2, r3, #9
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        add     r3, r3, r2
        ldrb    r3, [r3, #-2904]        @ zero_extendqisi2
        cmp     r3, #0
        bne     .L15
        ldr     r3, .L20+16
        ldr     r3, [r3]
        mov     r1, r3
        mov     r0, #81
        bl      _IO_putc
        ldr     r3, [fp, #-16]
        add     r3, r3, #10
        str     r3, [fp, #-16]
        b       .L17
.L15:
        ldr     r3, [fp, #-16]
        add     r2, r3, #10
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        add     r3, r3, r2
        ldrb    r3, [r3, #-2904]        @ zero_extendqisi2
        cmp     r3, #0
        beq     .L16
        ldr     r3, .L20+16
        ldr     r3, [r3]
        mov     r1, r3
        mov     r0, #74
        bl      _IO_putc
        ldr     r3, [fp, #-16]
        add     r3, r3, #11
        str     r3, [fp, #-16]
        b       .L17
.L16:
        ldr     r3, .L20+16
        ldr     r3, [r3]
        mov     r1, r3
        mov     r0, #90
        bl      _IO_putc
        ldr     r3, [fp, #-16]
        add     r3, r3, #11
        str     r3, [fp, #-16]
        b       .L17
.L7:
        mov     r3, #0
.L18:
        mov     r0, r3
        sub     sp, fp, #4
        ldmfd   sp!, {fp, lr}
        bx      lr
.L20:
        .word   stdin
        .word   -5000024
        .word   4999998
        .word   cache6
        .word   stdout