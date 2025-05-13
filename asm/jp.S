	.file	"main.c"
	.intel_syntax noprefix
# GNU C17 (GCC) version 14.2.0 (x86_64-unknown-linux-gnu)
#	compiled by GNU C version 14.2.0, GMP version 6.3.0, MPFR version 4.2.1, MPC version 1.3.1, isl version isl-0.26-GMP

# GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
# options passed: -masm=intel -mtune=generic -march=x86-64
	.text
	.type	validate_open_and_close_ident, @function
validate_open_and_close_ident:
.LFB6:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	mov	edx, edi	# tmp100, o
	mov	eax, esi	# tmp102, c
	mov	BYTE PTR -4[rbp], dl	# o, tmp101
	mov	BYTE PTR -8[rbp], al	# c, tmp103
# include/lexer.h:37:    return (o == '{' && c == '}') || (o == '[' && c == ']');
	cmp	BYTE PTR -4[rbp], 123	# o,
	jne	.L2	#,
# include/lexer.h:37:    return (o == '{' && c == '}') || (o == '[' && c == ']');
	cmp	BYTE PTR -8[rbp], 125	# c,
	je	.L3	#,
.L2:
# include/lexer.h:37:    return (o == '{' && c == '}') || (o == '[' && c == ']');
	cmp	BYTE PTR -4[rbp], 91	# o,
	jne	.L4	#,
# include/lexer.h:37:    return (o == '{' && c == '}') || (o == '[' && c == ']');
	cmp	BYTE PTR -8[rbp], 93	# c,
	jne	.L4	#,
.L3:
# include/lexer.h:37:    return (o == '{' && c == '}') || (o == '[' && c == ']');
	mov	eax, 1	# iftmp.0_1,
# include/lexer.h:37:    return (o == '{' && c == '}') || (o == '[' && c == ']');
	jmp	.L6	#
.L4:
# include/lexer.h:37:    return (o == '{' && c == '}') || (o == '[' && c == ']');
	mov	eax, 0	# iftmp.0_1,
.L6:
# include/lexer.h:38: }
	pop	rbp	#
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
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
	push	rbx	#
	sub	rsp, 1176	#,
	.cfi_offset 3, -24
	mov	QWORD PTR -1176[rbp], rdi	# code, code
# include/lexer.h:91: static inline void tokenize(char *code) {
	mov	rax, QWORD PTR fs:40	# tmp121, MEM[(<address-space-1> long unsigned int *)40B]
	mov	QWORD PTR -24[rbp], rax	# D.4199, tmp121
	xor	eax, eax	# tmp121
	mov	rax, QWORD PTR -1176[rbp]	# tmp122, code
	mov	QWORD PTR -1152[rbp], rax	# code, tmp122
# include/lexer.h:42:    if (strlen(code) >= CHAR_MAX) {
	mov	rax, QWORD PTR -1152[rbp]	# tmp123, code
	mov	rdi, rax	#, tmp123
	call	strlen@PLT	#
# include/lexer.h:42:    if (strlen(code) >= CHAR_MAX) {
	cmp	rax, 126	# _4,
	jbe	.L8	#,
# include/lexer.h:43:       perror("Erro while trying to allocate string. Please verify the length");
	lea	rax, .LC0[rip]	# tmp124,
	mov	rdi, rax	#, tmp124
	call	perror@PLT	#
# include/lexer.h:44:       exit(EXIT_FAILURE);
	mov	edi, 1	#,
	call	exit@PLT	#
.L8:
# include/lexer.h:49:    strncpy(result, code, sizeof(result));
	mov	rcx, QWORD PTR -1152[rbp]	# tmp125, code
	lea	rax, -1056[rbp]	# tmp126,
	mov	edx, 1024	#,
	mov	rsi, rcx	#, tmp125
	mov	rdi, rax	#, tmp126
	call	strncpy@PLT	#
# include/lexer.h:51:    int is_valid = validate_open_and_close_ident(result[0], result[strlen(result) - 1]);
	lea	rax, -1056[rbp]	# tmp127,
	mov	rdi, rax	#, tmp127
	call	strlen@PLT	#
