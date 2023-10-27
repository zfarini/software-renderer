	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	__Z19get_last_write_timePKc ## -- Begin function _Z19get_last_write_timePKc
	.p2align	4, 0x90
__Z19get_last_write_timePKc:            ## @_Z19get_last_write_timePKc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$144, %rsp
	leaq	-144(%rbp), %rsi
	callq	_stat$INODE64
	testl	%eax, %eax
	jne	LBB0_1
## %bb.2:
	movq	-96(%rbp), %rax
	addq	$144, %rsp
	popq	%rbp
	retq
LBB0_1:
	xorl	%eax, %eax
	addq	$144, %rsp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z17get_game_dll_namev ## -- Begin function _Z17get_game_dll_namev
	.p2align	4, 0x90
__Z17get_game_dll_namev:                ## @_Z17get_game_dll_namev
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$152, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	leaq	L_.str(%rip), %rdi
	callq	_opendir$INODE64
	testq	%rax, %rax
	je	LBB1_16
## %bb.1:
	movq	%rax, %rbx
	movq	%rax, %rdi
	callq	_readdir$INODE64
	testq	%rax, %rax
	je	LBB1_17
## %bb.2:
	movq	%rax, %r12
	xorl	%eax, %eax
	movq	%rax, -48(%rbp)         ## 8-byte Spill
	leaq	L_.str.3(%rip), %r15
	.p2align	4, 0x90
LBB1_3:                                 ## =>This Inner Loop Header: Depth=1
	leaq	21(%r12), %r14
	movq	%r14, %rdi
	callq	_strlen
	movq	%rax, %r13
	cmpl	$7, %r13d
	jl	LBB1_13
## %bb.4:                               ##   in Loop: Header=BB1_3 Depth=1
	movl	$4, %edx
	movq	%r14, %rdi
	movq	%r15, %rsi
	callq	_strncmp
	testl	%eax, %eax
	jne	LBB1_13
## %bb.5:                               ##   in Loop: Header=BB1_3 Depth=1
	movslq	%r13d, %rax
	leaq	18(%r12,%rax), %rdi
	leaq	L_.str.4(%rip), %rsi
	callq	_strcmp
	testl	%eax, %eax
	jne	LBB1_13
## %bb.6:                               ##   in Loop: Header=BB1_3 Depth=1
	cmpq	$0, -48(%rbp)           ## 8-byte Folded Reload
	je	LBB1_12
## %bb.7:                               ##   in Loop: Header=BB1_3 Depth=1
	movq	%r14, %rdi
	leaq	-192(%rbp), %rsi
	callq	_stat$INODE64
	movl	$0, %r12d
	movl	$0, %r13d
	testl	%eax, %eax
	jne	LBB1_9
## %bb.8:                               ##   in Loop: Header=BB1_3 Depth=1
	movq	-144(%rbp), %r13
LBB1_9:                                 ##   in Loop: Header=BB1_3 Depth=1
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	leaq	-192(%rbp), %rsi
	callq	_stat$INODE64
	testl	%eax, %eax
	jne	LBB1_11
## %bb.10:                              ##   in Loop: Header=BB1_3 Depth=1
	movq	-144(%rbp), %r12
LBB1_11:                                ##   in Loop: Header=BB1_3 Depth=1
	cmpq	%r12, %r13
	jle	LBB1_13
LBB1_12:                                ##   in Loop: Header=BB1_3 Depth=1
	movq	%r14, -48(%rbp)         ## 8-byte Spill
	.p2align	4, 0x90
LBB1_13:                                ##   in Loop: Header=BB1_3 Depth=1
	movq	%rbx, %rdi
	callq	_readdir$INODE64
	movq	%rax, %r12
	testq	%rax, %rax
	jne	LBB1_3
## %bb.14:
	movq	-48(%rbp), %rdi         ## 8-byte Reload
	testq	%rdi, %rdi
	je	LBB1_17
## %bb.15:
	callq	_strdup
	movq	%rax, %r14
	movq	%rbx, %rdi
	callq	_closedir
	movq	%r14, %rax
	addq	$152, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB1_17:
	leaq	L___func__._Z17get_game_dll_namev(%rip), %rdi
	leaq	L_.str.1(%rip), %rsi
	leaq	L_.str.5(%rip), %rcx
	movl	$44, %edx
	callq	___assert_rtn
