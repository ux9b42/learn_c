	.text
	.file	"declare.c"
	.globl	main                            // -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #80
	.cfi_def_cfa_offset 80
	stp	x29, x30, [sp, #64]             // 16-byte Folded Spill
	add	x29, sp, #64
	.cfi_def_cfa w29, 16
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	mov	w8, wzr
	str	w8, [sp, #16]                   // 4-byte Folded Spill
	stur	wzr, [x29, #-4]
	add	x0, sp, #23
	str	x0, [sp, #8]                    // 8-byte Folded Spill
	mov	x2, #37                         // =0x25
	adrp	x1, .L__const.main.str
	add	x1, x1, :lo12:.L__const.main.str
	bl	memcpy
	ldr	x1, [sp, #8]                    // 8-byte Folded Reload
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	bl	printf
	ldr	w0, [sp, #16]                   // 4-byte Folded Reload
	.cfi_def_cfa wsp, 80
	ldp	x29, x30, [sp, #64]             // 16-byte Folded Reload
	add	sp, sp, #80
	.cfi_def_cfa_offset 0
	.cfi_restore w30
	.cfi_restore w29
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        // -- End function
	.type	.L__const.main.str,@object      // @__const.main.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L__const.main.str:
	.asciz	"A Brown Fox Jumps Over The Lazy Dog."
	.size	.L__const.main.str, 37

	.type	.L.str,@object                  // @.str
.L.str:
	.asciz	"%s\n"
	.size	.L.str, 4

	.ident	"clang version 18.1.4"
	.section	".note.GNU-stack","",@progbits
