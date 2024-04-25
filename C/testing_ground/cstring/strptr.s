	.text
	.file	"strptr.c"
	.globl	main
	.p2align	2
	.type	main,@function
main:
	.cfi_startproc

	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	mov	w0, wzr
	str	wzr, [sp, #12]
	adrp	x8, .L.str
	add	x8, x8, :lo12:.L.str
	str	x8, [sp]
	add	sp, sp, #16
	.cfi_def_cfa_offset 0
	ret
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc

	.type	.L.str,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Bakabaka"
	.size	.L.str, 9

	.ident	"clang version 18.1.4"
	.section	".note.GNU-stack","",@progbits