LBB1_16:
	leaq	L___func__._Z17get_game_dll_namev(%rip), %rdi
	leaq	L_.str.1(%rip), %rsi
	leaq	L_.str.2(%rip), %rcx
	movl	$29, %edx
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.globl	__Z8open_dllPc          ## -- Begin function _Z8open_dllPc
	.p2align	4, 0x90
__Z8open_dllPc:                         ## @_Z8open_dllPc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	$1, %esi
	callq	_dlopen
	testq	%rax, %rax
	je	LBB2_2
## %bb.1:
	popq	%rbp
	retq
LBB2_2:
	leaq	L___func__._Z8open_dllPc(%rip), %rdi
	leaq	L_.str.1(%rip), %rsi
	leaq	L_.str.6(%rip), %rcx
	movl	$53, %edx
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3               ## -- Begin function main
LCPI3_0:
	.quad	4572686705440205015     ## double 0.0052359881070833314
LCPI3_1:
	.quad	4584688333095894851     ## double 0.031415925833697254
LCPI3_2:
	.quad	-4638683703758880957    ## double -0.031415925833697254
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI3_3:
	.long	925353388               ## float 9.99999974E-6
LCPI3_4:
	.long	1065353216              ## float 1
LCPI3_6:
	.long	1090519040              ## float 8
LCPI3_8:
	.long	0                       ## float 0
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI3_5:
	.long	1090519040              ## float 8
	.long	1090519040              ## float 8
	.space	4
	.space	4
LCPI3_7:
	.space	16
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$2328, %rsp             ## imm = 0x918
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movl	$32, %edi
	callq	_SDL_Init
	testl	%eax, %eax
	je	LBB3_2
LBB3_1:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %rbx
	callq	_SDL_GetError
	leaq	L_.str.9(%rip), %rsi
	movq	%rbx, %rdi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movl	$1, %ebx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB3_71
LBB3_66:
	movl	%ebx, %eax
	addq	$2328, %rsp             ## imm = 0x918
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB3_2:
	leaq	L_.str.3(%rip), %rdi
	movl	$0, %esi
	xorl	%edx, %edx
	movl	$512, %ecx              ## imm = 0x200
	movl	$512, %r8d              ## imm = 0x200
	movl	$4, %r9d
	callq	_SDL_CreateWindow
	testq	%rax, %rax
	je	LBB3_1
## %bb.3:
	movq	%rax, %r12
	movq	%rax, %rdi
	movl	$-1, %esi
	movl	$2, %edx
	callq	_SDL_CreateRenderer
	testq	%rax, %rax
	je	LBB3_1
## %bb.4:
	movq	%rax, %r14
	movq	%rax, %rdi
	movl	$512, %esi              ## imm = 0x200
	movl	$512, %edx              ## imm = 0x200
	callq	_SDL_RenderSetLogicalSize
	movl	$1, %ebx
	movq	%r14, %rdi
	movl	$1, %esi
	callq	_SDL_RenderSetIntegerScale
	movq	%r14, -2360(%rbp)       ## 8-byte Spill
	movq	%r14, %rdi
	movl	$373694468, %esi        ## imm = 0x16462004
	movl	$1, %edx
	movl	$512, %ecx              ## imm = 0x200
	movl	$512, %r8d              ## imm = 0x200
	callq	_SDL_CreateTexture
	testq	%rax, %rax
	je	LBB3_5
## %bb.6:
	movq	%rax, %r14
	xorl	%edi, %edi
	callq	_SDL_SetRelativeMouseMode
	movl	$1, %edi
	movl	$7352, %esi             ## imm = 0x1CB8
	callq	_calloc
	movq	%rax, %r13
	movabsq	$2199023256064, %rax    ## imm = 0x20000000200
	movq	%rax, (%r13)
	callq	__Z17get_game_dll_namev
	movq	%rax, -2304(%rbp)       ## 8-byte Spill
	movq	%rax, %rdi
	movl	$1, %esi
	callq	_dlopen
	testq	%rax, %rax
	je	LBB3_67