# include/lexer.h:51:    int is_valid = validate_open_and_close_ident(result[0], result[strlen(result) - 1]);
	sub	rax, 1	# _6,
# include/lexer.h:51:    int is_valid = validate_open_and_close_ident(result[0], result[strlen(result) - 1]);
	movzx	eax, BYTE PTR -1056[rbp+rax]	# _7, result[_6]
# include/lexer.h:51:    int is_valid = validate_open_and_close_ident(result[0], result[strlen(result) - 1]);
	movsx	edx, al	# _8, _7
# include/lexer.h:51:    int is_valid = validate_open_and_close_ident(result[0], result[strlen(result) - 1]);
	movzx	eax, BYTE PTR -1056[rbp]	# _9, result[0]
# include/lexer.h:51:    int is_valid = validate_open_and_close_ident(result[0], result[strlen(result) - 1]);
	movsx	eax, al	# _10, _9
	mov	esi, edx	#, _8
	mov	edi, eax	#, _10
	call	validate_open_and_close_ident	#
	mov	DWORD PTR -1164[rbp], eax	# is_valid, tmp128
# include/lexer.h:53:    if (!is_valid) {
	cmp	DWORD PTR -1164[rbp], 0	# is_valid,
	jne	.L9	#,
# include/lexer.h:54:       perror(VALIDATION_ERROR);
	lea	rax, .LC1[rip]	# tmp129,
	mov	rdi, rax	#, tmp129
	call	perror@PLT	#
# include/lexer.h:55:       exit(EXIT_FAILURE);
	mov	edi, 1	#,
	call	exit@PLT	#
.L9:
# include/lexer.h:58:    for (int i = 0; i < strlen(result); i++) {
	mov	DWORD PTR -1160[rbp], 0	# i,
# include/lexer.h:58:    for (int i = 0; i < strlen(result); i++) {
	jmp	.L10	#
.L14:
# include/lexer.h:59:       const char* empty_string = "";
	lea	rax, .LC2[rip]	# tmp130,
	mov	QWORD PTR -1144[rbp], rax	# empty_string, tmp130
# include/lexer.h:60:       char* vp = &result[i];
	lea	rdx, -1056[rbp]	# tmp131,
	mov	eax, DWORD PTR -1160[rbp]	# tmp133, i
	cdqe
	add	rax, rdx	# tmp134, tmp131
	mov	QWORD PTR -1136[rbp], rax	# vp, tmp134
# include/lexer.h:61:       const int spc = isspace((int)result[i]);
	call	__ctype_b_loc@PLT	#
# include/lexer.h:61:       const int spc = isspace((int)result[i]);
	mov	rdx, QWORD PTR [rax]	# _17, *_16
	mov	eax, DWORD PTR -1160[rbp]	# tmp136, i
	cdqe
	movzx	eax, BYTE PTR -1056[rbp+rax]	# _18, result[i_14]
	movsx	rax, al	# _19, _18
	add	rax, rax	# _20
	add	rax, rdx	# _21, _17
	movzx	eax, WORD PTR [rax]	# _22, *_21
	movzx	eax, ax	# _23, _22
# include/lexer.h:61:       const int spc = isspace((int)result[i]);
	and	eax, 8192	# tmp137,
	mov	DWORD PTR -1156[rbp], eax	# spc, tmp137
# include/lexer.h:63:       if (spc == 0x00) {
	cmp	DWORD PTR -1156[rbp], 0	# spc,
	jne	.L11	#,
# include/lexer.h:67:          const char *padrao = "^:$";
	lea	rax, .LC3[rip]	# tmp138,
	mov	QWORD PTR -1128[rbp], rax	# padrao, tmp138
# include/lexer.h:69:          regcomp(&regex, padrao, REG_EXTENDED);
	mov	rcx, QWORD PTR -1128[rbp]	# tmp139, padrao
	lea	rax, -1120[rbp]	# tmp140,
	mov	edx, 1	#,
	mov	rsi, rcx	#, tmp139
	mov	rdi, rax	#, tmp140
	call	regcomp@PLT	#
