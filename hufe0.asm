charCount:
        str     fp, [sp, #-4]!
        add     fp, sp, #0
        sub     sp, sp, #28
        str     r0, [fp, #-16]
        str     r1, [fp, #-20]
        str     r2, [fp, #-24]
        ldr     r3, [fp, #-16]
        ldrb    r3, [r3]
        strb    r3, [fp, #-5]
        mov     r3, #0
        str     r3, [fp, #-12]
        b       .L2
.L5:
        ldrb    r3, [fp, #-5]   @ zero_extendqisi2
        cmp     r3, #31
        bls     .L3
        ldrb    r3, [fp, #-5]   @ zero_extendqisi2
        cmp     r3, #126
        bhi     .L3
        ldrb    r3, [fp, #-5]   @ zero_extendqisi2
        mov     r3, r3, asl #2
        ldr     r2, [fp, #-20]
        add     r3, r2, r3
        ldr     r2, [r3]
        add     r2, r2, #1
        str     r2, [r3]
        ldr     r3, [fp, #-12]
        add     r3, r3, #1
        str     r3, [fp, #-12]
.L3:
        ldr     r3, [fp, #-16]
        add     r3, r3, #1
        str     r3, [fp, #-16]
        ldr     r3, [fp, #-16]
        ldrb    r3, [r3]
        strb    r3, [fp, #-5]
        ldr     r3, [fp, #-24]
        sub     r3, r3, #1
        str     r3, [fp, #-24]
.L2:
        ldrb    r3, [fp, #-5]   @ zero_extendqisi2
        cmp     r3, #0
        beq     .L4
        ldr     r3, [fp, #-24]
        cmp     r3, #0
        bne     .L5
.L4:
        ldr     r3, [fp, #-12]
        mov     r0, r3
        sub     sp, fp, #0
        ldr     fp, [sp], #4
        bx      lr
sort:
        str     fp, [sp, #-4]!
        add     fp, sp, #0
        sub     sp, sp, #36
        str     r0, [fp, #-24]
        str     r1, [fp, #-28]
        str     r2, [fp, #-32]
        mov     r3, #1
        str     r3, [fp, #-8]
        b       .L8
.L12:
        ldr     r3, [fp, #-8]
        str     r3, [fp, #-12]
        b       .L9
.L11:
        ldr     r3, [fp, #-12]
        mov     r3, r3, asl #2
        ldr     r2, [fp, #-24]
        add     r3, r2, r3
        ldr     r3, [r3]
        str     r3, [fp, #-16]
        ldr     r3, [fp, #-12]
        mov     r3, r3, asl #2
        ldr     r2, [fp, #-24]
        add     r3, r2, r3
        ldr     r2, [fp, #-12]
        sub     r2, r2, #-1073741823
        mov     r2, r2, asl #2
        ldr     r1, [fp, #-24]
        add     r2, r1, r2
        ldr     r2, [r2]
        str     r2, [r3]
        ldr     r3, [fp, #-12]
        sub     r3, r3, #-1073741823
        mov     r3, r3, asl #2
        ldr     r2, [fp, #-24]
        add     r3, r2, r3
        ldr     r2, [fp, #-16]
        str     r2, [r3]
        ldr     r3, [fp, #-12]
        mov     r3, r3, asl #2
        ldr     r2, [fp, #-28]
        add     r3, r2, r3
        ldr     r3, [r3]
        str     r3, [fp, #-16]
        ldr     r3, [fp, #-12]
        mov     r3, r3, asl #2
        ldr     r2, [fp, #-28]
        add     r3, r2, r3
        ldr     r2, [fp, #-12]
        sub     r2, r2, #-1073741823
        mov     r2, r2, asl #2
        ldr     r1, [fp, #-28]
        add     r2, r1, r2
        ldr     r2, [r2]
        str     r2, [r3]
        ldr     r3, [fp, #-12]
        sub     r3, r3, #-1073741823
        mov     r3, r3, asl #2
        ldr     r2, [fp, #-28]
        add     r3, r2, r3
        ldr     r2, [fp, #-16]
        str     r2, [r3]
        ldr     r3, [fp, #-12]
        sub     r3, r3, #1
        str     r3, [fp, #-12]
.L9:
        ldr     r3, [fp, #-12]
        cmp     r3, #0
        ble     .L10
        ldr     r3, [fp, #-12]
        sub     r3, r3, #-1073741823
        mov     r3, r3, asl #2
        ldr     r2, [fp, #-28]
        add     r3, r2, r3
        ldr     r2, [r3]
        ldr     r3, [fp, #-12]
        mov     r3, r3, asl #2
        ldr     r1, [fp, #-28]
        add     r3, r1, r3
        ldr     r3, [r3]
        cmp     r2, r3
        bgt     .L11
.L10:
        ldr     r3, [fp, #-8]
        add     r3, r3, #1
        str     r3, [fp, #-8]
.L8:
        ldr     r2, [fp, #-8]
        ldr     r3, [fp, #-32]
        cmp     r2, r3
        blt     .L12
        mov     r0, r0    @ nop
        sub     sp, fp, #0
        ldr     fp, [sp], #4
        bx      lr
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
        bne     .L14
        ldr     r3, [fp, #-16]
        ldr     r2, [r3, #16]
        ldr     r3, [fp, #-8]
        str     r2, [r3, #16]
        b       .L15
.L14:
        ldr     r3, [fp, #-16]
        ldr     r2, [r3, #16]
        ldr     r3, [fp, #-20]
        ldr     r3, [r3, #16]
        add     r2, r2, r3
        ldr     r3, [fp, #-8]
        str     r2, [r3, #16]
.L15:
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
        b       .L18
.L21:
        ldr     r3, [fp, #-16]
        ldr     r2, [r3, #16]
        ldr     r3, [fp, #-8]
        mov     r3, r3, asl #2
        ldr     r1, [fp, #-20]
        add     r3, r1, r3
        ldr     r3, [r3]
        ldr     r3, [r3, #16]
        cmp     r2, r3
        blt     .L22
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
.L18:
        ldr     r2, [fp, #-8]
        ldr     r3, [fp, #-28]
        cmp     r2, r3
        blt     .L21
        b       .L20
.L22:
        mov     r0, r0    @ nop
.L20:
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
        sub     sp, sp, #44
        str     r0, [fp, #-56]
        str     r1, [fp, #-60]
        str     r2, [fp, #-64]
        str     r3, [fp, #-68]
        mov     r3, sp
        mov     r8, r3
        ldr     r1, [fp, #-68]
        sub     r3, r1, #1
        str     r3, [fp, #-40]
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
        str     r3, [fp, #-44]
        mov     r3, #0
        str     r3, [fp, #-32]
        b       .L24
.L25:
        mov     r0, #20
        bl      malloc
        mov     r3, r0
        mov     r1, r3
        ldr     r3, [fp, #-44]
        ldr     r2, [fp, #-32]
        str     r1, [r3, r2, asl #2]
        ldr     r3, [fp, #-44]
        ldr     r2, [fp, #-32]
        ldr     r3, [r3, r2, asl #2]
        mov     r2, #0
        str     r2, [r3]
        ldr     r3, [fp, #-44]
        ldr     r2, [fp, #-32]
        ldr     r3, [r3, r2, asl #2]
        mov     r2, #0
        str     r2, [r3, #4]
        ldr     r3, [fp, #-44]
        ldr     r2, [fp, #-32]
        ldr     r3, [r3, r2, asl #2]
        mov     r2, #0
        str     r2, [r3, #8]
        ldr     r3, [fp, #-44]
        ldr     r2, [fp, #-32]
        ldr     r3, [r3, r2, asl #2]
        ldr     r2, [fp, #-32]
        ldr     r1, [fp, #-60]
        add     r2, r1, r2
        ldrb    r2, [r2]        @ zero_extendqisi2
        strb    r2, [r3, #12]
        ldr     r3, [fp, #-44]
        ldr     r2, [fp, #-32]
        ldr     r3, [r3, r2, asl #2]
        ldr     r2, [fp, #-32]
        mov     r2, r2, asl #2
        ldr     r1, [fp, #-64]
        add     r2, r1, r2
        ldr     r2, [r2]
        str     r2, [r3, #16]
        ldr     r3, [fp, #-32]
        add     r3, r3, #1
        str     r3, [fp, #-32]
.L24:
        ldr     r2, [fp, #-32]
        ldr     r3, [fp, #-68]
        cmp     r2, r3
        blt     .L25
        ldr     r3, [fp, #-68]
        cmp     r3, #1
        bne     .L26
        ldr     r3, [fp, #-44]
        ldr     r3, [r3]
        mov     r1, #0
        mov     r0, r3
        bl      join
        mov     r2, r0
        ldr     r3, [fp, #-56]
        str     r2, [r3]
        mov     r3, #0
        b       .L27
.L26:
        mov     r3, #1
        str     r3, [fp, #-36]
        b       .L28
.L29:
        ldr     r3, [fp, #-36]
        sub     r2, r3, #1
        ldr     r3, [fp, #-44]
        ldr     r0, [r3, r2, asl #2]
        ldr     r3, [fp, #-44]
        ldr     r2, [fp, #-36]
        ldr     r3, [r3, r2, asl #2]
        mov     r1, r3
        bl      join
        str     r0, [fp, #-48]
        ldr     r1, [fp, #-44]
        ldr     r3, [fp, #-68]
        ldr     r2, [fp, #-36]
        ldr     r0, [fp, #-48]
        bl      insert
        ldr     r3, [fp, #-36]
        add     r3, r3, #1
        str     r3, [fp, #-36]
.L28:
        ldr     r2, [fp, #-36]
        ldr     r3, [fp, #-68]
        cmp     r2, r3
        blt     .L29
        ldr     r3, [fp, #-68]
        sub     r2, r3, #1
        ldr     r3, [fp, #-44]
        ldr     r2, [r3, r2, asl #2]
        ldr     r3, [fp, #-56]
        str     r2, [r3]
        mov     r3, #1
.L27:
        mov     sp, r8
        cmp     r3, #1
        sub     sp, fp, #24
        ldmfd   sp!, {r4, r5, r6, r7, r8, fp, lr}
        bx      lr
.LC0:
        .ascii  "Printing tree: (total weight %d)\012\000"
.LC1:
        .ascii  "Leaf,\"%c\",%s,%d\012\000"
.LC2:
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
        bne     .L33
        mov     r3, #0
        b       .L34
.L33:
        ldr     r3, [fp, #-52]
        ldrb    r3, [r3]        @ zero_extendqisi2
        cmp     r3, #0
        bne     .L35
        ldr     r3, [fp, #-48]
        ldr     r3, [r3, #16]
        mov     r1, r3
        ldr     r0, .L40
        bl      printf
        b       .L36
.L35:
        ldr     r3, [fp, #-48]
        ldrb    r3, [r3, #12]   @ zero_extendqisi2
        cmp     r3, #0
        beq     .L37
        ldr     r3, [fp, #-48]
        ldrb    r3, [r3, #12]   @ zero_extendqisi2
        mov     r1, r3
        ldr     r3, [fp, #-48]
        ldr     r3, [r3, #16]
        ldr     r2, [fp, #-52]
        ldr     r0, .L40+4
        bl      printf
        b       .L36
.L37:
        ldr     r3, [fp, #-48]
        ldr     r3, [r3, #16]
        mov     r2, r3
        ldr     r1, [fp, #-52]
        ldr     r0, .L40+8
        bl      printf
.L36:
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
.L34:
        mov     sp, r8
        cmp     r3, #1
        sub     sp, fp, #24
        ldmfd   sp!, {r4, r5, r6, r7, r8, fp, lr}
        bx      lr
.L40:
        .word   .LC0
        .word   .LC1
        .word   .LC2
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
        bne     .L43
        mov     r3, #0
        b       .L44
.L43:
        ldr     r3, [fp, #-52]
        ldrb    r3, [r3]        @ zero_extendqisi2
        cmp     r3, #0
        beq     .L45
        ldr     r3, [fp, #-48]
        ldrb    r3, [r3, #12]   @ zero_extendqisi2
        cmp     r3, #0
        beq     .L45
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
.L45:
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
.L44:
        mov     sp, r9
        cmp     r3, #1
        sub     sp, fp, #28
        ldmfd   sp!, {r4, r5, r6, r7, r8, r9, fp, lr}
        bx      lr
.LC3:
        .ascii  "file open failed\000"
.LC4:
        .ascii  "\000"
.LC5:
        .ascii  "%c\012\000"
.LC6:
        .ascii  "%c%d\012\000"
.LC7:
        .ascii  "%s\000"
main:
        stmfd   sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
        add     fp, sp, #32
        sub     sp, sp, #999424
        sub     sp, sp, #1920
        sub     sp, sp, #4
        ldr     r3, .L69
        ldr     r3, [r3]
        str     r3, [fp, #-64]
        ldr     r3, [fp, #-64]
        cmp     r3, #0
        bne     .L49
        ldr     r0, .L69+4
        bl      puts
        mov     r3, #1
        b       .L66
.L49:
        sub     r3, fp, #999424
        sub     r3, r3, #36
        sub     r3, r3, #632
        str     r3, [fp, #-40]
        mov     r3, #0
        str     r3, [fp, #-44]
        b       .L51
.L53:
        ldr     r3, [fp, #-40]
        add     r2, r3, #1
        str     r2, [fp, #-40]
        ldr     r2, [fp, #-68]
        and     r2, r2, #255
        strb    r2, [r3]
        ldr     r3, [fp, #-44]
        add     r3, r3, #1
        str     r3, [fp, #-44]
        ldr     r3, [fp, #-44]
        ldr     r2, .L69+8
        cmp     r3, r2
        bgt     .L67
.L51:
        ldr     r0, [fp, #-64]
        bl      fgetc
        str     r0, [fp, #-68]
        ldr     r3, [fp, #-68]
        cmn     r3, #1
        bne     .L53
        b       .L52
.L67:
        mov     r0, r0    @ nop
.L52:
        ldr     r3, [fp, #-40]
        mov     r2, #0
        strb    r2, [r3]
        ldr     r0, [fp, #-64]
        bl      fclose
        sub     r3, fp, #999424
        sub     r3, r3, #36
        sub     r3, r3, #1012
        mov     r2, #380
        mov     r1, #0
        mov     r0, r3
        bl      memset
        sub     r3, fp, #999424
        sub     r3, r3, #36
        sub     r3, r3, #1012
        sub     r3, r3, #128
        sub     r0, fp, #999424
        sub     r0, r0, #36
        sub     r0, r0, #632
        ldr     r2, [fp, #-44]
        mov     r1, r3
        bl      charCount
        str     r0, [fp, #-72]
        mov     r3, #0
        str     r3, [fp, #-48]
        b       .L54
.L55:
        ldr     r3, [fp, #-48]
        add     r2, r3, #32
        sub     r3, fp, #999424
        sub     r3, r3, #36
        mov     r1, r3
        ldr     r3, [fp, #-48]
        mov     r3, r3, asl #2
        add     r3, r1, r3
        str     r2, [r3, #-1392]
        ldr     r3, [fp, #-48]
        add     r3, r3, #1
        str     r3, [fp, #-48]
.L54:
        ldr     r3, [fp, #-48]
        cmp     r3, #94
        ble     .L55
        sub     r1, fp, #999424
        sub     r1, r1, #36
        sub     r1, r1, #1012
        sub     r3, fp, #999424
        sub     r3, r3, #36
        sub     r3, r3, #1392
        mov     r2, #95
        mov     r0, r3
        bl      sort
        mov     r3, #0
        str     r3, [fp, #-52]
        b       .L56
.L59:
        ldr     r3, [fp, #-52]
        rsb     r3, r3, #94
        sub     r2, fp, #999424
        sub     r2, r2, #36
        mov     r3, r3, asl #2
        add     r3, r2, r3
        ldr     r3, [r3, #-1012]
        cmp     r3, #0
        beq     .L68
        ldr     r3, [fp, #-52]
        add     r3, r3, #1
        str     r3, [fp, #-52]
.L56:
        ldr     r3, [fp, #-52]
        cmp     r3, #94
        ble     .L59
        b       .L58
.L68:
        mov     r0, r0    @ nop
.L58:
        ldr     r1, [fp, #-52]
        mov     r3, sp
        mov     r10, r3
        sub     r3, r1, #1
        str     r3, [fp, #-76]
        mov     r3, r1
        mov     r2, r3
        mov     r3, #0
        mov     r0, r3, asl #3
        sub     ip, fp, #999424
        sub     ip, ip, #1952
        str     r0, [ip]
        sub     r0, fp, #999424
        sub     r0, r0, #1952
        ldr     r0, [r0]
        orr     r0, r0, r2, lsr #29
        sub     ip, fp, #999424
        sub     ip, ip, #1952
        str     r0, [ip]
        mov     r3, r2, asl #3
        ldr     r2, .L69+12
        add     r2, fp, r2
        str     r3, [r2]
        mov     r3, r1
        mov     r2, r3
        mov     r3, #0
        mov     r9, r3, asl #3
        orr     r9, r9, r2, lsr #29
        mov     r8, r2, asl #3
        mov     r3, r1
        add     r3, r3, #7
        mov     r3, r3, lsr #3
        mov     r3, r3, asl #3
        sub     sp, sp, r3
        mov     r3, sp
        add     r3, r3, #0
        str     r3, [fp, #-80]
        ldr     r1, [fp, #-52]
        sub     r3, r1, #1
        str     r3, [fp, #-84]
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
        str     r3, [fp, #-88]
        mov     r3, #0
        str     r3, [fp, #-56]
        b       .L60
.L61:
        ldr     r3, [fp, #-52]
        rsb     r2, r3, #95
        ldr     r3, [fp, #-56]
        add     r3, r2, r3
        sub     r2, fp, #999424
        sub     r2, r2, #36
        mov     r3, r3, asl #2
        add     r3, r2, r3
        ldr     r3, [r3, #-1392]
        and     r1, r3, #255
        ldr     r2, [fp, #-80]
        ldr     r3, [fp, #-56]
        add     r3, r2, r3
        mov     r2, r1
        strb    r2, [r3]
        ldr     r3, [fp, #-52]
        rsb     r2, r3, #95
        ldr     r3, [fp, #-56]
        add     r3, r2, r3
        sub     r2, fp, #999424
        sub     r2, r2, #36
        mov     r3, r3, asl #2
        add     r3, r2, r3
        ldr     r1, [r3, #-1012]
        ldr     r3, [fp, #-88]
        ldr     r2, [fp, #-56]
        str     r1, [r3, r2, asl #2]
        ldr     r3, [fp, #-56]
        add     r3, r3, #1
        str     r3, [fp, #-56]
.L60:
        ldr     r2, [fp, #-56]
        ldr     r3, [fp, #-52]
        cmp     r2, r3
        blt     .L61
        ldr     r1, [fp, #-80]
        ldr     r2, [fp, #-88]
        ldr     r0, .L69+16
        sub     r3, fp, #36
        add     r0, r3, r0
        ldr     r3, [fp, #-52]
        bl      makeTree
        sub     r3, fp, #999424
        sub     r3, r3, #36
        sub     r3, r3, #1904
        sub     r3, r3, #4
        mov     r2, #512
        mov     r1, #0
        mov     r0, r3
        bl      memset
        sub     r3, fp, #999424
        sub     r3, r3, #36
        ldr     r0, [r3, #-1396]
        ldr     r3, .L69+20
        sub     r2, fp, #36
        add     r3, r2, r3
        mov     r2, r3
        ldr     r1, .L69+24
        bl      makeLookupTable
        ldr     r1, [fp, #-52]
        ldr     r0, .L69+28
        bl      printf
        mov     r3, #0
        str     r3, [fp, #-60]
        b       .L62
.L63:
        ldr     r2, [fp, #-80]
        ldr     r3, [fp, #-60]
        add     r3, r2, r3
        ldrb    r3, [r3]        @ zero_extendqisi2
        mov     r1, r3
        ldr     r3, [fp, #-88]
        ldr     r2, [fp, #-60]
        ldr     r3, [r3, r2, asl #2]
        mov     r2, r3
        ldr     r0, .L69+32
        bl      printf
        ldr     r3, [fp, #-60]
        add     r3, r3, #1
        str     r3, [fp, #-60]
.L62:
        ldr     r2, [fp, #-60]
        ldr     r3, [fp, #-52]
        cmp     r2, r3
        blt     .L63
        sub     r3, fp, #999424
        sub     r3, r3, #36
        sub     r3, r3, #632
        str     r3, [fp, #-40]
        b       .L64
.L65:
        ldrb    r3, [fp, #-89]  @ zero_extendqisi2
        cmp     r3, #31
        bls     .L64
        ldrb    r3, [fp, #-89]  @ zero_extendqisi2
        cmp     r3, #126
        bhi     .L64
        ldrb    r3, [fp, #-89]  @ zero_extendqisi2
        sub     r2, fp, #999424
        sub     r2, r2, #36
        mov     r3, r3, asl #2
        add     r3, r2, r3
        ldr     r3, [r3, #-1908]
        mov     r1, r3
        ldr     r0, .L69+36
        bl      printf
.L64:
        ldr     r3, [fp, #-40]
        add     r2, r3, #1
        str     r2, [fp, #-40]
        ldrb    r3, [r3]
        strb    r3, [fp, #-89]
        ldrb    r3, [fp, #-89]  @ zero_extendqisi2
        cmp     r3, #0
        bne     .L65
        mov     r3, #0
        mov     sp, r10
.L66:
        mov     r0, r3
        sub     sp, fp, #32
        ldmfd   sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
        bx      lr
.L69:
        .word   stdin
        .word   .LC3
        .word   999998
        .word   -1001380
        .word   -1000820
        .word   -1001332
        .word   .LC4
        .word   .LC5
        .word   .LC6
        .word   .LC7