## %bb.7:
	movq	%r14, -2352(%rbp)       ## 8-byte Spill
	leaq	L_.str.10(%rip), %rsi
	movq	%rax, %r14
	movq	%rax, %rdi
	callq	_dlsym
	movq	%rax, %r15
	leaq	L_.str.11(%rip), %rsi
	movq	%r14, -2312(%rbp)       ## 8-byte Spill
	movq	%r14, %rdi
	callq	_dlsym
	movq	%r15, -2320(%rbp)       ## 8-byte Spill
	testq	%r15, %r15
	je	LBB3_68
## %bb.8:
	testq	%rax, %rax
	je	LBB3_68
## %bb.9:
	leaq	-2368(%rbp), %rdi
	leaq	-2364(%rbp), %rsi
	callq	_SDL_GetMouseState
	leaq	-1216(%rbp), %rdi
	movl	$1024, %esi             ## imm = 0x400
	callq	___bzero
	cmpl	$0, 36(%r13)
	jne	LBB3_64
## %bb.10:
	leaq	16(%r13), %rax
	movq	%rax, -2336(%rbp)       ## 8-byte Spill
	movq	%r13, %rax
	addq	$8, %rax
	movq	%rax, -2328(%rbp)       ## 8-byte Spill
	xorl	%r15d, %r15d
	leaq	-192(%rbp), %rbx
	movq	%r12, -2344(%rbp)       ## 8-byte Spill
	jmp	LBB3_11
	.p2align	4, 0x90
LBB3_40:                                ##   in Loop: Header=BB3_11 Depth=1
	vxorpd	%xmm1, %xmm1, %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	cmpl	$0, -828(%rbp)
	jne	LBB3_43
	jmp	LBB3_44
	.p2align	4, 0x90
LBB3_11:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB3_22 Depth 2
	callq	__Z17get_game_dll_namev
	movq	%rax, %r12
	movq	%rax, %rdi
	movq	%rbx, %rsi
	callq	_stat$INODE64
	movl	$0, %r14d
	testl	%eax, %eax
	jne	LBB3_13
## %bb.12:                              ##   in Loop: Header=BB3_11 Depth=1
	movq	-144(%rbp), %r14
LBB3_13:                                ##   in Loop: Header=BB3_11 Depth=1
	movq	-2304(%rbp), %rdi       ## 8-byte Reload
	movq	%rbx, %rsi
	callq	_stat$INODE64
	movl	$0, %ecx
	testl	%eax, %eax
	jne	LBB3_15
## %bb.14:                              ##   in Loop: Header=BB3_11 Depth=1
	movq	-144(%rbp), %rcx
LBB3_15:                                ##   in Loop: Header=BB3_11 Depth=1
	cmpq	%rcx, %r14
	jle	LBB3_20
## %bb.16:                              ##   in Loop: Header=BB3_11 Depth=1
	movq	%r15, %rbx
	leaq	L_str(%rip), %rdi
	callq	_puts
	movq	-2304(%rbp), %rdi       ## 8-byte Reload
	callq	_unlink
	movq	-2312(%rbp), %rdi       ## 8-byte Reload
	callq	_dlclose
	movq	%r12, %rdi
	movl	$1, %esi
	callq	_dlopen
	testq	%rax, %rax
	je	LBB3_67
## %bb.17:                              ##   in Loop: Header=BB3_11 Depth=1
	movq	%rax, %r14
	movq	%rax, %rdi
	leaq	L_.str.10(%rip), %rsi
	callq	_dlsym
	movq	%rax, %r15
	movq	%r14, -2312(%rbp)       ## 8-byte Spill
	movq	%r14, %rdi
	leaq	L_.str.11(%rip), %rsi
	callq	_dlsym
	movq	%r15, -2320(%rbp)       ## 8-byte Spill
	testq	%r15, %r15
	je	LBB3_69
## %bb.18:                              ##   in Loop: Header=BB3_11 Depth=1
	testq	%rax, %rax
	je	LBB3_69