# include/lexer.h:71:          ret = regexec(&regex, code, 0, NULL, 0);
	mov	rsi, QWORD PTR -1152[rbp]	# tmp141, code
	lea	rax, -1120[rbp]	# tmp142,
	mov	r8d, 0	#,
	mov	ecx, 0	#,
	mov	edx, 0	#,
	mov	rdi, rax	#, tmp142
	call	regexec@PLT	#
# include/lexer.h:71:          ret = regexec(&regex, code, 0, NULL, 0);
	mov	DWORD PTR ret.0[rip], eax	# ret, _26
# include/lexer.h:73:          if (ret != 0) {
	mov	eax, DWORD PTR ret.0[rip]	# ret.1_27, ret
# include/lexer.h:73:          if (ret != 0) {
	test	eax, eax	# ret.1_27
	je	.L12	#,
# include/lexer.h:74:             if (ret == REG_NOMATCH) {
	mov	eax, DWORD PTR ret.0[rip]	# ret.2_28, ret
# include/lexer.h:74:             if (ret == REG_NOMATCH) {
	cmp	eax, 1	# ret.2_28,
	jne	.L12	#,
# include/lexer.h:75:                perror(VALIDATION_ERROR);
	lea	rax, .LC1[rip]	# tmp143,
	mov	rdi, rax	#, tmp143
	call	perror@PLT	#
# include/lexer.h:76:                exit(EXIT_FAILURE);
	mov	edi, 1	#,
	call	exit@PLT	#
.L12:
# include/lexer.h:80:          regfree(&regex);
	lea	rax, -1120[rbp]	# tmp144,
	mov	rdi, rax	#, tmp144
	call	regfree@PLT	#
# include/lexer.h:82:          continue;
	jmp	.L13	#
.L11:
# include/lexer.h:85:       *vp = (char)empty_string;
	mov	rax, QWORD PTR -1144[rbp]	# empty_string.3_29, empty_string
	mov	edx, eax	# _30, empty_string.3_29
# include/lexer.h:85:       *vp = (char)empty_string;
	mov	rax, QWORD PTR -1136[rbp]	# tmp145, vp
	mov	BYTE PTR [rax], dl	# *vp_15, _30
.L13:
# include/lexer.h:58:    for (int i = 0; i < strlen(result); i++) {
	add	DWORD PTR -1160[rbp], 1	# i,
.L10:
# include/lexer.h:58:    for (int i = 0; i < strlen(result); i++) {
	mov	eax, DWORD PTR -1160[rbp]	# tmp146, i
	movsx	rbx, eax	# _32, tmp146
# include/lexer.h:58:    for (int i = 0; i < strlen(result); i++) {
	lea	rax, -1056[rbp]	# tmp147,
	mov	rdi, rax	#, tmp147
	call	strlen@PLT	#
# include/lexer.h:58:    for (int i = 0; i < strlen(result); i++) {
	cmp	rbx, rax	# _32, _33
	jb	.L14	#,
# include/lexer.h:93: }
	nop	
	mov	rax, QWORD PTR -24[rbp]	# tmp148, D.4199
	sub	rax, QWORD PTR fs:40	# tmp148, MEM[(<address-space-1> long unsigned int *)40B]
	je	.L16	#,
	call	__stack_chk_fail@PLT	#
.L16:
	mov	rbx, QWORD PTR -8[rbp]	#,
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE8:
	.size	tokenize, .-tokenize
	.section	.rodata
.LC4:
	.string	"{\n\n\n\n\n\n\n\"test\": \"ops\"}"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.cfi_startproc
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
# main.c:4:     tokenize("{\n\n\n\n\n\n\n\"test\": \"ops\"}");
	lea	rax, .LC4[rip]	# tmp100,
	mov	rdi, rax	#, tmp100
	call	tokenize	#
# main.c:6:     return 0;
	mov	eax, 0	# _3,
# main.c:7: }
	pop	rbp	#
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.local	ret.0
	.comm	ret.0,4,4
	.ident	"GCC: (GNU) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
