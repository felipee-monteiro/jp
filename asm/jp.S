	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"OBJECT"
.LC1:
	.string	"ARRAY"
.LC2:
	.string	"TRUE_LITERAL"
.LC3:
	.string	"FALSE_LITERAL"
.LC4:
	.string	"NULL_LITERAL"
.LC5:
	.string	"ILLEGAL"
	.text
	.type	get_one_char_token, @function
get_one_char_token:
.LFB6:
	.cfi_startproc
	endbr64
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
	notrack jmp	*%rcx
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
	leaq	.LC3(%rip), %rdx
	jmp	.L9
.L6:
	movq	%rax, %rsi
	movabsq	$-4294967296, %rcx
	andq	%rsi, %rcx
	orq	$8, %rcx
	movq	%rcx, %rax
	leaq	.LC4(%rip), %rdx
	jmp	.L9
.L2:
	movq	%rax, %rsi
	movabsq	$-4294967296, %rcx
	andq	%rsi, %rcx
	orq	$12, %rcx
	movq	%rcx, %rax
	leaq	.LC5(%rip), %rdx
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
	endbr64
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
.LC6:
	.string	"Error while trying to allocate resources, check your values and try again."
	.align 8
.LC7:
	.string	"Please verify your JSON and try again"
.LC8:
	.string	" "
.LC9:
	.string	"First char from token: %s\n"
	.text
	.type	transform, @function
transform:
.LFB8:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1120, %rsp
	movq	%rdi, -1112(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	-1112(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -1092(%rbp)
	cmpl	$1024, -1092(%rbp)
	jg	.L18
	cmpl	$126, -1092(%rbp)
	jle	.L19
.L18:
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L19:
	movq	-1112(%rbp), %rcx
	leaq	-1040(%rbp), %rax
	movl	$1024, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	subq	$1, %rax
	movzbl	-1040(%rbp,%rax), %eax
	movsbl	%al, %edx
	movzbl	-1040(%rbp), %eax
	movsbl	%al, %eax
	movl	%edx, %esi
	movl	%eax, %edi
	call	validate_open_and_close_ident
	movl	%eax, -1088(%rbp)
	cmpl	$0, -1088(%rbp)
	jne	.L20
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L20:
	movq	$0, -1072(%rbp)
	jmp	.L21
.L27:
	leaq	-1040(%rbp), %rdx
	movq	-1072(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -1093(%rbp)
	movsbl	-1093(%rbp), %eax
	movl	%eax, -1084(%rbp)
	call	__ctype_b_loc@PLT
	movq	(%rax), %rax
	movl	-1084(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$8192, %eax
	movl	%eax, -1080(%rbp)
	call	__ctype_b_loc@PLT
	movq	(%rax), %rax
	movl	-1084(%rbp), %edx
	movslq	%edx, %rdx
	addq	%rdx, %rdx
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$1, %eax
	movl	%eax, -1076(%rbp)
	cmpl	$0, -1080(%rbp)
	jne	.L22
	cmpl	$0, -1076(%rbp)
	jne	.L22
	movsbl	-1093(%rbp), %eax
	movl	%eax, %edi
	call	get_one_char_token
	movl	%eax, %ecx
	movq	%rdx, %rax
	movl	%ecx, -1056(%rbp)
	movq	%rax, -1048(%rbp)
	movq	-1048(%rbp), %rax
	leaq	.LC0(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L23
	movq	-1048(%rbp), %rax
	leaq	.LC1(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L22
.L23:
	leaq	-1040(%rbp), %rax
	leaq	.LC8(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strtok@PLT
	movq	%rax, -1064(%rbp)
	jmp	.L25
.L26:
	movq	-1064(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	%eax, %edi
	call	get_one_char_token
	movq	%rdx, %rcx
	movq	%rcx, %rdx
	movq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	.LC8(%rip), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	strtok@PLT
	movq	%rax, -1064(%rbp)
.L25:
	cmpq	$0, -1064(%rbp)
	jne	.L26
.L22:
	addq	$1, -1072(%rbp)
.L21:
	leaq	-1040(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	%rax, -1072(%rbp)
	jb	.L27
	nop
	movq	-8(%rbp), %rax
	subq	%fs:40, %rax
	je	.L28
	call	__stack_chk_fail@PLT
.L28:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	transform, .-transform
	.type	tokenize, @function
tokenize:
.LFB9:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	transform
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	tokenize, .-tokenize
	.section	.rodata
	.align 8
.LC10:
	.string	"{\"test\": true, \"dev\": false, \"runTests\": {\"files\": [\"*.json\"]}}"
	.text
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	tokenize
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 14.2.0-19ubuntu2) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