## %bb.19:                              ##   in Loop: Header=BB3_11 Depth=1
	movq	-2304(%rbp), %rdi       ## 8-byte Reload
	callq	_free
	movq	%r12, -2304(%rbp)       ## 8-byte Spill
	movq	%rbx, %r15
	jmp	LBB3_21
	.p2align	4, 0x90
LBB3_20:                                ##   in Loop: Header=BB3_11 Depth=1
	movq	%r12, %rdi
	callq	_free
LBB3_21:                                ##   in Loop: Header=BB3_11 Depth=1
	leaq	-2296(%rbp), %rbx
	movl	$1024, %edx             ## imm = 0x400
	leaq	-2240(%rbp), %rdi
	leaq	-1216(%rbp), %rsi
	callq	_memcpy
	movq	%rbx, %rdi
	callq	_SDL_PollEvent
	testl	%eax, %eax
	movq	-2344(%rbp), %r12       ## 8-byte Reload
	je	LBB3_37
	.p2align	4, 0x90
LBB3_22:                                ##   Parent Loop BB3_11 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	-2296(%rbp), %eax
	cmpl	$1023, %eax             ## imm = 0x3FF
	jg	LBB3_26
## %bb.23:                              ##   in Loop: Header=BB3_22 Depth=2
	leal	-768(%rax), %ecx
	cmpl	$2, %ecx
	jae	LBB3_24
## %bb.31:                              ##   in Loop: Header=BB3_22 Depth=2
	movslq	-2276(%rbp), %rcx
	cmpq	$255, %rcx
	ja	LBB3_36
## %bb.32:                              ##   in Loop: Header=BB3_22 Depth=2
	xorl	%edx, %edx
	cmpl	$768, %eax              ## imm = 0x300
	sete	%dl
	movl	%edx, -1216(%rbp,%rcx,4)
	movq	%rbx, %rdi
	callq	_SDL_PollEvent
	testl	%eax, %eax
	jne	LBB3_22
	jmp	LBB3_37
	.p2align	4, 0x90
LBB3_26:                                ##   in Loop: Header=BB3_22 Depth=2
	leal	-1025(%rax), %ecx
	cmpl	$2, %ecx
	jae	LBB3_27
## %bb.33:                              ##   in Loop: Header=BB3_22 Depth=2
	cmpb	$1, -2280(%rbp)
	jne	LBB3_36
## %bb.34:                              ##   in Loop: Header=BB3_22 Depth=2
	xorl	%eax, %eax
	testl	%r15d, %r15d
	sete	%al
	movl	%eax, %r15d
	movq	%rbx, %rdi
	callq	_SDL_PollEvent
	testl	%eax, %eax
	jne	LBB3_22
	jmp	LBB3_37
	.p2align	4, 0x90
LBB3_24:                                ##   in Loop: Header=BB3_22 Depth=2
	cmpl	$256, %eax              ## imm = 0x100
	jne	LBB3_36
## %bb.25:                              ##   in Loop: Header=BB3_22 Depth=2
	movl	$1, 36(%r13)
	movq	%rbx, %rdi
	callq	_SDL_PollEvent
	testl	%eax, %eax
	jne	LBB3_22
	jmp	LBB3_37
	.p2align	4, 0x90
LBB3_27:                                ##   in Loop: Header=BB3_22 Depth=2
	cmpl	$1024, %eax             ## imm = 0x400
	jne	LBB3_36
## %bb.28:                              ##   in Loop: Header=BB3_22 Depth=2
	testl	%r15d, %r15d
	jne	LBB3_35
## %bb.29:                              ##   in Loop: Header=BB3_22 Depth=2
	callq	_SDL_GetRelativeMouseMode
	testl	%eax, %eax
	je	LBB3_30
