cache6:
        .byte   84
        .byte   3
        .byte   84
        .byte   3
        .byte   84
        .byte   3
        .byte   84
        .byte   3
        .byte   84
        .byte   3
        .byte   84
        .byte   3
        .byte   84
        .byte   3
        .byte   84
        .byte   3
        .byte   68
        .byte   4
        .byte   68
        .byte   4
        .byte   68
        .byte   4
        .byte   68
        .byte   4
        .byte   70
        .byte   5
        .byte   70
        .byte   5
        .byte   77
        .byte   5
        .byte   77
        .byte   5
        .byte   87
        .byte   5
        .byte   87
        .byte   5
        .byte   66
        .byte   6
        .byte   80
        .byte   6
        .byte   82
        .byte   4
        .byte   82
        .byte   4
        .byte   82
        .byte   4
        .byte   82
        .byte   4
        .byte   73
        .byte   4
        .byte   73
        .byte   4
        .byte   73
        .byte   4
        .byte   73
        .byte   4
        .byte   83
        .byte   4
        .byte   83
        .byte   4
        .byte   83
        .byte   4
        .byte   83
        .byte   4
        .byte   69
        .byte   3
        .byte   69
        .byte   3
        .byte   69
        .byte   3
        .byte   69
        .byte   3
        .byte   69
        .byte   3
        .byte   69
        .byte   3
        .byte   69
        .byte   3
        .byte   69
        .byte   3
        .byte   72
        .byte   4
        .byte   72
        .byte   4
        .byte   72
        .byte   4
        .byte   72
        .byte   4
        .byte   85
        .byte   5
        .byte   85
        .byte   5
        .byte   71
        .byte   6
        .byte   89
        .byte   6
        .byte   78
        .byte   4
        .byte   78
        .byte   4
        .byte   78
        .byte   4
        .byte   78
        .byte   4
        .byte   79
        .byte   4
        .byte   79
        .byte   4
        .byte   79
        .byte   4
        .byte   79
        .byte   4
        .byte   65
        .byte   4
        .byte   65
        .byte   4
        .byte   65
        .byte   4
        .byte   65
        .byte   4
        .byte   76
        .byte   5
        .byte   76
        .byte   5
        .byte   0
        .byte   5
        .byte   0
        .byte   5
