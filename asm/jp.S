	.file	"main.c"
	.text
	.type	validate_open_and_close_ident, @function
validate_open_and_close_ident:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %edx
	movl	%esi, %eax
	movb	%dl, -4(%rbp)
	movb	%al, -8(%rbp)
	cmpb	$123, -4(%rbp)
	jne	.L2
	cmpb	$125, -8(%rbp)
	je	.L3
.L2:
	cmpb	$91, -4(%rbp)
	jne	.L4
	cmpb	$93, -8(%rbp)
	jne	.L4
.L3:
	movl	$1, %eax
	jmp	.L6
.L4:
	movl	$0, %eax
.L6:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	validate_open_and_close_ident, .-validate_open_and_close_ident
	.section	.rodata
	.align 8
.LC0:
	.string	"Erro while trying to allocate string. Please verify the length"
	.align 8
.LC1:
	.string	"Please verify your JSON and try again"
.LC2:
	.string	""
.LC3:
	.string	"^:$"
	.text
	.type	tokenize, @function
tokenize:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1176, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -1176(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	-1176(%rbp), %rax
	movq	%rax, -1152(%rbp)
	movq	-1152(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	$126, %rax
	jbe	.L8
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L8:
	movq	-1152(%rbp), %rcx
	leaq	-1056(%rbp), %rax
	movl	$1024, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	leaq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	subq	$1, %rax
	movzbl	-1056(%rbp,%rax), %eax
	movsbl	%al, %edx
	movzbl	-1056(%rbp), %eax
	movsbl	%al, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	validate_open_and_close_ident
	movl	%eax, -1164(%rbp)
	cmpl	$0, -1164(%rbp)
	jne	.L9
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L9:
	movl	$0, -1160(%rbp)
	jmp	.L10
.L13:
	leaq	.LC2(%rip), %rax
	movq	%rax, -1144(%rbp)
	leaq	-1056(%rbp), %rdx
	movl	-1160(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movq	%rax, -1136(%rbp)
	call	__ctype_b_loc@PLT
	movq	(%rax), %rdx
	movl	-1160(%rbp), %eax
	cltq
	movzbl	-1056(%rbp,%rax), %eax
	movsbq	%al, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$8192, %eax
	movl	%eax, -1156(%rbp)
	cmpl	$0, -1156(%rbp)
	jne	.L11
	leaq	.LC3(%rip), %rax
	movq	%rax, -1128(%rbp)
	movq	-1128(%rbp), %rcx
	leaq	-1120(%rbp), %rax
	movl	$1, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	regcomp@PLT
	movq	-1152(%rbp), %rsi
	leaq	-1120(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rdi
	call	regexec@PLT
	movl	%eax, ret.0(%rip)
	movl	ret.0(%rip), %eax
	testl	%eax, %eax
	je	.L12
	movl	ret.0(%rip), %eax
	cmpl	$1, %eax
	jne	.L12
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L12:
	leaq	-1120(%rbp), %rax
	movq	%rax, %rdi
	call	regfree@PLT
.L11:
	addl	$1, -1160(%rbp)
.L10:
	movl	-1160(%rbp), %eax
	movslq	%eax, %rbx
	leaq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	%rax, %rbx
	jb	.L13
	nop
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	tokenize, .-tokenize
	.section	.rodata
.LC4:
	.string	"{\"test\": \"ops\"}"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	tokenize
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.local	ret.0
	.comm	ret.0,4,4
	.ident	"GCC: (GNU) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