LBB3_35:                                ##   in Loop: Header=BB3_22 Depth=2
	callq	_SDL_GetRelativeMouseMode
	xorl	%ecx, %ecx
	testl	%eax, %eax
	sete	%cl
	leal	-1(%rcx,%rcx), %eax
	movl	-2268(%rbp), %ecx
	imull	%eax, %ecx
	vcvtsi2sdl	%ecx, %xmm5, %xmm0
	vmovsd	LCPI3_0(%rip), %xmm1    ## xmm1 = mem[0],zero
	vmovapd	%xmm1, %xmm2
	vmulsd	%xmm1, %xmm0, %xmm0
	vmovss	60(%r13), %xmm1         ## xmm1 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	56(%r13), %xmm1         ## xmm1 = mem[0],zero,zero,zero
	vmovss	%xmm0, 60(%r13)
	imull	-2264(%rbp), %eax
	vcvtsi2sdl	%eax, %xmm5, %xmm0
	vmulsd	%xmm2, %xmm0, %xmm0
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, 56(%r13)
	.p2align	4, 0x90
LBB3_36:                                ##   in Loop: Header=BB3_22 Depth=2
	movq	%rbx, %rdi
	callq	_SDL_PollEvent
	testl	%eax, %eax
	jne	LBB3_22
	jmp	LBB3_37
LBB3_30:                                ##   in Loop: Header=BB3_22 Depth=2
	xorl	%r15d, %r15d
	movq	%rbx, %rdi
	callq	_SDL_PollEvent
	testl	%eax, %eax
	jne	LBB3_22
	.p2align	4, 0x90
LBB3_37:                                ##   in Loop: Header=BB3_11 Depth=1
	vxorps	%xmm0, %xmm0, %xmm0
	vmovlps	%xmm0, 104(%r13)
	movl	$0, 112(%r13)
	cmpl	$0, -1108(%rbp)
	je	LBB3_39
## %bb.38:                              ##   in Loop: Header=BB3_11 Depth=1
	movl	$1, 36(%r13)
LBB3_39:                                ##   in Loop: Header=BB3_11 Depth=1
	cmpl	$0, -740(%rbp)
	je	LBB3_40
## %bb.41:                              ##   in Loop: Header=BB3_11 Depth=1
	vmovsd	92(%r13), %xmm0         ## xmm0 = mem[0],zero
	vaddps	LCPI3_7(%rip), %xmm0, %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	vaddss	100(%r13), %xmm0, %xmm0
	vmovlps	%xmm1, 104(%r13)
	vmovss	%xmm0, 112(%r13)
	cmpl	$0, -828(%rbp)
	je	LBB3_44
LBB3_43:                                ##   in Loop: Header=BB3_11 Depth=1
	vmovsd	68(%r13), %xmm2         ## xmm2 = mem[0],zero
	vsubps	%xmm2, %xmm1, %xmm1
	vsubss	76(%r13), %xmm0, %xmm0
	vmovlps	%xmm1, 104(%r13)
	vmovss	%xmm0, 112(%r13)
LBB3_44:                                ##   in Loop: Header=BB3_11 Depth=1
	cmpl	$0, -756(%rbp)
	je	LBB3_46
## %bb.45:                              ##   in Loop: Header=BB3_11 Depth=1
	vmovsd	92(%r13), %xmm2         ## xmm2 = mem[0],zero
	vsubps	%xmm2, %xmm1, %xmm1
	vsubss	100(%r13), %xmm0, %xmm0
	vmovlps	%xmm1, 104(%r13)
	vmovss	%xmm0, 112(%r13)
LBB3_46:                                ##   in Loop: Header=BB3_11 Depth=1
	cmpl	$0, -816(%rbp)
	je	LBB3_48
## %bb.47:                              ##   in Loop: Header=BB3_11 Depth=1
	vmovsd	68(%r13), %xmm2         ## xmm2 = mem[0],zero
	vaddps	%xmm1, %xmm2, %xmm1
	vaddss	76(%r13), %xmm0, %xmm0
	vmovlps	%xmm1, 104(%r13)
	vmovss	%xmm0, 112(%r13)
LBB3_48:                                ##   in Loop: Header=BB3_11 Depth=1
	cmpl	$0, -764(%rbp)
	je	LBB3_50
## %bb.49:                              ##   in Loop: Header=BB3_11 Depth=1
	vmovsd	80(%r13), %xmm2         ## xmm2 = mem[0],zero
	vaddps	%xmm1, %xmm2, %xmm1
	vaddss	88(%r13), %xmm0, %xmm0
	vmovlps	%xmm1, 104(%r13)
	vmovss	%xmm0, 112(%r13)
