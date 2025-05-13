	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"OBJECT"
.LC1:
	.string	"ARRAY"
.LC2:
	.string	"LITERAL"
.LC3:
	.string	"ILLEGAL"
	.text
	.type	get_one_char_token, @function
get_one_char_token:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	.cfi_offset 3, -24
	movl	%edi, %ecx
	movb	%cl, -20(%rbp)
	movsbl	-20(%rbp), %ecx
	subl	$91, %ecx
	cmpl	$32, %ecx
	ja	.L2
	movl	%ecx, %ecx
	leaq	0(,%rcx,4), %rsi
	leaq	.L4(%rip), %rcx
	movl	(%rsi,%rcx), %ecx
	movslq	%ecx, %rcx
	leaq	.L4(%rip), %rsi
	addq	%rsi, %rcx
	jmp	*%rcx
	.section	.rodata
	.align 4
	.align 4
.L4:
	.long	.L8-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L7-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L6-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L5-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L2-.L4
	.long	.L3-.L4
	.text
.L3:
	movq	%rax, %rsi
	movabsq	$-4294967296, %rcx
	andq	%rsi, %rcx
	orq	$2, %rcx
	movq	%rcx, %rax
	leaq	.LC0(%rip), %rdx
	jmp	.L9
.L8:
	movq	%rax, %rsi
	movabsq	$-4294967296, %rcx
	andq	%rsi, %rcx
	orq	$4, %rcx
	movq	%rcx, %rax
	leaq	.LC1(%rip), %rdx
	jmp	.L9
.L5:
	movq	%rax, %rsi
	movabsq	$-4294967296, %rcx
	andq	%rsi, %rcx
	orq	$6, %rcx
	movq	%rcx, %rax
	leaq	.LC2(%rip), %rdx
	jmp	.L9
.L7:
	movq	%rax, %rsi
	movabsq	$-4294967296, %rcx
	andq	%rsi, %rcx
	orq	$7, %rcx
	movq	%rcx, %rax
	leaq	.LC2(%rip), %rdx
	jmp	.L9
.L6:
	movq	%rax, %rsi
	movabsq	$-4294967296, %rcx
	andq	%rsi, %rcx
	orq	$8, %rcx
	movq	%rcx, %rax
	leaq	.LC2(%rip), %rdx
	jmp	.L9
.L2:
	movq	%rax, %rsi
	movabsq	$-4294967296, %rcx
	andq	%rsi, %rcx
	orq	$12, %rcx
	movq	%rcx, %rax
	leaq	.LC3(%rip), %rdx
.L9:
	movl	%eax, %ecx
	movl	%ecx, %eax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	get_one_char_token, .-get_one_char_token
	.type	validate_open_and_close_ident, @function
validate_open_and_close_ident:
.LFB7:
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
	jne	.L12
	cmpb	$125, -8(%rbp)
	je	.L13
.L12:
	cmpb	$91, -4(%rbp)
	jne	.L14
	cmpb	$93, -8(%rbp)
	jne	.L14
.L13:
	movl	$1, %eax
	jmp	.L16
.L14:
	movl	$0, %eax
.L16:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	validate_open_and_close_ident, .-validate_open_and_close_ident
	.section	.rodata
	.align 8
.LC4:
	.string	"Erro while trying to allocate string. Please verify the length"
	.align 8
.LC5:
	.string	"Please verify your JSON and try again"
.LC6:
	.string	"um %s foi identificado\n"
	.text
	.type	tokenize, @function
tokenize:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$1112, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -1112(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	movq	-1112(%rbp), %rax
	movq	%rax, -1080(%rbp)
	movq	-1080(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	$126, %rax
	jbe	.L18
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L18:
	movq	-1080(%rbp), %rcx
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
	movl	%eax, -1092(%rbp)
	cmpl	$0, -1092(%rbp)
	jne	.L19
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L19:
	movl	$0, -1088(%rbp)
	jmp	.L20
.L22:
	movl	-1088(%rbp), %eax
	cltq
	movzbl	-1056(%rbp,%rax), %eax
	movb	%al, -1093(%rbp)
	call	__ctype_b_loc@PLT
	movq	(%rax), %rax
	movsbq	-1093(%rbp), %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$8192, %eax
	movl	%eax, -1084(%rbp)
	cmpl	$0, -1084(%rbp)
	jne	.L21
	movsbl	-1093(%rbp), %eax
	movl	%eax, %edi
	call	get_one_char_token
	movl	%eax, %ecx
	movq	%rdx, %rax
	movl	%ecx, -1072(%rbp)
	movq	%rax, -1064(%rbp)
	movq	-1064(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L21:
	addl	$1, -1088(%rbp)
.L20:
	movl	-1088(%rbp), %eax
	movslq	%eax, %rbx
	leaq	-1056(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	%rax, %rbx
	jb	.L22
	nop
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L23
	call	__stack_chk_fail@PLT
.L23:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	tokenize, .-tokenize
	.section	.rodata
.LC7:
	.string	"{\"test\": true }"
	.text
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	tokenize
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.ident	"GCC: (GNU) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
