	.text
	.file	"tempr.c"
	.globl	main                            // -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #48
	.cfi_def_cfa_offset 48
	stp	x29, x30, [sp, #32]             // 16-byte Folded Spill
	add	x29, sp, #32
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	stur	wzr, [x29, #-4]
	stur	w0, [x29, #-8]
	str	x1, [sp, #16]
	ldur	w8, [x29, #-8]
	subs	w8, w8, #3
	b.eq	.LBB0_2
	b	.LBB0_1
.LBB0_1:
	ldr	x8, [sp, #16]
	ldr	x1, [x8]
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	bl	printf
	ldr	x8, [sp, #16]
	ldr	x1, [x8]
	adrp	x0, .L.str.1
	add	x0, x0, :lo12:.L.str.1
	bl	printf
	mov	w8, #1                          // =0x1
	stur	w8, [x29, #-4]
	b	.LBB0_8
.LBB0_2:
	ldr	x8, [sp, #16]
	ldr	x0, [x8, #8]
	bl	atof
	fcvt	s0, d0
	str	s0, [sp, #12]
	ldr	x8, [sp, #16]
	ldr	x8, [x8, #16]
	ldrb	w8, [x8]
	strb	w8, [sp, #11]
	ldrb	w8, [sp, #11]
	str	w8, [sp, #4]                    // 4-byte Folded Spill
	subs	w8, w8, #67
	b.eq	.LBB0_4
	b	.LBB0_3
.LBB0_3:
	ldr	w8, [sp, #4]                    // 4-byte Folded Reload
	subs	w8, w8, #70
	b.eq	.LBB0_5
	b	.LBB0_6
.LBB0_4:
	ldr	s0, [sp, #12]
	bl	celsius2fahrenheit
	fcvt	d0, s0
	adrp	x0, .L.str.2
	add	x0, x0, :lo12:.L.str.2
	bl	printf
	b	.LBB0_7
.LBB0_5:
	ldr	s0, [sp, #12]
	bl	fahrenheit2celsius
	fcvt	d0, s0
	adrp	x0, .L.str.3
	add	x0, x0, :lo12:.L.str.3
	bl	printf
	b	.LBB0_7
.LBB0_6:
	adrp	x0, .L.str.4
	add	x0, x0, :lo12:.L.str.4
	bl	printf
	mov	w8, #1                          // =0x1
	stur	w8, [x29, #-4]
	b	.LBB0_8
.LBB0_7:
	stur	wzr, [x29, #-4]
	b	.LBB0_8
.LBB0_8:
	ldur	w0, [x29, #-4]
	.cfi_def_cfa wsp, 48
	ldp	x29, x30, [sp, #32]             // 16-byte Folded Reload
	add	sp, sp, #48
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        // -- End function
	.globl	celsius2fahrenheit              // -- Begin function celsius2fahrenheit
	.p2align	2
	.type	celsius2fahrenheit,@function
celsius2fahrenheit:                     // @celsius2fahrenheit
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	s0, [sp, #12]
	ldr	s0, [sp, #12]
	fmov	s1, #9.00000000
	fmul	s0, s0, s1
	fmov	s1, #5.00000000
	fdiv	s0, s0, s1
	movi	v1.2s, #66, lsl #24
                                        // kill: def $s1 killed $s1 killed $d1
	fadd	s0, s0, s1
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end1:
	.size	celsius2fahrenheit, .Lfunc_end1-celsius2fahrenheit
	.cfi_endproc
                                        // -- End function
	.globl	fahrenheit2celsius              // -- Begin function fahrenheit2celsius
	.p2align	2
	.type	fahrenheit2celsius,@function
fahrenheit2celsius:                     // @fahrenheit2celsius
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	s0, [sp, #12]
	ldr	s0, [sp, #12]
	movi	v1.2s, #66, lsl #24
                                        // kill: def $s1 killed $s1 killed $d1
	fsub	s0, s0, s1
	fmov	s1, #5.00000000
	fmul	s0, s0, s1
	fmov	s1, #9.00000000
	fdiv	s0, s0, s1
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end2:
	.size	fahrenheit2celsius, .Lfunc_end2-fahrenheit2celsius
	.cfi_endproc
                                        // -- End function
	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Usage: %s <temperature> <unit>\n"
	.size	.L.str, 32

	.type	.L.str.1,@object                // @.str.1
.L.str.1:
	.asciz	"Example: %s 25 C\n"
	.size	.L.str.1, 18

	.type	.L.str.2,@object                // @.str.2
.L.str.2:
	.asciz	"%.2f\342\201\260F\n"
	.size	.L.str.2, 10

	.type	.L.str.3,@object                // @.str.3
.L.str.3:
	.asciz	"%.2f\342\201\260C\n"
	.size	.L.str.3, 10

	.type	.L.str.4,@object                // @.str.4
.L.str.4:
	.asciz	"Invalid unit. Please enter C or F.\n"
	.size	.L.str.4, 36

	.ident	"clang version 18.1.3"
	.section	".note.GNU-stack","",@progbits