LBB3_50:                                ##   in Loop: Header=BB3_11 Depth=1
	cmpl	$0, -812(%rbp)
	je	LBB3_52
## %bb.51:                              ##   in Loop: Header=BB3_11 Depth=1
	vmovsd	80(%r13), %xmm2         ## xmm2 = mem[0],zero
	vsubps	%xmm2, %xmm1, %xmm1
	vsubss	88(%r13), %xmm0, %xmm0
	vmovlps	%xmm1, 104(%r13)
	vmovss	%xmm0, 112(%r13)
LBB3_52:                                ##   in Loop: Header=BB3_11 Depth=1
	cmpl	$0, -760(%rbp)
	je	LBB3_54
## %bb.53:                              ##   in Loop: Header=BB3_11 Depth=1
	vmovss	64(%r13), %xmm2         ## xmm2 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vaddsd	LCPI3_1(%rip), %xmm2, %xmm2
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	vmovss	%xmm2, 64(%r13)
LBB3_54:                                ##   in Loop: Header=BB3_11 Depth=1
	cmpl	$0, -808(%rbp)
	je	LBB3_56
## %bb.55:                              ##   in Loop: Header=BB3_11 Depth=1
	vmovss	64(%r13), %xmm2         ## xmm2 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vaddsd	LCPI3_2(%rip), %xmm2, %xmm2
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	vmovss	%xmm2, 64(%r13)
LBB3_56:                                ##   in Loop: Header=BB3_11 Depth=1
	vmulss	%xmm1, %xmm1, %xmm3
	vmovshdup	%xmm1, %xmm2    ## xmm2 = xmm1[1,1,3,3]
	vmulss	%xmm2, %xmm2, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vmulss	%xmm0, %xmm0, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vsqrtss	%xmm3, %xmm3, %xmm3
	vmovss	LCPI3_3(%rip), %xmm4    ## xmm4 = mem[0],zero,zero,zero
	vucomiss	%xmm3, %xmm4
	jae	LBB3_57
## %bb.58:                              ##   in Loop: Header=BB3_11 Depth=1
	vmovss	LCPI3_4(%rip), %xmm4    ## xmm4 = mem[0],zero,zero,zero
	vdivss	%xmm3, %xmm4, %xmm3
	vmulss	%xmm3, %xmm1, %xmm1
	vmulss	%xmm3, %xmm2, %xmm2
	vinsertps	$16, %xmm2, %xmm1, %xmm1 ## xmm1 = xmm1[0],xmm2[0],xmm1[2,3]
	vmulss	%xmm3, %xmm0, %xmm0
	jmp	LBB3_59
	.p2align	4, 0x90
LBB3_57:                                ##   in Loop: Header=BB3_11 Depth=1
	vxorps	%xmm0, %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
LBB3_59:                                ##   in Loop: Header=BB3_11 Depth=1
	vmulss	LCPI3_6(%rip), %xmm0, %xmm0
	vmulps	LCPI3_5(%rip), %xmm1, %xmm1
	vmovlps	%xmm1, 104(%r13)
	vmovss	%xmm0, 112(%r13)
	cmpl	$0, -1088(%rbp)
	je	LBB3_62
## %bb.60:                              ##   in Loop: Header=BB3_11 Depth=1
	movl	-2112(%rbp), %eax
	testl	%eax, %eax
	jne	LBB3_62
## %bb.61:                              ##   in Loop: Header=BB3_11 Depth=1
	callq	_SDL_GetRelativeMouseMode
	xorl	%edi, %edi
	testl	%eax, %eax
	sete	%dil
	callq	_SDL_SetRelativeMouseMode
LBB3_62:                                ##   in Loop: Header=BB3_11 Depth=1
	movl	%r15d, 6252(%r13)
	movq	-2352(%rbp), %r14       ## 8-byte Reload
	movq	%r14, %rdi
	xorl	%esi, %esi
	movq	-2336(%rbp), %rdx       ## 8-byte Reload
	movq	-2328(%rbp), %rcx       ## 8-byte Reload
	callq	_SDL_LockTexture
	testb	$3, 8(%r13)
	jne	LBB3_70