main:
        stmfd   sp!, {fp, lr}
        add     fp, sp, #4
        sub     sp, sp, #4980736
        sub     sp, sp, #19200
        sub     sp, sp, #112
        ldr     r3, .L21
        ldr     r3, [r3]
        str     r3, [fp, #-24]
        ldr     r3, [fp, #-24]
        cmp     r3, #0
        bne     .L2
        mov     r3, #1
        b       .L19
.L2:
        ldr     r3, .L21+4
        sub     r2, fp, #4
        add     r3, r2, r3
        str     r3, [fp, #-8]
        mov     r3, #0
        str     r3, [fp, #-12]
        b       .L4
.L6:
        ldr     r3, [fp, #-8]
        add     r2, r3, #1
        str     r2, [fp, #-8]
        ldr     r2, [fp, #-28]
        and     r2, r2, #255
        strb    r2, [r3]
        ldr     r3, [fp, #-12]
        add     r3, r3, #1
        str     r3, [fp, #-12]
        ldr     r3, [fp, #-12]
        ldr     r2, .L21+8
        cmp     r3, r2
        bgt     .L20
.L4:
        ldr     r0, [fp, #-24]
        bl      fgetc
        str     r0, [fp, #-28]
        ldr     r3, [fp, #-28]
        cmn     r3, #1
        bne     .L6
        b       .L5
.L20:
        mov     r0, r0    @ nop
.L5:
        ldr     r3, [fp, #-8]
        str     r3, [fp, #-32]
        ldr     r3, .L21+4
        sub     r2, fp, #4
        add     r3, r2, r3
        str     r3, [fp, #-8]
        mov     r3, #0
        str     r3, [fp, #-20]
        mov     r3, #0
        str     r3, [fp, #-36]
        b       .L7
.L18:
        ldr     r3, [fp, #-8]
        ldrb    r3, [r3]
        strb    r3, [fp, #-13]
        ldr     r3, [fp, #-8]
        ldrb    r3, [r3, #1]
        strb    r3, [fp, #-14]
        ldrb    r2, [fp, #-13]  @ zero_extendqisi2
        ldr     r3, [fp, #-20]
        mov     r3, r2, asl r3
        strb    r3, [fp, #-37]
        ldrb    r2, [fp, #-14]  @ zero_extendqisi2
        ldr     r3, [fp, #-20]
        rsb     r3, r3, #8
        mov     r3, r2, asr r3
        mov     r3, r3, asl #24
        mov     r2, r3, asr #24
        ldrsb   r3, [fp, #-37]
        orr     r3, r2, r3
        mov     r3, r3, asl #24
        mov     r3, r3, asr #24
        strb    r3, [fp, #-37]
        ldrb    r3, [fp, #-37]  @ zero_extendqisi2
        mov     r3, r3, lsr #2
        strb    r3, [fp, #-37]
        ldrb    r2, [fp, #-37]  @ zero_extendqisi2
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        ldr     r1, .L21+12
        sub     r3, r3, #2912
        sub     r3, r3, #12
        mov     r2, r2, asl #1
        add     r2, r1, r2
        ldrh    r2, [r2]        @ movhi
        strh    r2, [r3]        @ movhi
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        ldrb    r3, [r3, #-2924]        @ zero_extendqisi2
        cmp     r3, #0
        beq     .L8
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        ldrb    r3, [r3, #-2924]        @ zero_extendqisi2
        mov     r2, r3
        ldr     r3, .L21+16
        ldr     r3, [r3]
        mov     r1, r3
        mov     r0, r2
        bl      _IO_putc
        sub     r3, fp, #4980736
        sub     r3, r3, #4
        sub     r3, r3, #16384
        ldrb    r3, [r3, #-2923]        @ zero_extendqisi2
        mov     r2, r3
        ldr     r3, [fp, #-20]
        add     r3, r3, r2
        str     r3, [fp, #-20]
        b       .L9
.L8:
        ldr     r3, [fp, #-20]
        add     r3, r3, #5
        str     r3, [fp, #-20]
        ldr     r3, [fp, #-20]
        cmp     r3, #7
        bls     .L10
        ldr     r3, [fp, #-20]
        sub     r3, r3, #8
        str     r3, [fp, #-20]
        ldr     r3, [fp, #-8]
        add     r3, r3, #1
        str     r3, [fp, #-8]
        ldrb    r3, [fp, #-14]
        strb    r3, [fp, #-13]
        ldr     r3, [fp, #-8]
        ldrb    r3, [r3]
        strb    r3, [fp, #-14]
.L10:
        ldrb    r3, [fp, #-13]  @ zero_extendqisi2
        mov     r3, r3, asl #8
        mov     r3, r3, asl #16
        mov     r2, r3, asr #16
        ldrb    r3, [fp, #-14]  @ zero_extendqisi2
        mov     r3, r3, asl #16
        mov     r3, r3, asr #16
        orr     r3, r2, r3
        mov     r3, r3, asl #16
        mov     r3, r3, asr #16
        strh    r3, [fp, #-40]  @ movhi
        mov     r2, #32768
        ldr     r3, [fp, #-20]
        mov     r3, r2, lsr r3
        strh    r3, [fp, #-42]  @ movhi
        ldrh    r2, [fp, #-40]  @ movhi
        ldrh    r3, [fp, #-42]  @ movhi
        and     r3, r3, r2
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        cmp     r3, #0
        bne     .L11
        ldr     r3, .L21+16
        ldr     r3, [r3]
        mov     r1, r3
        mov     r0, #67
        bl      _IO_putc
        ldr     r3, [fp, #-20]
        add     r3, r3, #1
        str     r3, [fp, #-20]
        b       .L9
.L11:
        ldrh    r3, [fp, #-42]
        mov     r3, r3, lsr #1
        mov     r3, r3, asl #16
        mov     r2, r3, lsr #16
        ldrh    r3, [fp, #-40]  @ movhi
        and     r3, r3, r2
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        cmp     r3, #0
        bne     .L12
        ldr     r3, .L21+16
        ldr     r3, [r3]
        mov     r1, r3
        mov     r0, #75
        bl      _IO_putc
        ldr     r3, [fp, #-20]
        add     r3, r3, #2
        str     r3, [fp, #-20]
        b       .L9
.L12:
        ldrh    r3, [fp, #-42]
        mov     r3, r3, lsr #2
        mov     r3, r3, asl #16
        mov     r2, r3, lsr #16
        ldrh    r3, [fp, #-40]  @ movhi
        and     r3, r3, r2
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        cmp     r3, #0
        beq     .L13
        ldr     r3, .L21+16
        ldr     r3, [r3]
        mov     r1, r3
        mov     r0, #86
        bl      _IO_putc
        ldr     r3, [fp, #-20]
        add     r3, r3, #3
        str     r3, [fp, #-20]
        b       .L9
.L13:
        ldrh    r3, [fp, #-42]
        mov     r3, r3, lsr #3
        mov     r3, r3, asl #16
        mov     r2, r3, lsr #16
        ldrh    r3, [fp, #-40]  @ movhi
        and     r3, r3, r2
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        cmp     r3, #0
        bne     .L14
        ldr     r3, .L21+16
        ldr     r3, [r3]
        mov     r1, r3
        mov     r0, #88
        bl      _IO_putc
        ldr     r3, [fp, #-20]
        add     r3, r3, #4
        str     r3, [fp, #-20]
        b       .L9
.L14:
        ldrh    r3, [fp, #-42]
        mov     r3, r3, lsr #4
        mov     r3, r3, asl #16
        mov     r2, r3, lsr #16
        ldrh    r3, [fp, #-40]  @ movhi
        and     r3, r3, r2
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        cmp     r3, #0
        bne     .L15
        ldr     r3, .L21+16
        ldr     r3, [r3]
        mov     r1, r3
        mov     r0, #81
        bl      _IO_putc
        ldr     r3, [fp, #-20]
        add     r3, r3, #5
        str     r3, [fp, #-20]
        b       .L9
.L15:
        ldrh    r3, [fp, #-42]
        mov     r3, r3, lsr #5
        mov     r3, r3, asl #16
        mov     r2, r3, lsr #16
        ldrh    r3, [fp, #-40]  @ movhi
        and     r3, r3, r2
        mov     r3, r3, asl #16
        mov     r3, r3, lsr #16
        cmp     r3, #0
        beq     .L16
        ldr     r3, .L21+16
        ldr     r3, [r3]
        mov     r1, r3
        mov     r0, #74
        bl      _IO_putc
        ldr     r3, [fp, #-20]
        add     r3, r3, #6
        str     r3, [fp, #-20]
        b       .L9
.L16:
        ldr     r3, .L21+16
        ldr     r3, [r3]
        mov     r1, r3
        mov     r0, #90
        bl      _IO_putc
        ldr     r3, [fp, #-20]
        add     r3, r3, #6
        str     r3, [fp, #-20]
.L9:
        ldr     r3, [fp, #-20]
        cmp     r3, #7
        bls     .L7
        ldr     r3, [fp, #-20]
        sub     r3, r3, #8
        str     r3, [fp, #-20]
        ldr     r3, [fp, #-8]
        add     r3, r3, #1
        str     r3, [fp, #-8]
.L7:
        ldr     r3, [fp, #-32]
        sub     r2, r3, #1
        ldr     r3, [fp, #-8]
        cmp     r2, r3
        bhi     .L18
        mov     r3, #0
.L19:
        mov     r0, r3
        sub     sp, fp, #4
        ldmfd   sp!, {fp, lr}
        bx      lr
.L21:
        .word   stdin
        .word   -5000040
        .word   4999999
        .word   cache6
        .word   stdout