## %bb.63:                              ##   in Loop: Header=BB3_11 Depth=1
	movq	%r13, %rdi
	callq	*-2320(%rbp)            ## 8-byte Folded Reload
	vmovss	40(%r13), %xmm0         ## xmm0 = mem[0],zero,zero,zero
	movl	204(%r13), %eax
	incl	%eax
	vcvtsi2ssl	%eax, %xmm5, %xmm1
	vmovss	200(%r13), %xmm2        ## xmm2 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vdivss	%xmm1, %xmm2, %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	movl	$128, %esi
	leaq	-192(%rbp), %rbx
	movq	%rbx, %rdi
	leaq	L_.str.15(%rip), %rdx
	movb	$2, %al
	callq	_snprintf
	movq	%r12, %rdi
	movq	%rbx, %rsi
	callq	_SDL_SetWindowTitle
	movq	%r14, %rdi
	callq	_SDL_UnlockTexture
	movq	-2360(%rbp), %rdi       ## 8-byte Reload
	movq	%r14, %rsi
	movq	%rdi, %r14
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	callq	_SDL_RenderCopy
	movq	%r14, %rdi
	callq	_SDL_RenderPresent
	cmpl	$0, 36(%r13)
	je	LBB3_11
LBB3_64:
	xorl	%ebx, %ebx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	je	LBB3_66
LBB3_71:
	callq	___stack_chk_fail
LBB3_5:
	movq	___stderrp@GOTPCREL(%rip), %rax
	movq	(%rax), %r14
	callq	_SDL_GetError
	leaq	L_.str.9(%rip), %rsi
	movq	%r14, %rdi
	movq	%rax, %rdx
	xorl	%eax, %eax
	callq	_fprintf
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	je	LBB3_66
	jmp	LBB3_71
LBB3_69:
	leaq	L___func__.main(%rip), %rdi
	leaq	L_.str.1(%rip), %rsi
	leaq	L_.str.12(%rip), %rcx
	movl	$154, %edx
	callq	___assert_rtn
LBB3_70:
	leaq	L___func__.main(%rip), %rdi
	leaq	L_.str.1(%rip), %rsi
	leaq	L_.str.14(%rip), %rcx
	movl	$228, %edx
	callq	___assert_rtn
LBB3_67:
	leaq	L___func__._Z8open_dllPc(%rip), %rdi
	leaq	L_.str.1(%rip), %rsi
	leaq	L_.str.6(%rip), %rcx
	movl	$53, %edx
	callq	___assert_rtn
LBB3_68:
	leaq	L___func__.main(%rip), %rdi
	leaq	L_.str.1(%rip), %rsi
	leaq	L_.str.12(%rip), %rcx
	movl	$114, %edx
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"."

L___func__._Z17get_game_dll_namev:      ## @__func__._Z17get_game_dll_namev
	.asciz	"get_game_dll_name"

L_.str.1:                               ## @.str.1
	.asciz	"main.cpp"

L_.str.2:                               ## @.str.2
	.asciz	"dir"

L_.str.3:                               ## @.str.3
	.asciz	"game"

L_.str.4:                               ## @.str.4
	.asciz	".so"

L_.str.5:                               ## @.str.5
	.asciz	"dllname"

L___func__._Z8open_dllPc:               ## @__func__._Z8open_dllPc
	.asciz	"open_dll"

L_.str.6:                               ## @.str.6
	.asciz	"dll"

L___func__.main:                        ## @__func__.main
	.asciz	"main"

L_.str.9:                               ## @.str.9
	.asciz	"SDL FAILURE: %s\n"

L_.str.10:                              ## @.str.10
	.asciz	"game_update_and_render"

L_.str.11:                              ## @.str.11
	.asciz	"game_thread_work"

L_.str.12:                              ## @.str.12
	.asciz	"game_update_and_render && game_thread_work"

L_.str.14:                              ## @.str.14
	.asciz	"game->framebuffer.pitch % 4 == 0"

L_.str.15:                              ## @.str.15
	.asciz	"%.2fms %.2fms"

L_str:                                  ## @str
	.asciz	"updating dll..."


.subsections_via_symbols
