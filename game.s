	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 14	sdk_version 10, 14
	.globl	__Z4swapRfS_            ## -- Begin function _Z4swapRfS_
	.p2align	4, 0x90
__Z4swapRfS_:                           ## @_Z4swapRfS_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	(%rdi), %eax
	movl	(%rsi), %ecx
	movl	%ecx, (%rdi)
	movl	%eax, (%rsi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z4swapR2v3S0_         ## -- Begin function _Z4swapR2v3S0_
	.p2align	4, 0x90
__Z4swapR2v3S0_:                        ## @_Z4swapR2v3S0_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	(%rdi), %eax
	movl	(%rsi), %ecx
	movl	%ecx, (%rdi)
	movl	%eax, (%rsi)
	movl	4(%rdi), %eax
	movl	4(%rsi), %ecx
	movl	%ecx, 4(%rdi)
	movl	%eax, 4(%rsi)
	movl	8(%rdi), %eax
	movl	8(%rsi), %ecx
	movl	%ecx, 8(%rdi)
	movl	%eax, 8(%rsi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z4swapR2v2S0_         ## -- Begin function _Z4swapR2v2S0_
	.p2align	4, 0x90
__Z4swapR2v2S0_:                        ## @_Z4swapR2v2S0_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	(%rdi), %eax
	movl	(%rsi), %ecx
	movl	%ecx, (%rdi)
	movl	%eax, (%rsi)
	movl	4(%rdi), %eax
	movl	4(%rsi), %ecx
	movl	%ecx, 4(%rdi)
	movl	%eax, 4(%rsi)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z16read_entire_filePKc ## -- Begin function _Z16read_entire_filePKc
	.p2align	4, 0x90
__Z16read_entire_filePKc:               ## @_Z16read_entire_filePKc
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %rbx
	leaq	L_.str(%rip), %rsi
	callq	_fopen
	testq	%rax, %rax
	je	LBB3_3
## %bb.1:
	movq	%rax, %r15
	movq	%rax, %rdi
	xorl	%esi, %esi
	movl	$2, %edx
	callq	_fseek
	movq	%r15, %rdi
	callq	_ftell
	movq	%rax, %r14
	movq	%r15, %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	_fseek
	leaq	1(%r14), %rdi
	callq	_malloc
	testq	%rax, %rax
	je	LBB3_4
## %bb.2:
	movq	%rax, %rbx
	movl	$1, %esi
	movq	%rax, %rdi
	movq	%r14, %rdx
	movq	%r15, %rcx
	callq	_fread
	movb	$0, (%rbx,%r14)
	movq	%r15, %rdi
	callq	_fclose
	movq	%rbx, %rax
	addq	$8, %rsp
	popq	%rbx
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB3_3:
	leaq	L_.str.1(%rip), %rdi
	movq	%rbx, %rsi
	xorl	%eax, %eax
	callq	_printf
	leaq	L___func__._Z16read_entire_filePKc(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.3(%rip), %rcx
	movl	$30, %edx
	callq	___assert_rtn
LBB3_4:
	leaq	L___func__._Z16read_entire_filePKc(%rip), %rdi
	leaq	L_.str.2(%rip), %rsi
	leaq	L_.str.4(%rip), %rcx
	movl	$37, %edx
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function _Z18new_render_contextP4Game7Texturefffi
LCPI4_0:
	.long	1056964608              ## float 0.5
LCPI4_2:
	.long	2147483648              ## float -0
LCPI4_3:
	.long	1065353216              ## float 1
LCPI4_4:
	.long	925353388               ## float 9.99999974E-6
LCPI4_6:
	.long	1061158912              ## float 0.75
LCPI4_7:
	.long	1048576000              ## float 0.25
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI4_1:
	.quad	4580687790476533049     ## double 0.017453292519943295
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI4_5:
	.long	1048576000              ## float 0.25
	.long	1061158912              ## float 0.75
	.space	4
	.space	4
LCPI4_8:
	.long	1061158912              ## float 0.75
	.long	1048576000              ## float 0.25
	.space	4
	.space	4
LCPI4_11:
	.long	1061158912              ## 0x3f400000
	.long	1048576000              ## 0x3e800000
	.long	1061158912              ## 0x3f400000
	.long	1048576000              ## 0x3e800000
LCPI4_12:
	.long	1048576000              ## 0x3e800000
	.long	1061158912              ## 0x3f400000
	.long	1061158912              ## 0x3f400000
	.long	1048576000              ## 0x3e800000
	.section	__TEXT,__const
	.p2align	5
LCPI4_9:
	.long	1048576000              ## 0x3e800000
	.long	1061158912              ## 0x3f400000
	.long	1048576000              ## 0x3e800000
	.long	1061158912              ## 0x3f400000
	.long	1048576000              ## 0x3e800000
	.long	1061158912              ## 0x3f400000
	.long	1048576000              ## 0x3e800000
	.long	1061158912              ## 0x3f400000
LCPI4_10:
	.long	1048576000              ## 0x3e800000
	.long	1048576000              ## 0x3e800000
	.long	1061158912              ## 0x3f400000
	.long	1061158912              ## 0x3f400000
	.long	1048576000              ## 0x3e800000
	.long	1048576000              ## 0x3e800000
	.long	1061158912              ## 0x3f400000
	.long	1061158912              ## 0x3f400000
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z18new_render_contextP4Game7Texturefffi
	.p2align	4, 0x90
__Z18new_render_contextP4Game7Texturefffi: ## @_Z18new_render_contextP4Game7Texturefffi
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
	andq	$-32, %rsp
	subq	$256, %rsp              ## imm = 0x100
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%edx, %r13d
	vmovss	%xmm2, 96(%rsp)         ## 4-byte Spill
	vmovss	%xmm1, 92(%rsp)         ## 4-byte Spill
	vmovaps	%xmm0, 112(%rsp)        ## 16-byte Spill
	movq	%rsi, %rbx
	movq	%rdi, %r15
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 224(%rsp)
	movl	$3680, %esi             ## imm = 0xE60
	callq	___bzero
	movq	%rbx, 3648(%r15)
	vmovaps	16(%rbp), %xmm0
	vmovups	%xmm0, (%r15)
	movq	32(%rbp), %rax
	movq	%rax, 16(%r15)
	movl	(%r15), %eax
	movl	4(%r15), %r14d
	movq	%rax, 160(%rsp)         ## 8-byte Spill
	leal	(,%rax,4), %eax
	movl	%eax, 24(%r15)
	movl	%eax, 32(%r15)
	movl	%r14d, 28(%r15)
	imull	%r14d, %eax
	movslq	%eax, %rbx
	shlq	$2, %rbx
	movq	%rbx, %rdi
	callq	_malloc
	movq	%rax, %r12
	movq	%rax, 40(%r15)
	movq	%rbx, %rdi
	callq	_malloc
	movq	%rax, 48(%r15)
	vmovss	96(%rsp), %xmm0         ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 148(%r15)
	vmovaps	112(%rsp), %xmm0        ## 16-byte Reload
	vmovss	%xmm0, 56(%r15)
	vmovss	92(%rsp), %xmm0         ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 60(%r15)
	movl	%r13d, 92(%rsp)         ## 4-byte Spill
	movslq	%r13d, %r13
	imulq	$168, %r13, %rdi
	callq	_malloc
	movq	%rax, 184(%r15)
	testq	%rax, %rax
	je	LBB4_17
## %bb.1:
	testq	%r12, %r12
	je	LBB4_17
## %bb.2:
	vmovss	LCPI4_0(%rip), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	vmulss	96(%rsp), %xmm0, %xmm0  ## 4-byte Folded Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmulsd	LCPI4_1(%rip), %xmm0, %xmm0
	callq	_tan
	vaddsd	%xmm0, %xmm0, %xmm0
	vmovaps	112(%rsp), %xmm1        ## 16-byte Reload
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vcvtsi2ssl	%r14d, %xmm3, %xmm1
	movq	160(%rsp), %rax         ## 8-byte Reload
	vcvtsi2ssl	%eax, %xmm3, %xmm2
	vmovss	%xmm0, 152(%r15)
	vdivss	%xmm2, %xmm1, %xmm1
	vmulss	%xmm0, %xmm1, %xmm1
	vmovss	%xmm1, 156(%r15)
	vmovss	LCPI4_0(%rip), %xmm3    ## xmm3 = mem[0],zero,zero,zero
	vmulss	%xmm3, %xmm1, %xmm2
	vmovss	%xmm2, 168(%r15)
	vmulss	%xmm3, %xmm0, %xmm1
	vmovss	%xmm1, 164(%r15)
	vbroadcastss	LCPI4_2(%rip), %xmm0 ## xmm0 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	vmovaps	%xmm2, 128(%rsp)        ## 16-byte Spill
	vxorps	%xmm0, %xmm2, %xmm2
	vmovaps	%xmm2, 144(%rsp)        ## 16-byte Spill
	vmovss	%xmm2, 172(%r15)
	vmovaps	%xmm0, 160(%rsp)        ## 16-byte Spill
	vmovaps	%xmm1, 96(%rsp)         ## 16-byte Spill
	vxorps	%xmm0, %xmm1, %xmm0
	vmovaps	%xmm0, 176(%rsp)        ## 16-byte Spill
	vmovss	%xmm0, 160(%r15)
	shlq	$3, %r13
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB4_3:                                 ## =>This Inner Loop Header: Depth=1
	movq	%r13, %rdi
	callq	_malloc
	movq	%rax, 200(%r15,%rbx,8)
	incq	%rbx
	cmpq	$256, %rbx              ## imm = 0x100
	jne	LBB4_3
## %bb.4:
	vmovaps	112(%rsp), %xmm1        ## 16-byte Reload
	vmovaps	160(%rsp), %xmm12       ## 16-byte Reload
	vxorps	%xmm12, %xmm1, %xmm0
	movq	$0, 3564(%r15)
	movl	$-1082130432, 3572(%r15) ## imm = 0xBF800000
	vmovss	%xmm0, 3576(%r15)
	vmovaps	128(%rsp), %xmm2        ## 16-byte Reload
	vmulss	%xmm1, %xmm2, %xmm4
	vmulss	%xmm0, %xmm2, %xmm5
	vsubss	%xmm5, %xmm4, %xmm10
	vmovaps	96(%rsp), %xmm3         ## 16-byte Reload
	vmulss	%xmm1, %xmm3, %xmm6
	vsubss	%xmm6, %xmm6, %xmm13
	vinsertps	$16, %xmm13, %xmm10, %xmm7 ## xmm7 = xmm10[0],xmm13[0],xmm10[2,3]
	vmulss	176(%rsp), %xmm2, %xmm1 ## 16-byte Folded Reload
	vmulss	%xmm2, %xmm3, %xmm2
	vsubss	%xmm2, %xmm1, %xmm11
	vmovlps	%xmm7, 3580(%r15)
	vmovss	%xmm11, 3588(%r15)
	movl	$0, 3592(%r15)
	vsubss	%xmm4, %xmm5, %xmm1
	vmulss	%xmm0, %xmm3, %xmm0
	vsubss	%xmm0, %xmm0, %xmm14
	vmovaps	%xmm1, 128(%rsp)        ## 16-byte Spill
	vinsertps	$16, %xmm14, %xmm1, %xmm7 ## xmm7 = xmm1[0],xmm14[0],xmm1[2,3]
	vmulss	144(%rsp), %xmm3, %xmm1 ## 16-byte Folded Reload
	vsubss	%xmm2, %xmm1, %xmm15
	vmovlps	%xmm7, 3596(%r15)
	vmovss	%xmm15, 3604(%r15)
	movl	$0, 3608(%r15)
	vsubss	%xmm5, %xmm5, %xmm1
	vsubss	%xmm6, %xmm0, %xmm2
	vmovaps	%xmm2, 144(%rsp)        ## 16-byte Spill
	vinsertps	$16, %xmm2, %xmm1, %xmm2 ## xmm2 = xmm1[0],xmm2[0],xmm1[2,3]
	vmovlps	%xmm2, 3612(%r15)
	vmovss	%xmm11, 3620(%r15)
	movl	$0, 3624(%r15)
	vsubss	%xmm4, %xmm4, %xmm2
	vsubss	%xmm0, %xmm6, %xmm0
	vmovaps	%xmm2, 112(%rsp)        ## 16-byte Spill
	vmovaps	%xmm0, 96(%rsp)         ## 16-byte Spill
	vinsertps	$16, %xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0],xmm2[2,3]
	vmovlps	%xmm0, 3628(%r15)
	vmovss	%xmm15, 3636(%r15)
	movl	$0, 3640(%r15)
	vmovsd	3564(%r15), %xmm4       ## xmm4 = mem[0],zero
	vmulss	%xmm4, %xmm4, %xmm0
	vmovshdup	%xmm4, %xmm6    ## xmm6 = xmm4[1,1,3,3]
	vmulss	%xmm6, %xmm6, %xmm2
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	LCPI4_3(%rip), %xmm0, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm0
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm7, %xmm7, %xmm7
	vmovss	LCPI4_4(%rip), %xmm2    ## xmm2 = mem[0],zero,zero,zero
	vucomiss	%xmm0, %xmm2
	vxorps	%xmm8, %xmm8, %xmm8
	vxorps	%xmm9, %xmm9, %xmm9
	jae	LBB4_6
## %bb.5:
	vmovss	LCPI4_3(%rip), %xmm2    ## xmm2 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm2, %xmm0
	vmulss	%xmm0, %xmm4, %xmm2
	vmulss	%xmm0, %xmm6, %xmm4
	vinsertps	$16, %xmm4, %xmm2, %xmm8 ## xmm8 = xmm2[0],xmm4[0],xmm2[2,3]
	vxorps	%xmm12, %xmm0, %xmm9
LBB4_6:
	vmovaps	%xmm1, %xmm12
	vmovlps	%xmm8, 3564(%r15)
	vmovss	%xmm9, 3572(%r15)
	vmulss	%xmm10, %xmm10, %xmm0
	vmulss	%xmm13, %xmm13, %xmm2
	vaddss	%xmm2, %xmm0, %xmm0
	vmulss	%xmm11, %xmm11, %xmm4
	vaddss	%xmm0, %xmm4, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm0
	vmovss	LCPI4_4(%rip), %xmm8    ## xmm8 = mem[0],zero,zero,zero
	vucomiss	%xmm0, %xmm8
	jae	LBB4_8
## %bb.7:
	vmovss	LCPI4_3(%rip), %xmm2    ## xmm2 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm2, %xmm0
	vmulss	%xmm0, %xmm10, %xmm2
	vmulss	%xmm0, %xmm13, %xmm3
	vinsertps	$16, %xmm3, %xmm2, %xmm7 ## xmm7 = xmm2[0],xmm3[0],xmm2[2,3]
	vmulss	%xmm0, %xmm11, %xmm5
LBB4_8:
	vmovlps	%xmm7, 3580(%r15)
	vmovss	%xmm5, 3588(%r15)
	vmovaps	128(%rsp), %xmm1        ## 16-byte Reload
	vmulss	%xmm1, %xmm1, %xmm0
	vmulss	%xmm14, %xmm14, %xmm2
	vaddss	%xmm2, %xmm0, %xmm0
	vmulss	%xmm15, %xmm15, %xmm2
	vaddss	%xmm0, %xmm2, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm6
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm5, %xmm5, %xmm5
	vucomiss	%xmm6, %xmm8
	vxorps	%xmm0, %xmm0, %xmm0
	vxorps	%xmm7, %xmm7, %xmm7
	jae	LBB4_10
## %bb.9:
	vmovss	LCPI4_3(%rip), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	vdivss	%xmm6, %xmm0, %xmm6
	vmulss	%xmm6, %xmm1, %xmm0
	vmulss	%xmm6, %xmm14, %xmm7
	vinsertps	$16, %xmm7, %xmm0, %xmm0 ## xmm0 = xmm0[0],xmm7[0],xmm0[2,3]
	vmulss	%xmm6, %xmm15, %xmm7
LBB4_10:
	vmovlps	%xmm0, 3596(%r15)
	vmovss	%xmm7, 3604(%r15)
	vmulss	%xmm12, %xmm12, %xmm0
	vmovaps	144(%rsp), %xmm7        ## 16-byte Reload
	vmulss	%xmm7, %xmm7, %xmm6
	vaddss	%xmm6, %xmm0, %xmm0
	vaddss	%xmm0, %xmm4, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm0
	vucomiss	%xmm0, %xmm8
	jae	LBB4_12
## %bb.11:
	vmovss	LCPI4_3(%rip), %xmm3    ## xmm3 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm3, %xmm0
	vmulss	%xmm0, %xmm12, %xmm1
	vmulss	%xmm0, %xmm7, %xmm3
	vinsertps	$16, %xmm3, %xmm1, %xmm5 ## xmm5 = xmm1[0],xmm3[0],xmm1[2,3]
	vmulss	%xmm0, %xmm11, %xmm3
LBB4_12:
	vmovlps	%xmm5, 3612(%r15)
	vmovss	%xmm3, 3620(%r15)
	vmovaps	112(%rsp), %xmm3        ## 16-byte Reload
	vmulss	%xmm3, %xmm3, %xmm0
	vmovaps	96(%rsp), %xmm4         ## 16-byte Reload
	vmulss	%xmm4, %xmm4, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vaddss	%xmm0, %xmm2, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm0
	vucomiss	%xmm0, %xmm8
	jae	LBB4_13
## %bb.14:
	vmovss	LCPI4_3(%rip), %xmm1    ## xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm1, %xmm0
	vmulss	%xmm0, %xmm3, %xmm1
	vmulss	%xmm0, %xmm4, %xmm2
	vinsertps	$16, %xmm2, %xmm1, %xmm1 ## xmm1 = xmm1[0],xmm2[0],xmm1[2,3]
	vmulss	%xmm0, %xmm15, %xmm0
	jmp	LBB4_15
LBB4_13:
	vxorps	%xmm0, %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
LBB4_15:
	vmovlps	%xmm1, 3628(%r15)
	vmovss	%xmm0, 3636(%r15)
	movl	92(%rsp), %eax          ## 4-byte Reload
	movl	%eax, 176(%r15)
	vmovaps	LCPI4_5(%rip), %xmm0    ## xmm0 = <2.5E-1,7.5E-1,u,u>
	vbroadcastss	LCPI4_6(%rip), %xmm1 ## xmm1 = [7.5E-1,7.5E-1,7.5E-1,7.5E-1]
	vinsertf128	$1, %xmm1, %ymm0, %ymm0
	vbroadcastss	LCPI4_7(%rip), %xmm1 ## xmm1 = [2.5E-1,2.5E-1,2.5E-1,2.5E-1]
	vinsertf128	$1, LCPI4_8(%rip), %ymm1, %ymm1
	vunpcklpd	%ymm0, %ymm1, %ymm0 ## ymm0 = ymm1[0],ymm0[0],ymm1[2],ymm0[2]
	vpermpd	$216, %ymm0, %ymm0      ## ymm0 = ymm0[0,2,1,3]
	vmovups	%ymm0, 192(%rsp)
	vmovaps	LCPI4_9(%rip), %ymm0    ## ymm0 = [1048576000,1061158912,1048576000,1061158912,1048576000,1061158912,1048576000,1061158912]
	vmovaps	%ymm0, (%rsp)
	vmovaps	LCPI4_10(%rip), %ymm1   ## ymm1 = [1048576000,1048576000,1061158912,1061158912,1048576000,1048576000,1061158912,1061158912]
	vmovaps	%ymm1, 32(%rsp)
	vmovaps	%ymm0, 3296(%r15)
	vmovaps	%ymm1, 3328(%r15)
	vmovaps	LCPI4_11(%rip), %xmm0   ## xmm0 = [1061158912,1048576000,1061158912,1048576000]
	vmovaps	%xmm0, (%rsp)
	vmovaps	LCPI4_12(%rip), %xmm0   ## xmm0 = [1048576000,1061158912,1061158912,1048576000]
	vmovaps	%xmm0, 32(%rsp)
	movl	$1061158912, 16(%rsp)   ## imm = 0x3F400000
	movl	$1048576000, 48(%rsp)   ## imm = 0x3E800000
	movabsq	$4557642823947517952, %rax ## imm = 0x3F4000003E800000
	movq	%rax, 20(%rsp)
	movabsq	$4557642823960100864, %rax ## imm = 0x3F4000003F400000
	movq	%rax, 52(%rsp)
	movl	192(%rsp), %r9d
	movl	196(%rsp), %r10d
	movl	%r9d, 28(%rsp)
	movl	%r10d, 60(%rsp)
	vmovups	(%rsp), %xmm0
	vmovups	%xmm0, 3360(%r15)
	movl	16(%rsp), %eax
	movl	%eax, 3376(%r15)
	movq	20(%rsp), %rax
	movq	%rax, 3380(%r15)
	movl	28(%rsp), %eax
	movl	%eax, 3388(%r15)
	vmovups	32(%rsp), %xmm0
	vmovups	%xmm0, 3392(%r15)
	movl	48(%rsp), %eax
	movl	%eax, 3408(%r15)
	movq	52(%rsp), %rax
	movq	%rax, 3412(%r15)
	movl	60(%rsp), %eax
	movl	%eax, 3420(%r15)
	movl	208(%rsp), %r8d
	movl	%r8d, (%rsp)
	movl	212(%rsp), %esi
	movl	%esi, 32(%rsp)
	movl	216(%rsp), %edi
	movl	%edi, 4(%rsp)
	movl	220(%rsp), %ebx
	movl	%ebx, 36(%rsp)
	movl	%r9d, 8(%rsp)
	movl	%r10d, 40(%rsp)
	movl	200(%rsp), %edx
	movl	204(%rsp), %eax
	movl	%edx, 12(%rsp)
	movl	%eax, 44(%rsp)
	movl	%r8d, 16(%rsp)
	movl	%esi, 48(%rsp)
	movl	%edi, 20(%rsp)
	movl	%ebx, 52(%rsp)
	movl	%r9d, 24(%rsp)
	movl	%r10d, 56(%rsp)
	movl	%edx, 28(%rsp)
	movl	%eax, 60(%rsp)
	movl	(%rsp), %ecx
	movl	%ecx, 3424(%r15)
	movl	4(%rsp), %ecx
	movl	%ecx, 3428(%r15)
	movl	8(%rsp), %ecx
	movl	%ecx, 3432(%r15)
	movl	12(%rsp), %ecx
	movl	%ecx, 3436(%r15)
	movl	16(%rsp), %ecx
	movl	%ecx, 3440(%r15)
	movl	20(%rsp), %ecx
	movl	%ecx, 3444(%r15)
	movl	24(%rsp), %ecx
	movl	%ecx, 3448(%r15)
	movl	28(%rsp), %ecx
	movl	%ecx, 3452(%r15)
	vmovups	32(%rsp), %xmm0
	vmovups	%xmm0, 3456(%r15)
	movq	48(%rsp), %rcx
	movq	%rcx, 3472(%r15)
	movl	56(%rsp), %ecx
	movl	%ecx, 3480(%r15)
	movl	60(%rsp), %ecx
	movl	%ecx, 3484(%r15)
	movl	%edi, (%rsp)
	movl	%ebx, 32(%rsp)
	movl	%r9d, 4(%rsp)
	movl	%r10d, 36(%rsp)
	movl	%edx, 8(%rsp)
	movl	%eax, 40(%rsp)
	movl	%r8d, 12(%rsp)
	movl	%esi, 44(%rsp)
	movl	%edi, 16(%rsp)
	movl	%ebx, 48(%rsp)
	movl	%r9d, 20(%rsp)
	movl	%r10d, 52(%rsp)
	movl	%edx, 24(%rsp)
	movl	%eax, 56(%rsp)
	movl	%r8d, 28(%rsp)
	movl	%esi, 60(%rsp)
	movl	(%rsp), %eax
	movl	%eax, 3488(%r15)
	movl	4(%rsp), %eax
	movl	%eax, 3492(%r15)
	movl	8(%rsp), %eax
	movl	%eax, 3496(%r15)
	movl	12(%rsp), %eax
	movl	%eax, 3500(%r15)
	movl	16(%rsp), %eax
	movl	%eax, 3504(%r15)
	movl	20(%rsp), %eax
	movl	%eax, 3508(%r15)
	movl	24(%rsp), %eax
	movl	%eax, 3512(%r15)
	movl	28(%rsp), %eax
	movl	%eax, 3516(%r15)
	vmovups	32(%rsp), %xmm0
	vmovups	%xmm0, 3520(%r15)
	movq	48(%rsp), %rax
	movq	%rax, 3536(%r15)
	movl	56(%rsp), %eax
	movl	%eax, 3544(%r15)
	movl	60(%rsp), %eax
	movl	%eax, 3548(%r15)
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	224(%rsp), %rax
	jne	LBB4_18
## %bb.16:
	movq	%r15, %rax
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
LBB4_18:
	vzeroupper
	callq	___stack_chk_fail
LBB4_17:
	leaq	L___func__._Z18new_render_contextP4Game7Texturefffi(%rip), %rdi
	leaq	L_.str.5(%rip), %rsi
	leaq	L_.str.6(%rip), %rcx
	movl	$32, %edx
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function _Z15color_v3_to_u322v3
LCPI5_0:
	.long	1132396544              ## float 255
LCPI5_1:
	.long	1056964608              ## float 0.5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z15color_v3_to_u322v3
	.p2align	4, 0x90
__Z15color_v3_to_u322v3:                ## @_Z15color_v3_to_u322v3
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vmovss	LCPI5_0(%rip), %xmm2    ## xmm2 = mem[0],zero,zero,zero
	vmulss	%xmm2, %xmm0, %xmm3
	vmovss	LCPI5_1(%rip), %xmm4    ## xmm4 = mem[0],zero,zero,zero
	vaddss	%xmm4, %xmm3, %xmm3
	vcvttss2si	%xmm3, %rax
	shll	$24, %eax
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vmulss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vcvttss2si	%xmm0, %rcx
	shll	$16, %ecx
	orl	%eax, %ecx
	vmulss	%xmm2, %xmm1, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vcvttss2si	%xmm0, %rax
	shll	$8, %eax
	orl	%ecx, %eax
                                        ## kill: def $eax killed $eax killed $rax
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function _Z15color_u32_to_v3j
LCPI6_0:
	.long	998277249               ## float 0.00392156886
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z15color_u32_to_v3j
	.p2align	4, 0x90
__Z15color_u32_to_v3j:                  ## @_Z15color_u32_to_v3j
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	%edi, %eax
	movl	%edi, %ecx
	movzbl	%ah, %edx
	shrl	$24, %eax
	vcvtsi2ssl	%eax, %xmm0, %xmm0
	shrl	$16, %ecx
	movzbl	%cl, %eax
	vcvtsi2ssl	%eax, %xmm1, %xmm1
	vcvtsi2ssl	%edx, %xmm2, %xmm2
	vmovss	LCPI6_0(%rip), %xmm3    ## xmm3 = mem[0],zero,zero,zero
	vmulss	%xmm3, %xmm0, %xmm0
	vmulss	%xmm3, %xmm1, %xmm1
	vinsertps	$16, %xmm1, %xmm0, %xmm0 ## xmm0 = xmm0[0],xmm1[0],xmm0[2,3]
	vmulss	%xmm3, %xmm2, %xmm1
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function _Z12begin_renderP14Render_Context2v34m3x3S1_S1_
LCPI7_0:
	.long	1132396544              ## float 255
LCPI7_1:
	.long	1056964608              ## float 0.5
	.section	__TEXT,__const
	.p2align	5
LCPI7_2:
	.long	0                       ## 0x0
	.long	3                       ## 0x3
	.long	6                       ## 0x6
	.long	1                       ## 0x1
	.long	4                       ## 0x4
	.long	7                       ## 0x7
	.long	2                       ## 0x2
	.long	5                       ## 0x5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z12begin_renderP14Render_Context2v34m3x3S1_S1_
	.p2align	4, 0x90
__Z12begin_renderP14Render_Context2v34m3x3S1_S1_: ## @_Z12begin_renderP14Render_Context2v34m3x3S1_S1_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	subq	$48, %rsp
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	vmovss	%xmm5, -24(%rbp)        ## 4-byte Spill
	vmovaps	%xmm4, -64(%rbp)        ## 16-byte Spill
	vmovss	%xmm1, -20(%rbp)        ## 4-byte Spill
	vmovdqa	%xmm0, -48(%rbp)        ## 16-byte Spill
	movq	%rdi, %rbx
	leaq	16(%rbp), %r14
	movl	28(%rdi), %eax
	imull	24(%rdi), %eax
	testl	%eax, %eax
	jle	LBB7_3
## %bb.1:
	vmovss	LCPI7_0(%rip), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	vmulss	%xmm0, %xmm2, %xmm1
	vmovss	LCPI7_1(%rip), %xmm4    ## xmm4 = mem[0],zero,zero,zero
	vaddss	%xmm4, %xmm1, %xmm1
	vcvttss2si	%xmm1, %rax
	vmovshdup	%xmm2, %xmm1    ## xmm1 = xmm2[1,1,3,3]
	vmulss	%xmm0, %xmm1, %xmm1
	vaddss	%xmm4, %xmm1, %xmm1
	vcvttss2si	%xmm1, %rcx
	shll	$24, %eax
	shll	$16, %ecx
	orl	%eax, %ecx
	vmulss	%xmm0, %xmm3, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vcvttss2si	%xmm0, %rax
	shll	$8, %eax
	orl	%ecx, %eax
	vmovd	%eax, %xmm0
	vpbroadcastd	%xmm0, %ymm0
	vbroadcastss	60(%rbx), %ymm1
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB7_2:                                 ## =>This Inner Loop Header: Depth=1
	movq	48(%rbx), %rcx
	vmovups	%ymm1, (%rcx,%rax,4)
	movq	40(%rbx), %rcx
	vmovdqu	%ymm0, (%rcx,%rax,4)
	addq	$8, %rax
	movslq	24(%rbx), %rcx
	movslq	28(%rbx), %rdx
	imulq	%rcx, %rdx
	cmpq	%rdx, %rax
	jl	LBB7_2
LBB7_3:
	movl	$0, 192(%rbx)
	leaq	2248(%rbx), %rdi
	movl	$1024, %esi             ## imm = 0x400
	vzeroupper
	callq	___bzero
	vmovaps	-48(%rbp), %xmm0        ## 16-byte Reload
	vmovlps	%xmm0, 64(%rbx)
	vmovss	-20(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 72(%rbx)
	vmovups	(%r14), %ymm0
	vmovups	%ymm0, 76(%rbx)
	movl	32(%r14), %eax
	movl	%eax, 108(%rbx)
	vmovaps	LCPI7_2(%rip), %ymm0    ## ymm0 = [0,3,6,1,4,7,2,5]
	vpermps	76(%rbx), %ymm0, %ymm0
	vmovups	%ymm0, 112(%rbx)
	movl	%eax, 144(%rbx)
	vmovaps	-64(%rbp), %xmm0        ## 16-byte Reload
	vmovlps	%xmm0, 3552(%rbx)
	vmovss	-24(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 3560(%rbx)
	addq	$48, %rsp
	popq	%rbx
	popq	%r14
	popq	%rbp
	vzeroupper
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z15world_to_cameraP14Render_Context2v3 ## -- Begin function _Z15world_to_cameraP14Render_Context2v3
	.p2align	4, 0x90
__Z15world_to_cameraP14Render_Context2v3: ## @_Z15world_to_cameraP14Render_Context2v3
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vmovsd	64(%rdi), %xmm2         ## xmm2 = mem[0],zero
	vmovsd	112(%rdi), %xmm3        ## xmm3 = mem[0],zero
	vmovsd	124(%rdi), %xmm4        ## xmm4 = mem[0],zero
	vmovsd	136(%rdi), %xmm5        ## xmm5 = mem[0],zero
	vsubss	72(%rdi), %xmm1, %xmm1
	vsubps	%xmm2, %xmm0, %xmm2
	vmulps	%xmm2, %xmm3, %xmm0
	vxorps	%xmm3, %xmm3, %xmm3
	vaddss	%xmm3, %xmm0, %xmm6
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vaddss	%xmm6, %xmm0, %xmm0
	vmulss	120(%rdi), %xmm1, %xmm6
	vaddss	%xmm0, %xmm6, %xmm0
	vmulps	%xmm2, %xmm4, %xmm4
	vaddss	%xmm3, %xmm4, %xmm6
	vmovshdup	%xmm4, %xmm4    ## xmm4 = xmm4[1,1,3,3]
	vaddss	%xmm6, %xmm4, %xmm4
	vmulss	132(%rdi), %xmm1, %xmm6
	vaddss	%xmm4, %xmm6, %xmm4
	vinsertps	$16, %xmm4, %xmm0, %xmm0 ## xmm0 = xmm0[0],xmm4[0],xmm0[2,3]
	vmulps	%xmm2, %xmm5, %xmm2
	vaddss	%xmm3, %xmm2, %xmm3
	vmovshdup	%xmm2, %xmm2    ## xmm2 = xmm2[1,1,3,3]
	vaddss	%xmm3, %xmm2, %xmm2
	vmulss	144(%rdi), %xmm1, %xmm1
	vaddss	%xmm2, %xmm1, %xmm1
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z15camera_to_worldP14Render_Context2v3 ## -- Begin function _Z15camera_to_worldP14Render_Context2v3
	.p2align	4, 0x90
__Z15camera_to_worldP14Render_Context2v3: ## @_Z15camera_to_worldP14Render_Context2v3
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vmovss	76(%rdi), %xmm2         ## xmm2 = mem[0],zero,zero,zero
	vmovss	80(%rdi), %xmm3         ## xmm3 = mem[0],zero,zero,zero
	vmovss	84(%rdi), %xmm4         ## xmm4 = mem[0],zero,zero,zero
	vmovshdup	%xmm0, %xmm5    ## xmm5 = xmm0[1,1,3,3]
	vbroadcastss	%xmm0, %xmm6
	vinsertps	$16, 88(%rdi), %xmm2, %xmm2 ## xmm2 = xmm2[0],mem[0],xmm2[2,3]
	vmulps	%xmm2, %xmm6, %xmm2
	vxorps	%xmm6, %xmm6, %xmm6
	vaddps	%xmm6, %xmm2, %xmm2
	vinsertps	$16, 92(%rdi), %xmm3, %xmm3 ## xmm3 = xmm3[0],mem[0],xmm3[2,3]
	vmulps	%xmm3, %xmm5, %xmm3
	vaddps	%xmm3, %xmm2, %xmm2
	vbroadcastss	%xmm1, %xmm3
	vinsertps	$16, 96(%rdi), %xmm4, %xmm4 ## xmm4 = xmm4[0],mem[0],xmm4[2,3]
	vmulps	%xmm4, %xmm3, %xmm3
	vaddps	%xmm3, %xmm2, %xmm2
	vmulss	100(%rdi), %xmm0, %xmm0
	vxorps	%xmm3, %xmm3, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vmulss	104(%rdi), %xmm5, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vmulss	108(%rdi), %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm1
	vmovsd	64(%rdi), %xmm0         ## xmm0 = mem[0],zero
	vaddps	%xmm0, %xmm2, %xmm0
	vaddss	72(%rdi), %xmm1, %xmm1
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function _Z22prespective_projectionP14Render_Context2v3
LCPI10_0:
	.long	3221225472              ## float -2
LCPI10_1:
	.long	1065353216              ## float 1
LCPI10_2:
	.long	1056964608              ## float 0.5
LCPI10_3:
	.long	3212836864              ## float -1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z22prespective_projectionP14Render_Context2v3
	.p2align	4, 0x90
__Z22prespective_projectionP14Render_Context2v3: ## @_Z22prespective_projectionP14Render_Context2v3
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	vmovss	56(%rdi), %xmm2         ## xmm2 = mem[0],zero,zero,zero
	vmulss	%xmm2, %xmm0, %xmm3
	vdivss	%xmm1, %xmm3, %xmm3
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vmulss	%xmm2, %xmm0, %xmm0
	vdivss	%xmm1, %xmm0, %xmm0
	vmulss	LCPI10_0(%rip), %xmm3, %xmm2
	vdivss	152(%rdi), %xmm2, %xmm2
	vaddss	%xmm0, %xmm0, %xmm0
	vdivss	156(%rdi), %xmm0, %xmm0
	vmovss	LCPI10_1(%rip), %xmm3   ## xmm3 = mem[0],zero,zero,zero
	vaddss	%xmm3, %xmm2, %xmm2
	vcvtsi2ssl	(%rdi), %xmm4, %xmm4
	vmovss	LCPI10_2(%rip), %xmm5   ## xmm5 = mem[0],zero,zero,zero
	vmulss	%xmm5, %xmm2, %xmm2
	vmulss	%xmm4, %xmm2, %xmm2
	vaddss	%xmm3, %xmm0, %xmm0
	vmulss	%xmm5, %xmm0, %xmm0
	vcvtsi2ssl	4(%rdi), %xmm6, %xmm3
	vmulss	%xmm3, %xmm0, %xmm0
	vinsertps	$16, %xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0],xmm2[2,3]
	vmovss	LCPI10_3(%rip), %xmm2   ## xmm2 = mem[0],zero,zero,zero
	vdivss	%xmm1, %xmm2, %xmm1
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z20get_tile_clip_boundsP14Render_ContextiR2v2S2_ ## -- Begin function _Z20get_tile_clip_boundsP14Render_ContextiR2v2S2_
	.p2align	4, 0x90
__Z20get_tile_clip_boundsP14Render_ContextiR2v2S2_: ## @_Z20get_tile_clip_boundsP14Render_ContextiR2v2S2_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	(%rdi), %r8d
	movl	4(%rdi), %r9d
	movl	%r8d, %r10d
	sarl	$31, %r10d
	shrl	$28, %r10d
	addl	%r8d, %r10d
	sarl	$4, %r10d
	movl	%esi, %eax
	sarl	$31, %eax
	shrl	$28, %eax
	addl	%esi, %eax
	movl	%eax, %edi
	andl	$-16, %edi
	subl	%edi, %esi
	imull	%r10d, %esi
	sarl	$4, %eax
	movl	%r9d, %edi
	sarl	$31, %edi
	shrl	$28, %edi
	addl	%r9d, %edi
	sarl	$4, %edi
	vcvtsi2ssl	%esi, %xmm0, %xmm0
	imull	%edi, %eax
	vcvtsi2ssl	%eax, %xmm1, %xmm1
	addl	%esi, %r10d
	vcvtsi2ssl	%r10d, %xmm2, %xmm2
	addl	%eax, %edi
	vcvtsi2ssl	%edi, %xmm3, %xmm3
	vinsertps	$16, %xmm1, %xmm0, %xmm0 ## xmm0 = xmm0[0],xmm1[0],xmm0[2,3]
	vmovlps	%xmm0, (%rdx)
	vinsertps	$16, %xmm3, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm3[0],xmm2[2,3]
	vmovlps	%xmm0, (%rcx)
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function _Z13push_triangleP14Render_ContextP8Triangle
LCPI12_0:
	.long	2147483648              ## float -0
LCPI12_1:
	.long	1065353216              ## float 1
LCPI12_2:
	.long	925353388               ## float 9.99999974E-6
LCPI12_3:
	.long	3221225472              ## float -2
LCPI12_4:
	.long	1056964608              ## float 0.5
LCPI12_5:
	.long	3212836864              ## float -1
LCPI12_6:
	.long	0                       ## float 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z13push_triangleP14Render_ContextP8Triangle
	.p2align	4, 0x90
__Z13push_triangleP14Render_ContextP8Triangle: ## @_Z13push_triangleP14Render_ContextP8Triangle
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
	subq	$5912, %rsp             ## imm = 0x1718
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	160(%rsi), %rax
	movq	%rax, -2576(%rbp)
	vmovups	128(%rsi), %ymm0
	vmovups	%ymm0, -2608(%rbp)
	vmovups	(%rsi), %ymm0
	vmovups	32(%rsi), %ymm1
	vmovups	64(%rsi), %ymm2
	vmovups	96(%rsi), %ymm3
	vmovups	%ymm3, -2640(%rbp)
	vmovups	%ymm2, -2672(%rbp)
	vmovups	%ymm1, -2704(%rbp)
	vmovups	%ymm0, -2736(%rbp)
	vmovsd	(%rsi), %xmm0           ## xmm0 = mem[0],zero
	vmovss	8(%rsi), %xmm5          ## xmm5 = mem[0],zero,zero,zero
	vmovss	112(%rdi), %xmm9        ## xmm9 = mem[0],zero,zero,zero
	vmovss	116(%rdi), %xmm6        ## xmm6 = mem[0],zero,zero,zero
	vmovss	%xmm6, -5584(%rbp)      ## 4-byte Spill
	vmovss	120(%rdi), %xmm13       ## xmm13 = mem[0],zero,zero,zero
	vmovss	%xmm13, -5432(%rbp)     ## 4-byte Spill
	vmovss	124(%rdi), %xmm11       ## xmm11 = mem[0],zero,zero,zero
	vmovss	128(%rdi), %xmm10       ## xmm10 = mem[0],zero,zero,zero
	vmovss	132(%rdi), %xmm8        ## xmm8 = mem[0],zero,zero,zero
	vmovss	%xmm8, -5552(%rbp)      ## 4-byte Spill
	vmovsd	64(%rdi), %xmm7         ## xmm7 = mem[0],zero
	vmovss	72(%rdi), %xmm1         ## xmm1 = mem[0],zero,zero,zero
	vsubss	%xmm7, %xmm0, %xmm3
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vmovshdup	%xmm7, %xmm15   ## xmm15 = xmm7[1,1,3,3]
	vsubss	%xmm15, %xmm0, %xmm4
	vsubss	%xmm1, %xmm5, %xmm5
	vmovss	%xmm1, -5448(%rbp)      ## 4-byte Spill
	vmulss	%xmm3, %xmm9, %xmm0
	vmovss	%xmm9, -5440(%rbp)      ## 4-byte Spill
	vxorps	%xmm12, %xmm12, %xmm12
	vaddss	%xmm12, %xmm0, %xmm0
	vmulss	%xmm4, %xmm6, %xmm2
	vaddss	%xmm0, %xmm2, %xmm0
	vmulss	%xmm5, %xmm13, %xmm2
	vaddss	%xmm0, %xmm2, %xmm0
	vmulss	%xmm3, %xmm11, %xmm2
	vaddss	%xmm12, %xmm2, %xmm2
	vmulss	%xmm4, %xmm10, %xmm6
	vmovss	%xmm10, -5472(%rbp)     ## 4-byte Spill
	vaddss	%xmm2, %xmm6, %xmm2
	vmulss	%xmm5, %xmm8, %xmm6
	vaddss	%xmm2, %xmm6, %xmm6
	vmovss	136(%rdi), %xmm14       ## xmm14 = mem[0],zero,zero,zero
	vinsertps	$16, %xmm6, %xmm0, %xmm6 ## xmm6 = xmm0[0],xmm6[0],xmm0[2,3]
	vmovss	140(%rdi), %xmm0        ## xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, -5504(%rbp)      ## 4-byte Spill
	vmulss	%xmm3, %xmm14, %xmm3
	vaddss	%xmm12, %xmm3, %xmm3
	vmulss	%xmm4, %xmm0, %xmm4
	vaddss	%xmm3, %xmm4, %xmm4
	vmovss	144(%rdi), %xmm13       ## xmm13 = mem[0],zero,zero,zero
	vmulss	%xmm5, %xmm13, %xmm5
	vaddss	%xmm4, %xmm5, %xmm4
	vmovlps	%xmm6, -2736(%rbp)
	vmovss	%xmm4, -2728(%rbp)
	vmovsd	12(%rsi), %xmm4         ## xmm4 = mem[0],zero
	vsubss	%xmm7, %xmm4, %xmm5
	vmovshdup	%xmm4, %xmm4    ## xmm4 = xmm4[1,1,3,3]
	vsubss	%xmm15, %xmm4, %xmm4
	vmulss	%xmm5, %xmm9, %xmm6
	vaddss	%xmm12, %xmm6, %xmm6
	vmovss	-5584(%rbp), %xmm9      ## 4-byte Reload
                                        ## xmm9 = mem[0],zero,zero,zero
	vmulss	%xmm4, %xmm9, %xmm0
	vaddss	%xmm6, %xmm0, %xmm0
	vmovss	20(%rsi), %xmm6         ## xmm6 = mem[0],zero,zero,zero
	vsubss	%xmm1, %xmm6, %xmm6
	vmovss	-5432(%rbp), %xmm3      ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	vmulss	%xmm6, %xmm3, %xmm8
	vaddss	%xmm0, %xmm8, %xmm0
	vmulss	%xmm5, %xmm11, %xmm1
	vaddss	%xmm12, %xmm1, %xmm1
	vmulss	%xmm4, %xmm10, %xmm2
	vaddss	%xmm1, %xmm2, %xmm1
	vmovss	-5552(%rbp), %xmm8      ## 4-byte Reload
                                        ## xmm8 = mem[0],zero,zero,zero
	vmulss	%xmm6, %xmm8, %xmm2
	vaddss	%xmm1, %xmm2, %xmm1
	vinsertps	$16, %xmm1, %xmm0, %xmm0 ## xmm0 = xmm0[0],xmm1[0],xmm0[2,3]
	vmulss	%xmm5, %xmm14, %xmm1
	vaddss	%xmm12, %xmm1, %xmm1
	vmovss	-5504(%rbp), %xmm10     ## 4-byte Reload
                                        ## xmm10 = mem[0],zero,zero,zero
	vmulss	%xmm4, %xmm10, %xmm2
	vaddss	%xmm1, %xmm2, %xmm1
	vmulss	%xmm6, %xmm13, %xmm2
	vaddss	%xmm1, %xmm2, %xmm1
	vmovlps	%xmm0, -2724(%rbp)
	vmovss	%xmm1, -2716(%rbp)
	vmovsd	24(%rsi), %xmm0         ## xmm0 = mem[0],zero
	vsubss	%xmm7, %xmm0, %xmm1
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vsubss	%xmm15, %xmm0, %xmm0
	movq	%rsi, -5640(%rbp)       ## 8-byte Spill
	vmovss	32(%rsi), %xmm2         ## xmm2 = mem[0],zero,zero,zero
	vsubss	-5448(%rbp), %xmm2, %xmm2 ## 4-byte Folded Reload
	vmulss	-5440(%rbp), %xmm1, %xmm4 ## 4-byte Folded Reload
	vaddss	%xmm12, %xmm4, %xmm4
	vmulss	%xmm0, %xmm9, %xmm5
	vaddss	%xmm4, %xmm5, %xmm4
	vmulss	%xmm2, %xmm3, %xmm5
	vaddss	%xmm4, %xmm5, %xmm4
	vmulss	%xmm1, %xmm11, %xmm5
	vaddss	%xmm12, %xmm5, %xmm5
	vmulss	-5472(%rbp), %xmm0, %xmm6 ## 4-byte Folded Reload
	vaddss	%xmm5, %xmm6, %xmm5
	vmulss	%xmm2, %xmm8, %xmm6
	vaddss	%xmm5, %xmm6, %xmm5
	vinsertps	$16, %xmm5, %xmm4, %xmm4 ## xmm4 = xmm4[0],xmm5[0],xmm4[2,3]
	vmulss	%xmm1, %xmm14, %xmm1
	vmulss	%xmm0, %xmm10, %xmm0
	vaddss	%xmm12, %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmulss	%xmm2, %xmm13, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vmovlps	%xmm4, -2712(%rbp)
	vmovss	%xmm0, -2704(%rbp)
	movl	$1, %r9d
	xorl	%r10d, %r10d
	movq	%rdi, -5480(%rbp)       ## 8-byte Spill
	.p2align	4, 0x90
LBB12_1:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB12_3 Depth 2
                                        ##     Child Loop BB12_63 Depth 2
                                        ##     Child Loop BB12_35 Depth 2
	testl	%r9d, %r9d
	jle	LBB12_64
## %bb.2:                               ##   in Loop: Header=BB12_1 Depth=1
	movq	%r10, -5648(%rbp)       ## 8-byte Spill
	movq	%r10, %rax
	shlq	$4, %rax
	vmovsd	3564(%rdi,%rax), %xmm2  ## xmm2 = mem[0],zero
	vmovss	3572(%rdi,%rax), %xmm0  ## xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, -5440(%rbp)      ## 4-byte Spill
	vmovshdup	%xmm2, %xmm0    ## xmm0 = xmm2[1,1,3,3]
	vmovaps	%xmm0, -5552(%rbp)      ## 16-byte Spill
	vmovss	3576(%rdi,%rax), %xmm6  ## xmm6 = mem[0],zero,zero,zero
	vbroadcastss	LCPI12_0(%rip), %xmm4 ## xmm4 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	vxorps	%xmm4, %xmm6, %xmm0
	vmovaps	%xmm0, -5808(%rbp)      ## 16-byte Spill
	movl	%r9d, %r11d
	xorl	%r9d, %r9d
	leaq	-2736(%rbp), %rax
	vmovaps	%xmm6, -5712(%rbp)      ## 16-byte Spill
	vmovaps	%xmm2, -5472(%rbp)      ## 16-byte Spill
	vmovaps	%xmm4, -5696(%rbp)      ## 16-byte Spill
	.p2align	4, 0x90
LBB12_3:                                ##   Parent Loop BB12_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	vmovsd	(%rax), %xmm9           ## xmm9 = mem[0],zero
	vmovshdup	%xmm9, %xmm14   ## xmm14 = xmm9[1,1,3,3]
	vmovss	8(%rax), %xmm7          ## xmm7 = mem[0],zero,zero,zero
	vmovsd	12(%rax), %xmm5         ## xmm5 = mem[0],zero
	vmovshdup	%xmm5, %xmm11   ## xmm11 = xmm5[1,1,3,3]
	vmovss	20(%rax), %xmm13        ## xmm13 = mem[0],zero,zero,zero
	vmovsd	24(%rax), %xmm3         ## xmm3 = mem[0],zero
	vmovshdup	%xmm3, %xmm15   ## xmm15 = xmm3[1,1,3,3]
	vmovss	32(%rax), %xmm12        ## xmm12 = mem[0],zero,zero,zero
	vmulss	%xmm2, %xmm9, %xmm0
	vmovaps	-5552(%rbp), %xmm8      ## 16-byte Reload
	vmulss	%xmm8, %xmm14, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	-5440(%rbp), %xmm10     ## 4-byte Reload
                                        ## xmm10 = mem[0],zero,zero,zero
	vmovss	%xmm7, -5432(%rbp)      ## 4-byte Spill
	vmulss	%xmm10, %xmm7, %xmm1
	vaddss	%xmm0, %xmm1, %xmm7
	vmulss	%xmm2, %xmm5, %xmm0
	vmulss	%xmm8, %xmm11, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmulss	%xmm10, %xmm13, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vmulss	%xmm2, %xmm3, %xmm1
	vmulss	%xmm8, %xmm15, %xmm2
	vaddss	%xmm2, %xmm1, %xmm1
	vmulss	%xmm10, %xmm12, %xmm2
	vaddss	%xmm1, %xmm2, %xmm2
	vxorps	%xmm4, %xmm7, %xmm1
	xorl	%esi, %esi
	vucomiss	%xmm6, %xmm1
	seta	%sil
	vxorps	%xmm4, %xmm0, %xmm0
	xorl	%edx, %edx
	vucomiss	%xmm6, %xmm0
	seta	%dl
	vxorps	%xmm4, %xmm2, %xmm2
	xorl	%ebx, %ebx
	vucomiss	%xmm6, %xmm2
	seta	%bl
	addl	%esi, %edx
	addl	%ebx, %edx
	cmpl	$3, %edx
	je	LBB12_4
## %bb.37:                              ##   in Loop: Header=BB12_3 Depth=2
	testl	%edx, %edx
	jne	LBB12_39
## %bb.38:                              ##   in Loop: Header=BB12_3 Depth=2
	movslq	%r9d, %rdx
	incl	%r9d
	imulq	$168, %rdx, %rdx
	movq	160(%rax), %rsi
	movq	%rsi, -5264(%rbp,%rdx)
	vmovups	128(%rax), %ymm0
	vmovups	%ymm0, -5296(%rbp,%rdx)
	vmovups	(%rax), %ymm0
	vmovups	32(%rax), %ymm1
	vmovups	64(%rax), %ymm2
	vmovups	96(%rax), %ymm3
	vmovups	%ymm3, -5328(%rbp,%rdx)
	vmovups	%ymm2, -5360(%rbp,%rdx)
	vmovups	%ymm1, -5392(%rbp,%rdx)
	vmovups	%ymm0, -5424(%rbp,%rdx)
LBB12_4:                                ##   in Loop: Header=BB12_3 Depth=2
	movq	-5480(%rbp), %rdi       ## 8-byte Reload
	vmovaps	-5472(%rbp), %xmm2      ## 16-byte Reload
	addq	$168, %rax
	decq	%r11
	jne	LBB12_3
	jmp	LBB12_27
	.p2align	4, 0x90
LBB12_39:                               ##   in Loop: Header=BB12_3 Depth=2
	vucomiss	%xmm6, %xmm1
	vmovaps	%xmm3, %xmm1
	seta	%cl
	cmpl	$2, %edx
	sete	%bl
	vmovd	%xmm13, %edi
	movq	72(%rax), %r13
	movq	80(%rax), %r15
	movq	88(%rax), %rsi
	vmovsd	36(%rax), %xmm10        ## xmm10 = mem[0],zero
	movl	44(%rax), %r10d
	vmovsd	48(%rax), %xmm4         ## xmm4 = mem[0],zero
	movl	56(%rax), %r12d
	vmovsd	60(%rax), %xmm2         ## xmm2 = mem[0],zero
	movl	68(%rax), %r8d
	xorb	%cl, %bl
	vmovss	%xmm12, -5448(%rbp)     ## 4-byte Spill
	vmovaps	%xmm9, -5728(%rbp)      ## 16-byte Spill
	vmovaps	%xmm14, -5952(%rbp)     ## 16-byte Spill
	vmovaps	%xmm5, -5792(%rbp)      ## 16-byte Spill
	vmovss	%xmm13, -5524(%rbp)     ## 4-byte Spill
	vmovaps	%xmm11, -5776(%rbp)     ## 16-byte Spill
	vmovaps	%xmm3, -5936(%rbp)      ## 16-byte Spill
	vmovaps	%xmm15, -5920(%rbp)     ## 16-byte Spill
	je	LBB12_41
## %bb.40:                              ##   in Loop: Header=BB12_3 Depth=2
	vmovaps	%xmm1, -5760(%rbp)      ## 16-byte Spill
	movl	%edi, -5516(%rbp)       ## 4-byte Spill
	vmovaps	%xmm11, -5600(%rbp)     ## 16-byte Spill
	vmovaps	%xmm2, -5632(%rbp)      ## 16-byte Spill
	vmovss	%xmm5, -5568(%rbp)      ## 4-byte Spill
	vmovaps	%xmm15, -5504(%rbp)     ## 16-byte Spill
	vmovaps	%xmm14, %xmm15
	vmovaps	%xmm9, %xmm8
	movl	%r8d, %r14d
	movl	%r12d, %ecx
	vmovaps	%xmm4, -5616(%rbp)      ## 16-byte Spill
	movq	%rsi, %r12
	movl	%r10d, %r8d
	vmovaps	%xmm10, -5584(%rbp)     ## 16-byte Spill
	vmovss	-5432(%rbp), %xmm0      ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vmovaps	%xmm5, -5744(%rbp)      ## 16-byte Spill
	vmovss	%xmm13, -5512(%rbp)     ## 4-byte Spill
	vmovaps	%xmm12, %xmm1
	vmovaps	%xmm0, %xmm6
	vmovss	-5440(%rbp), %xmm11     ## 4-byte Reload
                                        ## xmm11 = mem[0],zero,zero,zero
	vmovaps	-5472(%rbp), %xmm13     ## 16-byte Reload
	vmovaps	-5552(%rbp), %xmm12     ## 16-byte Reload
	jmp	LBB12_50
LBB12_41:                               ##   in Loop: Header=BB12_3 Depth=2
	movq	%r13, %r14
	cmpl	$2, %edx
	sete	%cl
	vucomiss	%xmm6, %xmm0
	seta	%bl
	xorb	%cl, %bl
	movq	%rsi, %r13
	vmovaps	%xmm2, -5616(%rbp)      ## 16-byte Spill
	testb	%bl, %bl
	cmovneq	%r15, %r13
	movl	%r12d, %ecx
	cmovnel	%r8d, %ecx
	jne	LBB12_43
## %bb.42:                              ##   in Loop: Header=BB12_3 Depth=2
	vmovaps	%xmm4, -5616(%rbp)      ## 16-byte Spill
LBB12_43:                               ##   in Loop: Header=BB12_3 Depth=2
	cmovneq	%rsi, %r15
	cmovnel	%r12d, %r8d
	vmovaps	%xmm5, %xmm8
	vmovaps	-5552(%rbp), %xmm12     ## 16-byte Reload
	jne	LBB12_45
## %bb.44:                              ##   in Loop: Header=BB12_3 Depth=2
	vmovaps	%xmm2, %xmm4
	vmovaps	%xmm1, %xmm8
LBB12_45:                               ##   in Loop: Header=BB12_3 Depth=2
	vmovshdup	%xmm8, %xmm15   ## xmm15 = xmm8[1,1,3,3]
	vmovaps	%xmm13, %xmm6
	movq	%r14, %r12
	jne	LBB12_47
## %bb.46:                              ##   in Loop: Header=BB12_3 Depth=2
	vmovss	-5448(%rbp), %xmm6      ## 4-byte Reload
                                        ## xmm6 = mem[0],zero,zero,zero
	vmovaps	%xmm5, %xmm1
LBB12_47:                               ##   in Loop: Header=BB12_3 Depth=2
	vmovaps	%xmm4, -5584(%rbp)      ## 16-byte Spill
	vmovd	-5448(%rbp), %xmm0      ## 4-byte Folded Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vmovd	%xmm0, %esi
	vmovaps	%xmm1, %xmm5
	vmovshdup	%xmm1, %xmm1    ## xmm1 = xmm1[1,1,3,3]
	vmovaps	%xmm1, -5600(%rbp)      ## 16-byte Spill
	jne	LBB12_49
## %bb.48:                              ##   in Loop: Header=BB12_3 Depth=2
	vmovdqa	%xmm13, %xmm0
LBB12_49:                               ##   in Loop: Header=BB12_3 Depth=2
	vmovd	%xmm0, -5512(%rbp)      ## 4-byte Folded Spill
	cmovnel	%esi, %edi
	movl	%edi, -5516(%rbp)       ## 4-byte Spill
	vmovaps	-5472(%rbp), %xmm13     ## 16-byte Reload
	vmulss	%xmm8, %xmm13, %xmm0
	vmulss	%xmm15, %xmm12, %xmm2
	vaddss	%xmm2, %xmm0, %xmm0
	vmovss	-5440(%rbp), %xmm1      ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	vmovaps	%xmm1, %xmm11
	vmulss	%xmm6, %xmm1, %xmm2
	vaddss	%xmm0, %xmm2, %xmm7
	vmovaps	%xmm5, %xmm0
	vmovss	%xmm5, -5568(%rbp)      ## 4-byte Spill
	vmovaps	%xmm14, -5504(%rbp)     ## 16-byte Spill
	vmovaps	%xmm9, %xmm3
	vmovaps	%xmm10, -5632(%rbp)     ## 16-byte Spill
	movl	%r10d, %r14d
	vmovaps	%xmm5, -5744(%rbp)      ## 16-byte Spill
	vmovaps	%xmm9, -5760(%rbp)      ## 16-byte Spill
	vmovss	-5432(%rbp), %xmm0      ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vmovaps	%xmm0, %xmm1
LBB12_50:                               ##   in Loop: Header=BB12_3 Depth=2
	vmovaps	%xmm1, -5680(%rbp)      ## 16-byte Spill
	vmovaps	%xmm3, -5664(%rbp)      ## 16-byte Spill
	vmovaps	-5808(%rbp), %xmm0      ## 16-byte Reload
	vsubss	%xmm7, %xmm0, %xmm2
	vsubss	%xmm8, %xmm3, %xmm4
	vmovaps	-5504(%rbp), %xmm0      ## 16-byte Reload
	vsubss	%xmm15, %xmm0, %xmm5
	vmovaps	%xmm6, %xmm3
	vsubss	%xmm6, %xmm1, %xmm7
	vmulss	%xmm4, %xmm13, %xmm0
	vmulss	%xmm5, %xmm12, %xmm6
	vaddss	%xmm6, %xmm0, %xmm0
	vmulss	%xmm7, %xmm11, %xmm6
	vaddss	%xmm0, %xmm6, %xmm0
	vdivss	%xmm0, %xmm2, %xmm0
	vmulss	%xmm0, %xmm4, %xmm4
	vmulss	%xmm0, %xmm5, %xmm5
	vmulss	%xmm0, %xmm7, %xmm0
	vaddss	%xmm4, %xmm8, %xmm9
	vmovaps	%xmm12, %xmm7
	vaddss	%xmm5, %xmm15, %xmm12
	vaddss	%xmm0, %xmm3, %xmm10
	vmovss	-5568(%rbp), %xmm14     ## 4-byte Reload
                                        ## xmm14 = mem[0],zero,zero,zero
	vsubss	%xmm8, %xmm14, %xmm0
	vmovaps	%xmm13, %xmm6
	vmovaps	-5600(%rbp), %xmm13     ## 16-byte Reload
	vsubss	%xmm15, %xmm13, %xmm4
	vmovss	-5512(%rbp), %xmm1      ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	vsubss	%xmm3, %xmm1, %xmm5
	vmulss	%xmm0, %xmm6, %xmm6
	vmulss	%xmm4, %xmm7, %xmm7
	vaddss	%xmm7, %xmm6, %xmm6
	vmulss	%xmm5, %xmm11, %xmm7
	vaddss	%xmm6, %xmm7, %xmm6
	vdivss	%xmm6, %xmm2, %xmm2
	vmulss	%xmm2, %xmm0, %xmm0
	vmulss	%xmm2, %xmm4, %xmm4
	vmulss	%xmm2, %xmm5, %xmm2
	vaddss	%xmm0, %xmm8, %xmm6
	vaddss	%xmm4, %xmm15, %xmm7
	vaddss	%xmm2, %xmm3, %xmm11
	vmovaps	%xmm9, -5904(%rbp)      ## 16-byte Spill
	vinsertps	$16, %xmm8, %xmm9, %xmm0 ## xmm0 = xmm9[0],xmm8[0],xmm9[2,3]
	vbroadcastss	-5664(%rbp), %xmm2 ## 16-byte Folded Reload
	vsubps	%xmm2, %xmm0, %xmm0
	vmovaps	%xmm12, -5888(%rbp)     ## 16-byte Spill
	vinsertps	$16, %xmm15, %xmm12, %xmm2 ## xmm2 = xmm12[0],xmm15[0],xmm12[2,3]
	vbroadcastss	-5504(%rbp), %xmm4 ## 16-byte Folded Reload
	vsubps	%xmm4, %xmm2, %xmm2
	vmovaps	%xmm10, -5664(%rbp)     ## 16-byte Spill
	vinsertps	$16, %xmm3, %xmm10, %xmm4 ## xmm4 = xmm10[0],xmm3[0],xmm10[2,3]
	vbroadcastss	-5680(%rbp), %xmm5 ## 16-byte Folded Reload
	vsubps	%xmm5, %xmm4, %xmm4
	vmulps	%xmm0, %xmm0, %xmm0
	vmulps	%xmm2, %xmm2, %xmm2
	vaddps	%xmm2, %xmm0, %xmm0
	vmulps	%xmm4, %xmm4, %xmm2
	vaddps	%xmm0, %xmm2, %xmm0
	vsqrtps	%xmm0, %xmm0
	vmovshdup	%xmm0, %xmm2    ## xmm2 = xmm0[1,1,3,3]
	vdivss	%xmm2, %xmm0, %xmm5
	vmovaps	%xmm6, -5872(%rbp)      ## 16-byte Spill
	vsubss	%xmm14, %xmm6, %xmm0
	vmovaps	%xmm7, -5856(%rbp)      ## 16-byte Spill
	vsubss	%xmm13, %xmm7, %xmm2
	vmovss	%xmm11, -5520(%rbp)     ## 4-byte Spill
	vsubss	%xmm1, %xmm11, %xmm4
	vmulss	%xmm0, %xmm0, %xmm0
	vmulss	%xmm2, %xmm2, %xmm2
	vaddss	%xmm2, %xmm0, %xmm0
	vmulss	%xmm4, %xmm4, %xmm2
	vaddss	%xmm0, %xmm2, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm8, -5840(%rbp)      ## 16-byte Spill
	vsubss	%xmm14, %xmm8, %xmm4
	vsubss	%xmm13, %xmm15, %xmm2
	vmovaps	%xmm3, -5824(%rbp)      ## 16-byte Spill
	vsubss	%xmm1, %xmm3, %xmm3
	vmulss	%xmm4, %xmm4, %xmm1
	vmulss	%xmm2, %xmm2, %xmm2
	vaddss	%xmm2, %xmm1, %xmm1
	vmulss	%xmm3, %xmm3, %xmm2
	vaddss	%xmm1, %xmm2, %xmm1
	vsqrtss	%xmm1, %xmm1, %xmm1
	vdivss	%xmm1, %xmm0, %xmm7
	vmovss	LCPI12_1(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vmovaps	%xmm0, %xmm15
	vsubss	%xmm5, %xmm0, %xmm1
	vmovd	%r14d, %xmm2
	vmovd	%r8d, %xmm11
	vmovaps	-5632(%rbp), %xmm4      ## 16-byte Reload
	vmulss	%xmm1, %xmm4, %xmm0
	vmovaps	-5584(%rbp), %xmm6      ## 16-byte Reload
	vmulss	%xmm5, %xmm6, %xmm3
	vaddss	%xmm0, %xmm3, %xmm3
	vmovshdup	%xmm4, %xmm0    ## xmm0 = xmm4[1,1,3,3]
	vmovshdup	%xmm6, %xmm8    ## xmm8 = xmm6[1,1,3,3]
	vmulss	%xmm1, %xmm0, %xmm0
	vmulss	%xmm5, %xmm8, %xmm4
	vaddss	%xmm0, %xmm4, %xmm0
	vmulss	%xmm2, %xmm1, %xmm2
	vmulss	%xmm11, %xmm5, %xmm4
	vaddss	%xmm2, %xmm4, %xmm4
	vmulss	%xmm3, %xmm3, %xmm2
	vmulss	%xmm0, %xmm0, %xmm6
	vaddss	%xmm6, %xmm2, %xmm2
	vmulss	%xmm4, %xmm4, %xmm6
	vaddss	%xmm2, %xmm6, %xmm2
	vmovq	%r12, %xmm9
	vbroadcastss	%xmm1, %xmm12
	vbroadcastss	%xmm5, %xmm10
	vsqrtss	%xmm2, %xmm2, %xmm13
	vmovss	LCPI12_2(%rip), %xmm1   ## xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm13, %xmm1
	vmovq	%r13, %xmm2
	vmovq	%r15, %xmm14
	vsubss	%xmm7, %xmm15, %xmm6
	vbroadcastss	%xmm6, %xmm5
	vbroadcastss	%xmm7, %xmm15
	vxorps	%xmm1, %xmm1, %xmm1
	vmovaps	%xmm1, -5568(%rbp)      ## 16-byte Spill
	vxorps	%xmm1, %xmm1, %xmm1
	vmovaps	%xmm1, -5504(%rbp)      ## 16-byte Spill
	vxorps	%xmm1, %xmm1, %xmm1
	jae	LBB12_52
## %bb.51:                              ##   in Loop: Header=BB12_3 Depth=2
	vmovss	LCPI12_1(%rip), %xmm1   ## xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm13, %xmm1, %xmm1
	vmulss	%xmm1, %xmm3, %xmm3
	vmulss	%xmm1, %xmm0, %xmm0
	vinsertps	$16, %xmm0, %xmm3, %xmm0 ## xmm0 = xmm3[0],xmm0[0],xmm3[2,3]
	vmovaps	%xmm0, -5504(%rbp)      ## 16-byte Spill
	vmulss	%xmm1, %xmm4, %xmm1
LBB12_52:                               ##   in Loop: Header=BB12_3 Depth=2
	vmovss	%xmm1, -5600(%rbp)      ## 4-byte Spill
	vmulps	%xmm9, %xmm12, %xmm9
	vmulps	%xmm2, %xmm10, %xmm10
	vmulps	%xmm14, %xmm5, %xmm12
	vmulps	%xmm2, %xmm15, %xmm14
	vmovd	%ecx, %xmm1
	vmovaps	-5616(%rbp), %xmm5      ## 16-byte Reload
	vmulss	%xmm6, %xmm5, %xmm0
	vmulss	-5584(%rbp), %xmm7, %xmm2 ## 16-byte Folded Reload
	vaddss	%xmm0, %xmm2, %xmm3
	vmovshdup	%xmm5, %xmm0    ## xmm0 = xmm5[1,1,3,3]
	vmulss	%xmm6, %xmm0, %xmm0
	vmulss	%xmm7, %xmm8, %xmm2
	vaddss	%xmm0, %xmm2, %xmm0
	vmulss	%xmm1, %xmm6, %xmm1
	vmulss	%xmm11, %xmm7, %xmm2
	vaddss	%xmm1, %xmm2, %xmm1
	vmulss	%xmm3, %xmm3, %xmm2
	vmulss	%xmm0, %xmm0, %xmm4
	vaddss	%xmm4, %xmm2, %xmm2
	vmulss	%xmm1, %xmm1, %xmm4
	vaddss	%xmm2, %xmm4, %xmm2
	vsqrtss	%xmm2, %xmm2, %xmm2
	vmovss	LCPI12_2(%rip), %xmm4   ## xmm4 = mem[0],zero,zero,zero
	vucomiss	%xmm2, %xmm4
	vxorps	%xmm13, %xmm13, %xmm13
	jae	LBB12_54
## %bb.53:                              ##   in Loop: Header=BB12_3 Depth=2
	vmovss	LCPI12_1(%rip), %xmm4   ## xmm4 = mem[0],zero,zero,zero
	vdivss	%xmm2, %xmm4, %xmm2
	vmulss	%xmm2, %xmm3, %xmm3
	vmulss	%xmm2, %xmm0, %xmm0
	vinsertps	$16, %xmm0, %xmm3, %xmm0 ## xmm0 = xmm3[0],xmm0[0],xmm3[2,3]
	vmovaps	%xmm0, -5568(%rbp)      ## 16-byte Spill
	vmulss	%xmm2, %xmm1, %xmm13
LBB12_54:                               ##   in Loop: Header=BB12_3 Depth=2
	vmovaps	-5904(%rbp), %xmm0      ## 16-byte Reload
	vinsertps	$16, -5888(%rbp), %xmm0, %xmm1 ## 16-byte Folded Reload
                                        ## xmm1 = xmm0[0],mem[0],xmm0[2,3]
	vmovaps	-5872(%rbp), %xmm0      ## 16-byte Reload
	vinsertps	$16, -5856(%rbp), %xmm0, %xmm6 ## 16-byte Folded Reload
                                        ## xmm6 = xmm0[0],mem[0],xmm0[2,3]
	vaddps	%xmm9, %xmm10, %xmm15
	vaddps	%xmm12, %xmm14, %xmm12
	leal	1(%r9), %r10d
	movslq	%r9d, %rsi
	imulq	$168, %rsi, %rsi
	leaq	-5424(%rbp,%rsi), %rbx
	cmpl	$2, %edx
	vmovss	-5432(%rbp), %xmm11     ## 4-byte Reload
                                        ## xmm11 = mem[0],zero,zero,zero
	vmovaps	-5952(%rbp), %xmm7      ## 16-byte Reload
	vmovaps	-5936(%rbp), %xmm8      ## 16-byte Reload
	vmovss	-5448(%rbp), %xmm9      ## 4-byte Reload
                                        ## xmm9 = mem[0],zero,zero,zero
	vmovaps	-5920(%rbp), %xmm10     ## 16-byte Reload
	jne	LBB12_56
## %bb.55:                              ##   in Loop: Header=BB12_3 Depth=2
	vmovlps	%xmm1, (%rbx)
	vmovaps	-5664(%rbp), %xmm1      ## 16-byte Reload
	vmovss	%xmm1, -5416(%rbp,%rsi)
	vmovlps	%xmm6, -5412(%rbp,%rsi)
	vmovss	-5520(%rbp), %xmm0      ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, -5404(%rbp,%rsi)
	vmovaps	-5840(%rbp), %xmm1      ## 16-byte Reload
	vmovlps	%xmm1, -5400(%rbp,%rsi)
	vmovaps	-5824(%rbp), %xmm1      ## 16-byte Reload
	vmovss	%xmm1, -5392(%rbp,%rsi)
	vmovaps	-5504(%rbp), %xmm0      ## 16-byte Reload
	vmovlps	%xmm0, -5388(%rbp,%rsi)
	vmovss	-5600(%rbp), %xmm0      ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, -5380(%rbp,%rsi)
	vmovaps	-5568(%rbp), %xmm0      ## 16-byte Reload
	vmovlps	%xmm0, -5376(%rbp,%rsi)
	vmovss	%xmm13, -5368(%rbp,%rsi)
	vmovaps	-5584(%rbp), %xmm1      ## 16-byte Reload
	vmovlps	%xmm1, -5364(%rbp,%rsi)
	movl	%r8d, -5356(%rbp,%rsi)
	vmovlhps	%xmm12, %xmm15, %xmm0 ## xmm0 = xmm15[0],xmm12[0]
	vmovups	%xmm0, -5352(%rbp,%rsi)
	movq	%r13, -5336(%rbp,%rsi)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, -5296(%rbp,%rsi)
	vmovups	%ymm0, -5328(%rbp,%rsi)
	movq	$0, -5264(%rbp,%rsi)
	jmp	LBB12_57
LBB12_56:                               ##   in Loop: Header=BB12_3 Depth=2
	vmovaps	-5760(%rbp), %xmm2      ## 16-byte Reload
	vmovlps	%xmm2, (%rbx)
	vmovaps	-5680(%rbp), %xmm2      ## 16-byte Reload
	vmovss	%xmm2, -5416(%rbp,%rsi)
	vmovaps	-5744(%rbp), %xmm3      ## 16-byte Reload
	vmovlps	%xmm3, -5412(%rbp,%rsi)
	movl	-5516(%rbp), %edi       ## 4-byte Reload
	movl	%edi, -5404(%rbp,%rsi)
	vmovlps	%xmm1, -5400(%rbp,%rsi)
	vmovaps	-5664(%rbp), %xmm0      ## 16-byte Reload
	vmovss	%xmm0, -5392(%rbp,%rsi)
	vmovaps	-5632(%rbp), %xmm2      ## 16-byte Reload
	vmovlps	%xmm2, -5388(%rbp,%rsi)
	movl	%r14d, -5380(%rbp,%rsi)
	vmovlps	%xmm5, -5376(%rbp,%rsi)
	movl	%ecx, -5368(%rbp,%rsi)
	vmovaps	-5504(%rbp), %xmm4      ## 16-byte Reload
	vmovlps	%xmm4, -5364(%rbp,%rsi)
	vmovss	-5600(%rbp), %xmm2      ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	vmovss	%xmm2, -5356(%rbp,%rsi)
	movq	%r12, -5352(%rbp,%rsi)
	movq	%r15, -5344(%rbp,%rsi)
	vmovlps	%xmm15, -5336(%rbp,%rsi)
	movslq	%r10d, %rbx
	imulq	$168, %rbx, %rbx
	vxorps	%xmm14, %xmm14, %xmm14
	vmovups	%ymm14, -5296(%rbp,%rsi)
	vmovups	%ymm14, -5328(%rbp,%rsi)
	movq	$0, -5264(%rbp,%rsi)
	vmovlps	%xmm3, -5424(%rbp,%rbx)
	vmovss	-5512(%rbp), %xmm3      ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	vmovss	%xmm3, -5416(%rbp,%rbx)
	vmovlps	%xmm6, -5412(%rbp,%rbx)
	vmovss	-5520(%rbp), %xmm3      ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	vmovss	%xmm3, -5404(%rbp,%rbx)
	vmovlps	%xmm1, -5400(%rbp,%rbx)
	vmovss	%xmm0, -5392(%rbp,%rbx)
	vmovlps	%xmm5, -5388(%rbp,%rbx)
	movl	%ecx, -5380(%rbp,%rbx)
	vmovaps	-5568(%rbp), %xmm0      ## 16-byte Reload
	vmovlps	%xmm0, -5376(%rbp,%rbx)
	vmovss	%xmm13, -5368(%rbp,%rbx)
	vmovlps	%xmm4, -5364(%rbp,%rbx)
	vmovss	%xmm2, -5356(%rbp,%rbx)
	vmovlhps	%xmm15, %xmm12, %xmm0 ## xmm0 = xmm12[0],xmm15[0]
	movq	%r15, -5352(%rbp,%rbx)
	vmovups	%xmm0, -5344(%rbp,%rbx)
	addl	$2, %r9d
	vmovups	%ymm14, -5296(%rbp,%rbx)
	vmovups	%ymm14, -5328(%rbp,%rbx)
	movq	$0, -5264(%rbp,%rbx)
	movl	%r9d, %r10d
LBB12_57:                               ##   in Loop: Header=BB12_3 Depth=2
	vmovaps	-5792(%rbp), %xmm1      ## 16-byte Reload
	vmovss	-5524(%rbp), %xmm4      ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	vmovaps	-5776(%rbp), %xmm3      ## 16-byte Reload
	vmovaps	-5728(%rbp), %xmm0      ## 16-byte Reload
	vsubss	%xmm0, %xmm1, %xmm2
	vsubss	%xmm7, %xmm3, %xmm3
	vsubss	%xmm11, %xmm4, %xmm1
	vsubss	%xmm0, %xmm8, %xmm4
	vsubss	%xmm7, %xmm10, %xmm5
	vsubss	%xmm11, %xmm9, %xmm6
	vmulss	%xmm6, %xmm3, %xmm0
	vmulss	%xmm5, %xmm1, %xmm7
	vsubss	%xmm7, %xmm0, %xmm8
	vmulss	%xmm4, %xmm1, %xmm1
	vmulss	%xmm6, %xmm2, %xmm6
	vsubss	%xmm6, %xmm1, %xmm9
	vmulss	%xmm5, %xmm2, %xmm2
	vmulss	%xmm4, %xmm3, %xmm3
	vsubss	%xmm3, %xmm2, %xmm10
	leal	-1(%r10), %ecx
	movslq	%ecx, %rcx
	imulq	$168, %rcx, %rsi
	vmovsd	-5412(%rbp,%rsi), %xmm12 ## xmm12 = mem[0],zero
	vmovss	-5404(%rbp,%rsi), %xmm11 ## xmm11 = mem[0],zero,zero,zero
	vmovsd	-5424(%rbp,%rsi), %xmm7 ## xmm7 = mem[0],zero
	vmovss	-5416(%rbp,%rsi), %xmm0 ## xmm0 = mem[0],zero,zero,zero
	vsubps	%xmm7, %xmm12, %xmm1
	vsubss	%xmm0, %xmm11, %xmm2
	vmovsd	-5400(%rbp,%rsi), %xmm6 ## xmm6 = mem[0],zero
	vmovss	-5392(%rbp,%rsi), %xmm13 ## xmm13 = mem[0],zero,zero,zero
	vsubps	%xmm7, %xmm6, %xmm7
	vpermilps	$225, %xmm7, %xmm3 ## xmm3 = xmm7[1,0,2,3]
	vsubss	%xmm0, %xmm13, %xmm0
	vmovshdup	%xmm1, %xmm4    ## xmm4 = xmm1[1,1,3,3]
	vmulss	%xmm0, %xmm4, %xmm4
	vmovshdup	%xmm7, %xmm5    ## xmm5 = xmm7[1,1,3,3]
	vmulss	%xmm5, %xmm2, %xmm5
	vsubss	%xmm5, %xmm4, %xmm4
	vmulss	%xmm7, %xmm2, %xmm2
	vmulss	%xmm0, %xmm1, %xmm0
	vsubss	%xmm0, %xmm2, %xmm0
	vmulps	%xmm3, %xmm1, %xmm1
	vmovshdup	%xmm1, %xmm2    ## xmm2 = xmm1[1,1,3,3]
	vsubss	%xmm2, %xmm1, %xmm1
	vmulss	%xmm4, %xmm8, %xmm2
	vmulss	%xmm0, %xmm9, %xmm0
	vaddss	%xmm0, %xmm2, %xmm0
	vmulss	%xmm1, %xmm10, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vucomiss	%xmm0, %xmm1
	jbe	LBB12_59
## %bb.58:                              ##   in Loop: Header=BB12_3 Depth=2
	leaq	-5412(%rbp,%rsi), %rcx
	vextractps	$0, %xmm6, (%rcx)
	vextractps	$0, %xmm12, 12(%rcx)
	movl	-5408(%rbp,%rsi), %r8d
	movl	-5396(%rbp,%rsi), %ebx
	movl	%ebx, -5408(%rbp,%rsi)
	movl	%r8d, -5396(%rbp,%rsi)
	vmovss	%xmm13, 8(%rcx)
	vmovss	%xmm11, 20(%rcx)
	vpermilps	$78, -5344(%rbp,%rsi), %xmm0 ## xmm0 = mem[2,3,0,1]
	vmovups	%xmm0, -5344(%rbp,%rsi)
	movl	-5376(%rbp,%rsi), %ecx
	movl	-5364(%rbp,%rsi), %ebx
	movl	%ebx, -5376(%rbp,%rsi)
	movl	%ecx, -5364(%rbp,%rsi)
	movq	-5372(%rbp,%rsi), %rcx
	movq	-5360(%rbp,%rsi), %rbx
	movq	%rbx, -5372(%rbp,%rsi)
	movq	%rcx, -5360(%rbp,%rsi)
LBB12_59:                               ##   in Loop: Header=BB12_3 Depth=2
	cmpl	$2, %edx
	movq	-5480(%rbp), %rdi       ## 8-byte Reload
	je	LBB12_60
## %bb.88:                              ##   in Loop: Header=BB12_3 Depth=2
	leal	-2(%r10), %ecx
	movslq	%ecx, %rcx
	imulq	$168, %rcx, %rdx
	vmovsd	-5412(%rbp,%rdx), %xmm12 ## xmm12 = mem[0],zero
	vmovss	-5404(%rbp,%rdx), %xmm11 ## xmm11 = mem[0],zero,zero,zero
	vmovsd	-5424(%rbp,%rdx), %xmm0 ## xmm0 = mem[0],zero
	vmovss	-5416(%rbp,%rdx), %xmm1 ## xmm1 = mem[0],zero,zero,zero
	vsubps	%xmm0, %xmm12, %xmm2
	vsubss	%xmm1, %xmm11, %xmm7
	vmovsd	-5400(%rbp,%rdx), %xmm6 ## xmm6 = mem[0],zero
	vmovss	-5392(%rbp,%rdx), %xmm13 ## xmm13 = mem[0],zero,zero,zero
	vsubps	%xmm0, %xmm6, %xmm0
	vpermilps	$225, %xmm0, %xmm3 ## xmm3 = xmm0[1,0,2,3]
	vsubss	%xmm1, %xmm13, %xmm1
	vmovshdup	%xmm2, %xmm4    ## xmm4 = xmm2[1,1,3,3]
	vmulss	%xmm1, %xmm4, %xmm4
	vmovshdup	%xmm0, %xmm5    ## xmm5 = xmm0[1,1,3,3]
	vmulss	%xmm5, %xmm7, %xmm5
	vsubss	%xmm5, %xmm4, %xmm4
	vmulss	%xmm0, %xmm7, %xmm0
	vmulss	%xmm1, %xmm2, %xmm1
	vsubss	%xmm1, %xmm0, %xmm0
	vmulps	%xmm3, %xmm2, %xmm1
	vmovshdup	%xmm1, %xmm2    ## xmm2 = xmm1[1,1,3,3]
	vsubss	%xmm2, %xmm1, %xmm1
	vmulss	%xmm4, %xmm8, %xmm2
	vmulss	%xmm0, %xmm9, %xmm0
	vaddss	%xmm0, %xmm2, %xmm0
	vmulss	%xmm1, %xmm10, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vucomiss	%xmm0, %xmm1
	jbe	LBB12_60
## %bb.89:                              ##   in Loop: Header=BB12_3 Depth=2
	leaq	-5412(%rbp,%rdx), %rcx
	vextractps	$0, %xmm6, (%rcx)
	vextractps	$0, %xmm12, 12(%rcx)
	movl	-5408(%rbp,%rdx), %esi
	movl	-5396(%rbp,%rdx), %ebx
	movl	%ebx, -5408(%rbp,%rdx)
	movl	%esi, -5396(%rbp,%rdx)
	vmovss	%xmm13, 8(%rcx)
	vmovss	%xmm11, 20(%rcx)
	vpermilps	$78, -5344(%rbp,%rdx), %xmm0 ## xmm0 = mem[2,3,0,1]
	vmovups	%xmm0, -5344(%rbp,%rdx)
	movl	-5376(%rbp,%rdx), %ecx
	movl	-5364(%rbp,%rdx), %esi
	movl	%esi, -5376(%rbp,%rdx)
	movl	%ecx, -5364(%rbp,%rdx)
	movq	-5372(%rbp,%rdx), %rcx
	movq	-5360(%rbp,%rdx), %rsi
	movq	%rsi, -5372(%rbp,%rdx)
	movq	%rcx, -5360(%rbp,%rdx)
LBB12_60:                               ##   in Loop: Header=BB12_3 Depth=2
	movl	%r10d, %r9d
	vmovaps	-5472(%rbp), %xmm2      ## 16-byte Reload
	vmovaps	-5712(%rbp), %xmm6      ## 16-byte Reload
	vmovaps	-5696(%rbp), %xmm4      ## 16-byte Reload
	addq	$168, %rax
	decq	%r11
	jne	LBB12_3
LBB12_27:                               ##   in Loop: Header=BB12_1 Depth=1
	testl	%r9d, %r9d
	setg	%r8b
	jle	LBB12_28
## %bb.31:                              ##   in Loop: Header=BB12_1 Depth=1
	movl	%r9d, %edx
	leaq	-1(%rdx), %rsi
	movl	%edx, %ecx
	andl	$3, %ecx
	cmpq	$3, %rsi
	movq	-5648(%rbp), %r10       ## 8-byte Reload
	jae	LBB12_62
## %bb.32:                              ##   in Loop: Header=BB12_1 Depth=1
	xorl	%esi, %esi
	testq	%rcx, %rcx
	jne	LBB12_34
	jmp	LBB12_36
	.p2align	4, 0x90
LBB12_28:                               ##   in Loop: Header=BB12_1 Depth=1
	xorl	%r8d, %r8d
	movq	-5648(%rbp), %r10       ## 8-byte Reload
	incq	%r10
	cmpq	$4, %r10
	ja	LBB12_5
LBB12_30:                               ##   in Loop: Header=BB12_1 Depth=1
	testl	%r9d, %r9d
	jne	LBB12_1
	jmp	LBB12_5
	.p2align	4, 0x90
LBB12_62:                               ##   in Loop: Header=BB12_1 Depth=1
	subq	%rcx, %rdx
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB12_63:                               ##   Parent Loop BB12_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	-5264(%rbp,%rbx), %rax
	movq	%rax, -2576(%rbp,%rbx)
	vmovups	-5296(%rbp,%rbx), %ymm0
	vmovups	%ymm0, -2608(%rbp,%rbx)
	vmovups	-5424(%rbp,%rbx), %ymm0
	vmovups	-5392(%rbp,%rbx), %ymm1
	vmovups	-5360(%rbp,%rbx), %ymm2
	vmovups	-5328(%rbp,%rbx), %ymm3
	vmovups	%ymm3, -2640(%rbp,%rbx)
	vmovups	%ymm2, -2672(%rbp,%rbx)
	vmovups	%ymm1, -2704(%rbp,%rbx)
	vmovups	%ymm0, -2736(%rbp,%rbx)
	vmovups	-5256(%rbp,%rbx), %ymm0
	vmovups	%ymm0, -2568(%rbp,%rbx)
	vmovups	-5224(%rbp,%rbx), %ymm0
	vmovups	%ymm0, -2536(%rbp,%rbx)
	vmovups	-5192(%rbp,%rbx), %ymm0
	vmovups	%ymm0, -2504(%rbp,%rbx)
	vmovups	-5160(%rbp,%rbx), %ymm0
	vmovups	%ymm0, -2472(%rbp,%rbx)
	vmovups	-5128(%rbp,%rbx), %ymm0
	vmovups	%ymm0, -2440(%rbp,%rbx)
	movq	-5096(%rbp,%rbx), %rax
	movq	%rax, -2408(%rbp,%rbx)
	movq	-4928(%rbp,%rbx), %rax
	movq	%rax, -2240(%rbp,%rbx)
	vmovups	-4960(%rbp,%rbx), %ymm0
	vmovups	%ymm0, -2272(%rbp,%rbx)
	vmovups	-5088(%rbp,%rbx), %ymm0
	vmovups	-5056(%rbp,%rbx), %ymm1
	vmovups	-5024(%rbp,%rbx), %ymm2
	vmovups	-4992(%rbp,%rbx), %ymm3
	vmovups	%ymm3, -2304(%rbp,%rbx)
	vmovups	%ymm2, -2336(%rbp,%rbx)
	vmovups	%ymm1, -2368(%rbp,%rbx)
	vmovups	%ymm0, -2400(%rbp,%rbx)
	vmovups	-4920(%rbp,%rbx), %ymm0
	vmovups	%ymm0, -2232(%rbp,%rbx)
	vmovups	-4888(%rbp,%rbx), %ymm0
	vmovups	%ymm0, -2200(%rbp,%rbx)
	vmovups	-4856(%rbp,%rbx), %ymm0
	vmovups	%ymm0, -2168(%rbp,%rbx)
	vmovups	-4824(%rbp,%rbx), %ymm0
	vmovups	%ymm0, -2136(%rbp,%rbx)
	vmovups	-4792(%rbp,%rbx), %ymm0
	vmovups	%ymm0, -2104(%rbp,%rbx)
	movq	-4760(%rbp,%rbx), %rax
	movq	%rax, -2072(%rbp,%rbx)
	addq	$4, %rsi
	addq	$672, %rbx              ## imm = 0x2A0
	cmpq	%rsi, %rdx
	jne	LBB12_63
## %bb.33:                              ##   in Loop: Header=BB12_1 Depth=1
	testq	%rcx, %rcx
	je	LBB12_36
LBB12_34:                               ##   in Loop: Header=BB12_1 Depth=1
	imulq	$168, %rsi, %rsi
	leaq	-2736(%rbp,%rsi), %rdx
	leaq	-5424(%rbp,%rsi), %rsi
	imulq	$168, %rcx, %rcx
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB12_35:                               ##   Parent Loop BB12_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	160(%rsi,%rbx), %rax
	movq	%rax, 160(%rdx,%rbx)
	vmovups	128(%rsi,%rbx), %ymm0
	vmovups	%ymm0, 128(%rdx,%rbx)
	vmovups	(%rsi,%rbx), %ymm0
	vmovups	32(%rsi,%rbx), %ymm1
	vmovups	64(%rsi,%rbx), %ymm2
	vmovups	96(%rsi,%rbx), %ymm3
	vmovups	%ymm3, 96(%rdx,%rbx)
	vmovups	%ymm2, 64(%rdx,%rbx)
	vmovups	%ymm1, 32(%rdx,%rbx)
	vmovups	%ymm0, (%rdx,%rbx)
	addq	$168, %rbx
	cmpq	%rbx, %rcx
	jne	LBB12_35
LBB12_36:                               ##   in Loop: Header=BB12_1 Depth=1
	movq	-5480(%rbp), %rdi       ## 8-byte Reload
	incq	%r10
	cmpq	$4, %r10
	jbe	LBB12_30
LBB12_5:
	testb	%r8b, %r8b
	je	LBB12_64
## %bb.6:
	movq	-5640(%rbp), %rax       ## 8-byte Reload
	leaq	104(%rax), %rax
	movq	%rax, -5680(%rbp)       ## 8-byte Spill
	movslq	%r9d, %rax
	movq	%rax, -5568(%rbp)       ## 8-byte Spill
	leaq	200(%rdi), %rax
	movq	%rax, -5616(%rbp)       ## 8-byte Spill
	leaq	2248(%rdi), %rax
	movq	%rax, -5728(%rbp)       ## 8-byte Spill
	xorl	%eax, %eax
	vmovss	LCPI12_5(%rip), %xmm15  ## xmm15 = mem[0],zero,zero,zero
	.p2align	4, 0x90
LBB12_7:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB12_69 Depth 2
                                        ##       Child Loop BB12_70 Depth 3
	movq	%rax, -5512(%rbp)       ## 8-byte Spill
	imulq	$168, %rax, %rax
	movq	-5640(%rbp), %rcx       ## 8-byte Reload
	movq	96(%rcx), %rcx
	movq	%rcx, -2640(%rbp,%rax)
	movq	-5680(%rbp), %rdx       ## 8-byte Reload
	movl	8(%rdx), %ecx
	movl	%ecx, -2624(%rbp,%rax)
	movq	(%rdx), %rcx
	movq	%rcx, -2632(%rbp,%rax)
	vmovsd	-2736(%rbp,%rax), %xmm0 ## xmm0 = mem[0],zero
	vmovss	-2728(%rbp,%rax), %xmm2 ## xmm2 = mem[0],zero,zero,zero
	vmovss	56(%rdi), %xmm7         ## xmm7 = mem[0],zero,zero,zero
	vmulss	%xmm7, %xmm0, %xmm1
	vdivss	%xmm2, %xmm1, %xmm1
	vmulss	LCPI12_3(%rip), %xmm1, %xmm1
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vmulss	%xmm7, %xmm0, %xmm0
	vmovss	%xmm2, -5432(%rbp)      ## 4-byte Spill
	vdivss	%xmm2, %xmm0, %xmm0
	vmovss	152(%rdi), %xmm3        ## xmm3 = mem[0],zero,zero,zero
	vdivss	%xmm3, %xmm1, %xmm1
	vaddss	%xmm0, %xmm0, %xmm0
	vmovss	156(%rdi), %xmm5        ## xmm5 = mem[0],zero,zero,zero
	vdivss	%xmm5, %xmm0, %xmm0
	vmovss	LCPI12_1(%rip), %xmm10  ## xmm10 = mem[0],zero,zero,zero
	vaddss	%xmm10, %xmm1, %xmm1
	movl	(%rdi), %r9d
	vxorps	%xmm14, %xmm14, %xmm14
	vcvtsi2ssl	%r9d, %xmm14, %xmm2
	vmovss	LCPI12_4(%rip), %xmm13  ## xmm13 = mem[0],zero,zero,zero
	vmulss	%xmm13, %xmm1, %xmm1
	movl	4(%rdi), %r8d
	vmulss	%xmm2, %xmm1, %xmm8
	vaddss	%xmm10, %xmm0, %xmm0
	vmulss	%xmm13, %xmm0, %xmm11
	vxorps	%xmm14, %xmm14, %xmm14
	vcvtsi2ssl	%r8d, %xmm14, %xmm12
	vmovsd	-2724(%rbp,%rax), %xmm0 ## xmm0 = mem[0],zero
	vmovss	-2716(%rbp,%rax), %xmm1 ## xmm1 = mem[0],zero,zero,zero
	vmulss	%xmm0, %xmm7, %xmm4
	vdivss	%xmm1, %xmm4, %xmm4
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vmulss	%xmm0, %xmm7, %xmm0
	vmovss	%xmm1, -5472(%rbp)      ## 4-byte Spill
	vdivss	%xmm1, %xmm0, %xmm0
	vaddss	%xmm4, %xmm4, %xmm4
	vdivss	%xmm3, %xmm4, %xmm4
	vaddss	%xmm0, %xmm0, %xmm0
	vdivss	%xmm5, %xmm0, %xmm0
	vsubss	%xmm4, %xmm10, %xmm4
	vmulss	%xmm13, %xmm4, %xmm4
	vmulss	%xmm2, %xmm4, %xmm6
	vaddss	%xmm10, %xmm0, %xmm0
	vmulss	%xmm13, %xmm0, %xmm0
	vmulss	%xmm12, %xmm0, %xmm0
	vmovsd	-2712(%rbp,%rax), %xmm4 ## xmm4 = mem[0],zero
	vmovss	-2704(%rbp,%rax), %xmm14 ## xmm14 = mem[0],zero,zero,zero
	vmulss	%xmm4, %xmm7, %xmm1
	vdivss	%xmm14, %xmm1, %xmm1
	vmovshdup	%xmm4, %xmm4    ## xmm4 = xmm4[1,1,3,3]
	vmulss	%xmm4, %xmm7, %xmm4
	vdivss	%xmm14, %xmm4, %xmm4
	vaddss	%xmm1, %xmm1, %xmm1
	vdivss	%xmm3, %xmm1, %xmm1
	vaddss	%xmm4, %xmm4, %xmm3
	vdivss	%xmm5, %xmm3, %xmm3
	vsubss	%xmm1, %xmm10, %xmm1
	vmulss	%xmm13, %xmm1, %xmm1
	vmulss	%xmm2, %xmm1, %xmm9
	vaddss	%xmm10, %xmm3, %xmm1
	vmulss	%xmm13, %xmm1, %xmm1
	vmulss	%xmm12, %xmm1, %xmm5
	vminss	%xmm6, %xmm9, %xmm10
	vcmpunordss	%xmm6, %xmm6, %xmm2
	vminss	%xmm0, %xmm5, %xmm4
	vcmpunordss	%xmm0, %xmm0, %xmm3
	vucomiss	%xmm6, %xmm6
	vmovaps	%xmm9, %xmm7
	jp	LBB12_9
## %bb.8:                               ##   in Loop: Header=BB12_7 Depth=1
	vmaxss	%xmm6, %xmm9, %xmm7
LBB12_9:                                ##   in Loop: Header=BB12_7 Depth=1
	vmulss	%xmm12, %xmm11, %xmm1
	vblendvps	%xmm2, %xmm9, %xmm10, %xmm2
	vblendvps	%xmm3, %xmm5, %xmm4, %xmm3
	vucomiss	%xmm8, %xmm8
	jp	LBB12_11
## %bb.10:                              ##   in Loop: Header=BB12_7 Depth=1
	vmaxss	%xmm8, %xmm7, %xmm7
LBB12_11:                               ##   in Loop: Header=BB12_7 Depth=1
	vmovss	%xmm7, -5552(%rbp)      ## 4-byte Spill
	vminss	%xmm8, %xmm2, %xmm7
	vcmpunordss	%xmm8, %xmm8, %xmm10
	vminss	%xmm1, %xmm3, %xmm12
	vcmpunordss	%xmm1, %xmm1, %xmm13
	vucomiss	%xmm0, %xmm0
	vmovaps	%xmm5, %xmm4
	jp	LBB12_13
## %bb.12:                              ##   in Loop: Header=BB12_7 Depth=1
	vmaxss	%xmm0, %xmm5, %xmm4
LBB12_13:                               ##   in Loop: Header=BB12_7 Depth=1
	vinsertps	$16, %xmm1, %xmm8, %xmm8 ## xmm8 = xmm8[0],xmm1[0],xmm8[2,3]
	vdivss	-5432(%rbp), %xmm15, %xmm11 ## 4-byte Folded Reload
	vinsertps	$16, %xmm0, %xmm6, %xmm6 ## xmm6 = xmm6[0],xmm0[0],xmm6[2,3]
	vdivss	-5472(%rbp), %xmm15, %xmm0 ## 4-byte Folded Reload
	vinsertps	$16, %xmm5, %xmm9, %xmm5 ## xmm5 = xmm9[0],xmm5[0],xmm9[2,3]
	vdivss	%xmm14, %xmm15, %xmm9
	vblendvps	%xmm10, %xmm2, %xmm7, %xmm2
	vblendvps	%xmm13, %xmm3, %xmm12, %xmm3
	vucomiss	%xmm1, %xmm1
	jp	LBB12_15
## %bb.14:                              ##   in Loop: Header=BB12_7 Depth=1
	vmaxss	%xmm1, %xmm4, %xmm4
LBB12_15:                               ##   in Loop: Header=BB12_7 Depth=1
	vroundss	$10, %xmm4, %xmm4, %xmm1
	vmovlps	%xmm8, -2620(%rbp,%rax)
	vmovss	%xmm11, -2612(%rbp,%rax)
	vmovlps	%xmm6, -2608(%rbp,%rax)
	vmovss	%xmm0, -2600(%rbp,%rax)
	vmovlps	%xmm5, -2596(%rbp,%rax)
	vmovss	%xmm9, -2588(%rbp,%rax)
	vroundss	$9, %xmm2, %xmm2, %xmm0
	vcvttss2si	%xmm0, %esi
	leaq	-2584(%rbp,%rax), %rcx
	movq	%rcx, -5440(%rbp)       ## 8-byte Spill
	movl	%esi, -2584(%rbp,%rax)
	vmovss	-5552(%rbp), %xmm0      ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vroundss	$10, %xmm0, %xmm0, %xmm0
	vcvttss2si	%xmm0, %edx
	movl	%edx, -2576(%rbp,%rax)
	vroundss	$9, %xmm3, %xmm3, %xmm0
	vcvttss2si	%xmm0, %r10d
	movl	%r10d, -2580(%rbp,%rax)
	vcvttss2si	%xmm1, %ecx
	movl	%ecx, -2572(%rbp,%rax)
	testl	%esi, %esi
	js	LBB12_16
## %bb.17:                              ##   in Loop: Header=BB12_7 Depth=1
	leaq	-2580(%rbp,%rax), %rbx
	movq	%rbx, -5432(%rbp)       ## 8-byte Spill
	testl	%r10d, %r10d
	js	LBB12_18
LBB12_19:                               ##   in Loop: Header=BB12_7 Depth=1
	leaq	-2576(%rbp,%rax), %r14
	cmpl	%edx, %r9d
	jl	LBB12_20
LBB12_21:                               ##   in Loop: Header=BB12_7 Depth=1
	leaq	-2572(%rbp,%rax), %r15
	cmpl	%ecx, %r8d
	jl	LBB12_22
LBB12_23:                               ##   in Loop: Header=BB12_7 Depth=1
	cmpl	%edx, %esi
	jge	LBB12_87
LBB12_24:                               ##   in Loop: Header=BB12_7 Depth=1
	cmpl	%ecx, %r10d
	jge	LBB12_87
## %bb.25:                              ##   in Loop: Header=BB12_7 Depth=1
	movslq	192(%rdi), %rcx
	cmpl	176(%rdi), %ecx
	jge	LBB12_26
## %bb.66:                              ##   in Loop: Header=BB12_7 Depth=1
	leaq	-2736(%rbp,%rax), %rax
	movq	184(%rdi), %rdx
	leal	1(%rcx), %esi
	movl	%esi, 192(%rdi)
	imulq	$168, %rcx, %rcx
	movq	160(%rax), %rsi
	movq	%rsi, 160(%rdx,%rcx)
	vmovups	128(%rax), %ymm0
	vmovups	%ymm0, 128(%rdx,%rcx)
	vmovups	(%rax), %ymm0
	vmovups	32(%rax), %ymm1
	vmovups	64(%rax), %ymm2
	vmovups	96(%rax), %ymm3
	vmovups	%ymm3, 96(%rdx,%rcx)
	vmovups	%ymm2, 64(%rdx,%rcx)
	vmovups	%ymm1, 32(%rdx,%rcx)
	vmovups	%ymm0, (%rdx,%rcx)
	movl	(%rdi), %eax
	movl	4(%rdi), %ecx
	movl	%eax, %esi
	sarl	$31, %esi
	shrl	$28, %esi
	addl	%eax, %esi
	sarl	$4, %esi
	movl	%ecx, %r8d
	sarl	$31, %r8d
	shrl	$28, %r8d
	addl	%ecx, %r8d
	sarl	$4, %r8d
	movq	-5440(%rbp), %r9        ## 8-byte Reload
	movl	(%r9), %eax
	cltd
	idivl	%esi
	movl	%eax, %ecx
	movq	-5432(%rbp), %rax       ## 8-byte Reload
	movl	(%rax), %eax
	cltd
	idivl	%r8d
	movl	%eax, %ebx
	movl	(%r14), %eax
	leal	-1(%rsi,%rax), %eax
	cltd
	idivl	%esi
	movq	%r9, %rsi
	movl	%eax, %r9d
	movl	(%r15), %eax
	leal	-1(%r8,%rax), %eax
	cltd
	idivl	%r8d
	cmpl	%eax, %ebx
	jge	LBB12_87
## %bb.67:                              ##   in Loop: Header=BB12_7 Depth=1
	cmpl	%r9d, %ecx
	jge	LBB12_87
## %bb.68:                              ##   in Loop: Header=BB12_7 Depth=1
	movslq	%ecx, %r8
	movslq	%ebx, %rdx
	movslq	%r9d, %r13
	cltq
	movq	%rax, -5504(%rbp)       ## 8-byte Spill
	movq	-5616(%rbp), %rax       ## 8-byte Reload
	leaq	(%rax,%r8,8), %rax
	movq	%rax, -5448(%rbp)       ## 8-byte Spill
	shll	$4, %ebx
	movq	-5728(%rbp), %rax       ## 8-byte Reload
	leaq	(%rax,%r8,4), %rax
	movq	%rax, -5632(%rbp)       ## 8-byte Spill
	addl	%ebx, %ecx
	subq	%r8, %r13
	.p2align	4, 0x90
LBB12_69:                               ##   Parent Loop BB12_7 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB12_70 Depth 3
	movq	%rdx, -5584(%rbp)       ## 8-byte Spill
	movl	%ebx, -5552(%rbp)       ## 4-byte Spill
	movslq	%ebx, %rax
	movq	-5448(%rbp), %rdx       ## 8-byte Reload
	leaq	(%rdx,%rax,8), %rdx
	movq	%rdx, -5472(%rbp)       ## 8-byte Spill
	movq	-5632(%rbp), %rdx       ## 8-byte Reload
	leaq	(%rdx,%rax,4), %r12
	xorl	%r9d, %r9d
	.p2align	4, 0x90
LBB12_70:                               ##   Parent Loop BB12_7 Depth=1
                                        ##     Parent Loop BB12_69 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	leal	(%rcx,%r9), %ebx
	movl	(%rdi), %edx
	movl	4(%rdi), %r11d
	movl	%edx, %r10d
	sarl	$31, %r10d
	shrl	$28, %r10d
	addl	%edx, %r10d
	sarl	$4, %r10d
	movl	%ebx, %eax
	sarl	$31, %eax
	shrl	$28, %eax
	addl	%ebx, %eax
	movl	%eax, %edx
	andl	$-16, %edx
	subl	%edx, %ebx
	imull	%r10d, %ebx
	sarl	$4, %eax
	movl	%r11d, %r8d
	sarl	$31, %r8d
	shrl	$28, %r8d
	addl	%r11d, %r8d
	sarl	$4, %r8d
	vcvtsi2ssl	%ebx, %xmm7, %xmm0
	imull	%r8d, %eax
	vcvtsi2ssl	%eax, %xmm7, %xmm3
	addl	%ebx, %r10d
	vcvtsi2ssl	%r10d, %xmm7, %xmm4
	vcvtsi2ssl	(%rsi), %xmm7, %xmm1
	addl	%eax, %r8d
	vucomiss	%xmm1, %xmm0
	vmovaps	%xmm0, %xmm5
	ja	LBB12_73
## %bb.71:                              ##   in Loop: Header=BB12_70 Depth=3
	vucomiss	%xmm4, %xmm1
	vmovaps	%xmm1, %xmm5
	jbe	LBB12_73
## %bb.72:                              ##   in Loop: Header=BB12_70 Depth=3
	vmovaps	%xmm4, %xmm5
LBB12_73:                               ##   in Loop: Header=BB12_70 Depth=3
	vcvtsi2ssl	%r8d, %xmm7, %xmm2
	movq	-5432(%rbp), %rax       ## 8-byte Reload
	vcvtsi2ssl	(%rax), %xmm7, %xmm6
	vucomiss	%xmm6, %xmm3
	vmovaps	%xmm3, %xmm1
	ja	LBB12_76
## %bb.74:                              ##   in Loop: Header=BB12_70 Depth=3
	vucomiss	%xmm2, %xmm6
	vmovaps	%xmm6, %xmm1
	jbe	LBB12_76
## %bb.75:                              ##   in Loop: Header=BB12_70 Depth=3
	vmovaps	%xmm2, %xmm1
LBB12_76:                               ##   in Loop: Header=BB12_70 Depth=3
	vcvtsi2ssl	(%r14), %xmm7, %xmm6
	vucomiss	%xmm6, %xmm0
	ja	LBB12_79
## %bb.77:                              ##   in Loop: Header=BB12_70 Depth=3
	vucomiss	%xmm4, %xmm6
	vmovaps	%xmm6, %xmm0
	jbe	LBB12_79
## %bb.78:                              ##   in Loop: Header=BB12_70 Depth=3
	vmovaps	%xmm4, %xmm0
LBB12_79:                               ##   in Loop: Header=BB12_70 Depth=3
	vcvttss2si	%xmm5, %eax
	vcvtsi2ssl	(%r15), %xmm7, %xmm4
	vcvttss2si	%xmm0, %edx
	vucomiss	%xmm4, %xmm3
	ja	LBB12_82
## %bb.80:                              ##   in Loop: Header=BB12_70 Depth=3
	vucomiss	%xmm2, %xmm4
	vmovaps	%xmm4, %xmm3
	jbe	LBB12_82
## %bb.81:                              ##   in Loop: Header=BB12_70 Depth=3
	vmovaps	%xmm2, %xmm3
LBB12_82:                               ##   in Loop: Header=BB12_70 Depth=3
	cmpl	%edx, %eax
	jge	LBB12_85
## %bb.83:                              ##   in Loop: Header=BB12_70 Depth=3
	vcvttss2si	%xmm3, %eax
	vcvttss2si	%xmm1, %edx
	cmpl	%eax, %edx
	jge	LBB12_85
## %bb.84:                              ##   in Loop: Header=BB12_70 Depth=3
	movl	192(%rdi), %eax
	decl	%eax
	movq	-5472(%rbp), %rdx       ## 8-byte Reload
	movq	(%rdx,%r9,8), %rdx
	movslq	(%r12,%r9,4), %rsi
	leal	1(%rsi), %ebx
	movl	%ebx, (%r12,%r9,4)
	movq	-5480(%rbp), %rdi       ## 8-byte Reload
	movl	%eax, (%rdx,%rsi,4)
	movq	-5440(%rbp), %rsi       ## 8-byte Reload
LBB12_85:                               ##   in Loop: Header=BB12_70 Depth=3
	incq	%r9
	cmpq	%r9, %r13
	jne	LBB12_70
## %bb.86:                              ##   in Loop: Header=BB12_69 Depth=2
	movq	-5584(%rbp), %rdx       ## 8-byte Reload
	incq	%rdx
	movl	-5552(%rbp), %ebx       ## 4-byte Reload
	addl	$16, %ebx
	addq	$16, %rcx
	cmpq	-5504(%rbp), %rdx       ## 8-byte Folded Reload
	jne	LBB12_69
	jmp	LBB12_87
	.p2align	4, 0x90
LBB12_16:                               ##   in Loop: Header=BB12_7 Depth=1
	movq	-5440(%rbp), %rsi       ## 8-byte Reload
	movl	$0, (%rsi)
	xorl	%esi, %esi
	leaq	-2580(%rbp,%rax), %rbx
	movq	%rbx, -5432(%rbp)       ## 8-byte Spill
	testl	%r10d, %r10d
	jns	LBB12_19
LBB12_18:                               ##   in Loop: Header=BB12_7 Depth=1
	movq	-5432(%rbp), %rbx       ## 8-byte Reload
	movl	$0, (%rbx)
	xorl	%r10d, %r10d
	leaq	-2576(%rbp,%rax), %r14
	cmpl	%edx, %r9d
	jge	LBB12_21
LBB12_20:                               ##   in Loop: Header=BB12_7 Depth=1
	movl	%r9d, (%r14)
	movl	%r9d, %edx
	leaq	-2572(%rbp,%rax), %r15
	cmpl	%ecx, %r8d
	jge	LBB12_23
LBB12_22:                               ##   in Loop: Header=BB12_7 Depth=1
	movl	%r8d, (%r15)
	movl	%r8d, %ecx
	cmpl	%edx, %esi
	jl	LBB12_24
	.p2align	4, 0x90
LBB12_87:                               ##   in Loop: Header=BB12_7 Depth=1
	movq	-5512(%rbp), %rax       ## 8-byte Reload
	incq	%rax
	cmpq	-5568(%rbp), %rax       ## 8-byte Folded Reload
	jl	LBB12_7
LBB12_64:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB12_90
## %bb.65:
	addq	$5912, %rsp             ## imm = 0x1718
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
LBB12_90:
	vzeroupper
	callq	___stack_chk_fail
LBB12_26:
	leaq	L___func__._Z13push_triangleP14Render_ContextP8Triangle(%rip), %rdi
	leaq	L_.str.5(%rip), %rsi
	leaq	L_.str.7(%rip), %rcx
	movl	$291, %edx              ## imm = 0x123
	vzeroupper
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function _Z9push_cubeP14Render_Context2v3S1_S1_S1_S1_S1_P7TextureS3_
LCPI13_0:
	.long	925353388               ## float 9.99999974E-6
LCPI13_1:
	.long	1065353216              ## float 1
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI13_2:
	.quad	1065353216              ## 0x3f800000
	.quad	4575657222473777152     ## 0x3f8000003f800000
LCPI13_3:
	.quad	4575657222473777152     ## 0x3f8000003f800000
	.quad	4575657221408423936     ## 0x3f80000000000000
LCPI13_4:
	.quad	4575657221408423936     ## 0x3f80000000000000
	.quad	1065353216              ## 0x3f800000
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z9push_cubeP14Render_Context2v3S1_S1_S1_S1_S1_P7TextureS3_
	.p2align	4, 0x90
__Z9push_cubeP14Render_Context2v3S1_S1_S1_S1_S1_P7TextureS3_: ## @_Z9push_cubeP14Render_Context2v3S1_S1_S1_S1_S1_P7TextureS3_
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
	subq	$952, %rsp              ## imm = 0x3B8
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	vmovss	%xmm1, -752(%rbp)       ## 4-byte Spill
	vmovaps	%xmm0, %xmm1
	movq	%rdi, -776(%rbp)        ## 8-byte Spill
	leaq	16(%rbp), %rax
	movq	___stack_chk_guard@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	movq	%rcx, -48(%rbp)
	vmulss	%xmm2, %xmm2, %xmm8
	vmovshdup	%xmm2, %xmm12   ## xmm12 = xmm2[1,1,3,3]
	vmulss	%xmm12, %xmm12, %xmm9
	vaddss	%xmm9, %xmm8, %xmm8
	vmulss	%xmm3, %xmm3, %xmm9
	vaddss	%xmm8, %xmm9, %xmm8
	vsqrtss	%xmm8, %xmm8, %xmm13
	vxorps	%xmm9, %xmm9, %xmm9
	vxorps	%xmm11, %xmm11, %xmm11
	vmovss	LCPI13_0(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm13, %xmm0
	vxorps	%xmm8, %xmm8, %xmm8
	vxorps	%xmm10, %xmm10, %xmm10
	jae	LBB13_2
## %bb.1:
	vmovss	LCPI13_1(%rip), %xmm8   ## xmm8 = mem[0],zero,zero,zero
	vdivss	%xmm13, %xmm8, %xmm10
	vmulss	%xmm10, %xmm2, %xmm8
	vmulss	%xmm10, %xmm12, %xmm2
	vinsertps	$16, %xmm2, %xmm8, %xmm8 ## xmm8 = xmm8[0],xmm2[0],xmm8[2,3]
	vmulss	%xmm3, %xmm10, %xmm10
LBB13_2:
	vmovss	(%rax), %xmm14          ## xmm14 = mem[0],zero,zero,zero
	vmovshdup	%xmm8, %xmm12   ## xmm12 = xmm8[1,1,3,3]
	vmulss	%xmm4, %xmm4, %xmm3
	vmovshdup	%xmm4, %xmm13   ## xmm13 = xmm4[1,1,3,3]
	vmulss	%xmm13, %xmm13, %xmm2
	vaddss	%xmm2, %xmm3, %xmm2
	vmulss	%xmm5, %xmm5, %xmm3
	vaddss	%xmm2, %xmm3, %xmm2
	vsqrtss	%xmm2, %xmm2, %xmm3
	vmovss	LCPI13_0(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm3, %xmm0
	jae	LBB13_4
## %bb.3:
	vmovss	LCPI13_1(%rip), %xmm2   ## xmm2 = mem[0],zero,zero,zero
	vdivss	%xmm3, %xmm2, %xmm2
	vmulss	%xmm2, %xmm4, %xmm3
	vmulss	%xmm2, %xmm13, %xmm4
	vinsertps	$16, %xmm4, %xmm3, %xmm11 ## xmm11 = xmm3[0],xmm4[0],xmm3[2,3]
	vmulss	%xmm5, %xmm2, %xmm9
LBB13_4:
	vmulss	%xmm14, %xmm8, %xmm4
	vmulss	%xmm14, %xmm12, %xmm15
	vmulss	%xmm14, %xmm10, %xmm8
	vmovss	4(%rax), %xmm2          ## xmm2 = mem[0],zero,zero,zero
	vmulss	%xmm2, %xmm11, %xmm13
	vmovshdup	%xmm11, %xmm3   ## xmm3 = xmm11[1,1,3,3]
	vmulss	%xmm2, %xmm3, %xmm10
	vmulss	%xmm2, %xmm9, %xmm0
	vmovss	%xmm0, -768(%rbp)       ## 4-byte Spill
	vmulss	%xmm6, %xmm6, %xmm2
	vmovshdup	%xmm6, %xmm5    ## xmm5 = xmm6[1,1,3,3]
	vmulss	%xmm5, %xmm5, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vmulss	%xmm7, %xmm7, %xmm3
	vaddss	%xmm2, %xmm3, %xmm2
	vsqrtss	%xmm2, %xmm2, %xmm2
	vmovss	LCPI13_0(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm2, %xmm0
	jae	LBB13_5
## %bb.6:
	vmovss	LCPI13_1(%rip), %xmm3   ## xmm3 = mem[0],zero,zero,zero
	vdivss	%xmm2, %xmm3, %xmm2
	vmulss	%xmm2, %xmm6, %xmm3
	vmulss	%xmm2, %xmm5, %xmm5
	vinsertps	$16, %xmm5, %xmm3, %xmm5 ## xmm5 = xmm3[0],xmm5[0],xmm3[2,3]
	vmulss	%xmm7, %xmm2, %xmm0
	jmp	LBB13_7
LBB13_5:
	vxorps	%xmm0, %xmm0, %xmm0
	vxorps	%xmm5, %xmm5, %xmm5
LBB13_7:
	vmovss	8(%rax), %xmm2          ## xmm2 = mem[0],zero,zero,zero
	vmulss	%xmm2, %xmm5, %xmm6
	vmovshdup	%xmm5, %xmm3    ## xmm3 = xmm5[1,1,3,3]
	vmulss	%xmm2, %xmm3, %xmm7
	vmulss	%xmm2, %xmm0, %xmm12
	vsubss	%xmm4, %xmm1, %xmm0
	vmovss	%xmm0, -724(%rbp)       ## 4-byte Spill
	vmovshdup	%xmm1, %xmm3    ## xmm3 = xmm1[1,1,3,3]
	vsubss	%xmm15, %xmm3, %xmm5
	vsubss	%xmm13, %xmm0, %xmm0
	vmovss	%xmm0, -732(%rbp)       ## 4-byte Spill
	vmovaps	%xmm4, %xmm9
	vsubss	%xmm10, %xmm5, %xmm4
	vmovss	%xmm4, -728(%rbp)       ## 4-byte Spill
	vmovaps	%xmm1, %xmm2
	vaddss	%xmm6, %xmm0, %xmm1
	vaddss	%xmm7, %xmm4, %xmm0
	vinsertps	$16, %xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0],xmm1[2,3]
	vmovaps	%xmm0, -816(%rbp)       ## 16-byte Spill
	vaddss	%xmm9, %xmm2, %xmm0
	vaddss	%xmm15, %xmm3, %xmm1
	vmovss	-752(%rbp), %xmm2       ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	vsubss	%xmm8, %xmm2, %xmm4
	vaddss	%xmm2, %xmm8, %xmm11
	vsubss	%xmm13, %xmm0, %xmm15
	vsubss	%xmm10, %xmm1, %xmm14
	vaddss	%xmm6, %xmm15, %xmm9
	vmovaps	%xmm10, %xmm3
	vmovaps	%xmm13, %xmm10
	vaddss	%xmm7, %xmm14, %xmm13
	vinsertps	$16, %xmm13, %xmm9, %xmm2 ## xmm2 = xmm9[0],xmm13[0],xmm9[2,3]
	vmovaps	%xmm2, -752(%rbp)       ## 16-byte Spill
	vaddss	%xmm10, %xmm0, %xmm13
	vaddss	%xmm3, %xmm1, %xmm8
	vaddss	%xmm6, %xmm13, %xmm1
	vaddss	%xmm7, %xmm8, %xmm2
	vinsertps	$16, %xmm2, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm2[0],xmm1[2,3]
	vmovaps	%xmm0, -800(%rbp)       ## 16-byte Spill
	vaddss	-724(%rbp), %xmm10, %xmm2 ## 4-byte Folded Reload
	vaddss	%xmm3, %xmm5, %xmm5
	vmovss	-768(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	vsubss	%xmm1, %xmm11, %xmm0
	vaddss	%xmm1, %xmm11, %xmm11
	vsubss	%xmm1, %xmm4, %xmm10
	vaddss	%xmm1, %xmm4, %xmm1
	vaddss	%xmm6, %xmm2, %xmm3
	vaddss	%xmm7, %xmm5, %xmm4
	vinsertps	$16, %xmm4, %xmm3, %xmm9 ## xmm9 = xmm3[0],xmm4[0],xmm3[2,3]
	vmovss	-732(%rbp), %xmm3       ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	vsubss	%xmm6, %xmm3, %xmm3
	vmovss	-728(%rbp), %xmm4       ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	vsubss	%xmm7, %xmm4, %xmm4
	vinsertps	$16, %xmm4, %xmm3, %xmm3 ## xmm3 = xmm3[0],xmm4[0],xmm3[2,3]
	vmovaps	%xmm3, -768(%rbp)       ## 16-byte Spill
	vsubss	%xmm6, %xmm15, %xmm3
	vsubss	%xmm7, %xmm14, %xmm4
	vinsertps	$16, %xmm4, %xmm3, %xmm14 ## xmm14 = xmm3[0],xmm4[0],xmm3[2,3]
	vsubss	%xmm6, %xmm13, %xmm3
	vsubss	%xmm7, %xmm8, %xmm4
	vinsertps	$16, %xmm4, %xmm3, %xmm3 ## xmm3 = xmm3[0],xmm4[0],xmm3[2,3]
	vsubss	%xmm6, %xmm2, %xmm2
	vaddss	%xmm12, %xmm10, %xmm8
	vsubss	%xmm7, %xmm5, %xmm4
	vaddss	%xmm12, %xmm0, %xmm15
	vinsertps	$16, %xmm4, %xmm2, %xmm7 ## xmm7 = xmm2[0],xmm4[0],xmm2[2,3]
	vaddss	%xmm12, %xmm11, %xmm2
	vsubss	%xmm12, %xmm10, %xmm6
	vsubss	%xmm12, %xmm0, %xmm13
	vsubss	%xmm12, %xmm11, %xmm4
	vaddss	%xmm12, %xmm1, %xmm11
	vsubss	%xmm12, %xmm1, %xmm12
	vmovaps	-816(%rbp), %xmm0       ## 16-byte Reload
	vmovlps	%xmm0, -720(%rbp)
	vmovss	%xmm8, -712(%rbp)
	vmovaps	-752(%rbp), %xmm1       ## 16-byte Reload
	vmovlps	%xmm1, -708(%rbp)
	vmovss	%xmm15, -700(%rbp)
	vmovaps	-800(%rbp), %xmm10      ## 16-byte Reload
	vmovlps	%xmm10, -696(%rbp)
	vmovss	%xmm2, -688(%rbp)
	movq	%rdx, -680(%rbp)
	movl	$0, -672(%rbp)
	vmovlps	%xmm0, -664(%rbp)
	vmovss	%xmm8, -656(%rbp)
	vmovlps	%xmm10, -652(%rbp)
	vmovss	%xmm2, -644(%rbp)
	vmovlps	%xmm9, -640(%rbp)
	vmovss	%xmm11, -632(%rbp)
	movq	%rdx, -624(%rbp)
	movl	$0, -616(%rbp)
	vmovaps	-768(%rbp), %xmm5       ## 16-byte Reload
	vmovlps	%xmm5, -608(%rbp)
	vmovss	%xmm6, -600(%rbp)
	vmovlps	%xmm3, -596(%rbp)
	vmovss	%xmm4, -588(%rbp)
	vmovlps	%xmm14, -584(%rbp)
	vmovss	%xmm13, -576(%rbp)
	movq	%rdx, -568(%rbp)
	movl	$1, -560(%rbp)
	vmovlps	%xmm5, -552(%rbp)
	vmovss	%xmm6, -544(%rbp)
	vmovlps	%xmm7, -540(%rbp)
	vmovss	%xmm12, -532(%rbp)
	vmovlps	%xmm3, -528(%rbp)
	vmovss	%xmm4, -520(%rbp)
	movq	%rdx, -512(%rbp)
	movl	$1, -504(%rbp)
	vmovlps	%xmm1, -496(%rbp)
	vmovss	%xmm15, -488(%rbp)
	vmovlps	%xmm14, -484(%rbp)
	vmovss	%xmm13, -476(%rbp)
	vmovlps	%xmm3, -472(%rbp)
	vmovss	%xmm4, -464(%rbp)
	movq	%rdx, -456(%rbp)
	movl	$0, -448(%rbp)
	vmovlps	%xmm1, -440(%rbp)
	vmovss	%xmm15, -432(%rbp)
	vmovlps	%xmm3, -428(%rbp)
	vmovss	%xmm4, -420(%rbp)
	vmovlps	%xmm10, -416(%rbp)
	vmovss	%xmm2, -408(%rbp)
	movq	%rdx, -400(%rbp)
	movl	$0, -392(%rbp)
	vmovlps	%xmm5, -384(%rbp)
	vmovss	%xmm6, -376(%rbp)
	vmovlps	%xmm0, -372(%rbp)
	vmovss	%xmm8, -364(%rbp)
	vmovlps	%xmm9, -360(%rbp)
	vmovss	%xmm11, -352(%rbp)
	movq	%rdx, -344(%rbp)
	movl	$0, -336(%rbp)
	vmovlps	%xmm5, -328(%rbp)
	vmovss	%xmm6, -320(%rbp)
	vmovlps	%xmm9, -316(%rbp)
	vmovss	%xmm11, -308(%rbp)
	vmovlps	%xmm7, -304(%rbp)
	vmovss	%xmm12, -296(%rbp)
	movq	%rdx, -288(%rbp)
	movl	$0, -280(%rbp)
	vmovlps	%xmm9, -272(%rbp)
	vmovss	%xmm11, -264(%rbp)
	vmovlps	%xmm10, -260(%rbp)
	vmovss	%xmm2, -252(%rbp)
	vmovlps	%xmm3, -248(%rbp)
	vmovss	%xmm4, -240(%rbp)
	movq	%rsi, -232(%rbp)
	movl	$0, -224(%rbp)
	vmovlps	%xmm9, -216(%rbp)
	vmovss	%xmm11, -208(%rbp)
	vmovlps	%xmm3, -204(%rbp)
	vmovss	%xmm4, -196(%rbp)
	vmovlps	%xmm7, -192(%rbp)
	vmovss	%xmm12, -184(%rbp)
	movq	%rsi, -176(%rbp)
	movl	$0, -168(%rbp)
	vmovlps	%xmm0, -160(%rbp)
	vmovss	%xmm8, -152(%rbp)
	vmovlps	%xmm14, -148(%rbp)
	vmovss	%xmm13, -140(%rbp)
	vmovlps	%xmm1, -136(%rbp)
	vmovss	%xmm15, -128(%rbp)
	movq	%rsi, -120(%rbp)
	movl	$1, -112(%rbp)
	vmovlps	%xmm0, -104(%rbp)
	vmovss	%xmm8, -96(%rbp)
	leaq	32(%rbp), %r12
	leaq	-672(%rbp), %rbx
	vmovlps	%xmm5, -92(%rbp)
	vmovss	%xmm6, -84(%rbp)
	vmovlps	%xmm14, -80(%rbp)
	vmovss	%xmm13, -72(%rbp)
	movq	%rsi, -64(%rbp)
	movl	$1, -56(%rbp)
	leaq	-972(%rbp), %r13
	xorl	%r14d, %r14d
	leaq	-984(%rbp), %r15
	.p2align	4, 0x90
LBB13_8:                                ## =>This Inner Loop Header: Depth=1
	testb	$1, %r14b
	sete	%al
	cmpl	$0, (%rbx)
	je	LBB13_9
## %bb.12:                              ##   in Loop: Header=BB13_8 Depth=1
	testb	$1, %r14b
	movabsq	$4575657221408423936, %rax ## imm = 0x3F80000000000000
	movl	$1065353216, %ecx       ## imm = 0x3F800000
	cmoveq	%rcx, %rax
	vmovq	%rax, %xmm0
	vpbroadcastq	%xmm0, %xmm0
	vpor	LCPI13_4(%rip), %xmm0, %xmm1
	jmp	LBB13_13
	.p2align	4, 0x90
LBB13_9:                                ##   in Loop: Header=BB13_8 Depth=1
	vmovd	%eax, %xmm0
	vpbroadcastb	%xmm0, %xmm0
	vpsllq	$63, %xmm0, %xmm0
	vmovapd	LCPI13_3(%rip), %xmm1   ## xmm1 = [4575657222473777152,4575657221408423936]
	vblendvpd	%xmm0, LCPI13_2(%rip), %xmm1, %xmm1
LBB13_13:                               ##   in Loop: Header=BB13_8 Depth=1
	movl	-40(%rbx), %eax
	movl	%eax, -976(%rbp)
	movq	-48(%rbx), %rax
	movq	%rax, -984(%rbp)
	movl	-28(%rbx), %eax
	movl	%eax, 8(%r13)
	movq	-36(%rbx), %rax
	movq	%rax, (%r13)
	movl	-16(%rbx), %eax
	movl	%eax, 20(%r13)
	movq	-24(%rbx), %rax
	movq	%rax, 12(%r13)
	vpxor	%xmm0, %xmm0, %xmm0
	vmovq	%xmm0, -912(%rbp)
	vmovdqu	%xmm1, -904(%rbp)
	vmovsd	-972(%rbp), %xmm1       ## xmm1 = mem[0],zero
	vmovss	-964(%rbp), %xmm2       ## xmm2 = mem[0],zero,zero,zero
	vmovsd	-984(%rbp), %xmm3       ## xmm3 = mem[0],zero
	vmovss	-976(%rbp), %xmm4       ## xmm4 = mem[0],zero,zero,zero
	vsubps	%xmm3, %xmm1, %xmm5
	vsubss	%xmm4, %xmm2, %xmm2
	vmovsd	-960(%rbp), %xmm1       ## xmm1 = mem[0],zero
	vsubss	%xmm3, %xmm1, %xmm6
	vmovshdup	%xmm1, %xmm1    ## xmm1 = xmm1[1,1,3,3]
	vinsertps	$16, -952(%rbp), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[0],xmm1[2,3]
	vmovshdup	%xmm3, %xmm3    ## xmm3 = xmm3[1,1,3,3]
	vinsertps	$16, %xmm4, %xmm3, %xmm3 ## xmm3 = xmm3[0],xmm4[0],xmm3[2,3]
	vsubps	%xmm3, %xmm1, %xmm3
	vmulss	%xmm6, %xmm2, %xmm1
	vmovshdup	%xmm3, %xmm4    ## xmm4 = xmm3[1,1,3,3]
	vmulss	%xmm4, %xmm5, %xmm4
	vsubss	%xmm4, %xmm1, %xmm1
	vmulps	%xmm3, %xmm5, %xmm4
	vmovshdup	%xmm5, %xmm5    ## xmm5 = xmm5[1,1,3,3]
	vinsertps	$16, %xmm2, %xmm5, %xmm2 ## xmm2 = xmm5[0],xmm2[0],xmm5[2,3]
	vinsertps	$28, %xmm3, %xmm6, %xmm3 ## xmm3 = xmm6[0],xmm3[0],zero,zero
	vmulps	%xmm3, %xmm2, %xmm2
	vsubps	%xmm2, %xmm4, %xmm2
	vmulss	%xmm1, %xmm1, %xmm3
	vmulps	%xmm2, %xmm2, %xmm4
	vmovshdup	%xmm4, %xmm5    ## xmm5 = xmm4[1,1,3,3]
	vaddss	%xmm3, %xmm5, %xmm3
	vaddss	%xmm3, %xmm4, %xmm3
	vsqrtss	%xmm3, %xmm3, %xmm4
	vxorps	%xmm3, %xmm3, %xmm3
	vmovss	LCPI13_0(%rip), %xmm5   ## xmm5 = mem[0],zero,zero,zero
	vucomiss	%xmm4, %xmm5
	jae	LBB13_15
## %bb.14:                              ##   in Loop: Header=BB13_8 Depth=1
	vmovss	LCPI13_1(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vdivss	%xmm4, %xmm0, %xmm3
	vmovshdup	%xmm2, %xmm0    ## xmm0 = xmm2[1,1,3,3]
	vmulss	%xmm3, %xmm0, %xmm0
	vmulss	%xmm3, %xmm1, %xmm1
	vinsertps	$16, %xmm1, %xmm0, %xmm0 ## xmm0 = xmm0[0],xmm1[0],xmm0[2,3]
	vmulss	%xmm3, %xmm2, %xmm3
LBB13_15:                               ##   in Loop: Header=BB13_8 Depth=1
	vmovlps	%xmm0, -948(%rbp)
	vmovss	%xmm3, -940(%rbp)
	vmovlps	%xmm0, -936(%rbp)
	vmovss	%xmm3, -928(%rbp)
	vmovlps	%xmm0, -924(%rbp)
	vmovss	%xmm3, -916(%rbp)
	movq	-8(%rbx), %rax
	movq	%rax, -888(%rbp)
	movl	8(%r12), %eax
	movl	%eax, 100(%r13)
	movq	(%r12), %rax
	movq	%rax, 92(%r13)
	movq	-776(%rbp), %rdi        ## 8-byte Reload
	movq	%r15, %rsi
	callq	__Z13push_triangleP14Render_ContextP8Triangle
	incq	%r14
	addq	$56, %rbx
	cmpq	$12, %r14
	jne	LBB13_8
## %bb.10:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB13_16
## %bb.11:
	addq	$952, %rsp              ## imm = 0x3B8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB13_16:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function _Z9push_lineP14Render_Context2v3S1_S1_
LCPI14_0:
	.long	2147483648              ## float -0
LCPI14_1:
	.long	3212836864              ## float -1
LCPI14_2:
	.long	1065353216              ## float 1
LCPI14_3:
	.long	1056964608              ## float 0.5
LCPI14_4:
	.long	1132396544              ## float 255
LCPI14_5:
	.long	925353388               ## float 9.99999974E-6
LCPI14_6:
	.long	2147483647              ## float NaN
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z9push_lineP14Render_Context2v3S1_S1_
	.p2align	4, 0x90
__Z9push_lineP14Render_Context2v3S1_S1_: ## @_Z9push_lineP14Render_Context2v3S1_S1_
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
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	vmovss	%xmm5, -60(%rbp)        ## 4-byte Spill
	vmovaps	%xmm4, -96(%rbp)        ## 16-byte Spill
	vmovss	%xmm3, -56(%rbp)        ## 4-byte Spill
	vmovss	112(%rdi), %xmm4        ## xmm4 = mem[0],zero,zero,zero
	vmovss	116(%rdi), %xmm5        ## xmm5 = mem[0],zero,zero,zero
	vmovss	%xmm5, -64(%rbp)        ## 4-byte Spill
	vmovss	120(%rdi), %xmm3        ## xmm3 = mem[0],zero,zero,zero
	vmovss	%xmm3, -48(%rbp)        ## 4-byte Spill
	vmovsd	64(%rdi), %xmm14        ## xmm14 = mem[0],zero
	vmovss	72(%rdi), %xmm11        ## xmm11 = mem[0],zero,zero,zero
	vsubss	%xmm14, %xmm0, %xmm7
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vmovshdup	%xmm14, %xmm13  ## xmm13 = xmm14[1,1,3,3]
	vsubss	%xmm13, %xmm0, %xmm0
	vsubss	%xmm11, %xmm1, %xmm1
	vmulss	%xmm7, %xmm4, %xmm12
	vxorps	%xmm15, %xmm15, %xmm15
	vaddss	%xmm15, %xmm12, %xmm12
	vmulss	%xmm0, %xmm5, %xmm6
	vaddss	%xmm12, %xmm6, %xmm12
	vmulss	%xmm1, %xmm3, %xmm6
	vaddss	%xmm12, %xmm6, %xmm6
	vmovss	124(%rdi), %xmm12       ## xmm12 = mem[0],zero,zero,zero
	vmulss	%xmm7, %xmm12, %xmm5
	vaddss	%xmm15, %xmm5, %xmm5
	vmovss	128(%rdi), %xmm9        ## xmm9 = mem[0],zero,zero,zero
	vmulss	%xmm0, %xmm9, %xmm8
	vaddss	%xmm5, %xmm8, %xmm5
	vmovss	132(%rdi), %xmm8        ## xmm8 = mem[0],zero,zero,zero
	vmulss	%xmm1, %xmm8, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vinsertps	$16, %xmm3, %xmm6, %xmm3 ## xmm3 = xmm6[0],xmm3[0],xmm6[2,3]
	vmovaps	%xmm3, -80(%rbp)        ## 16-byte Spill
	vmovss	136(%rdi), %xmm6        ## xmm6 = mem[0],zero,zero,zero
	vmulss	%xmm7, %xmm6, %xmm3
	vaddss	%xmm15, %xmm3, %xmm3
	vmovss	140(%rdi), %xmm7        ## xmm7 = mem[0],zero,zero,zero
	vmulss	%xmm0, %xmm7, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vmovss	144(%rdi), %xmm10       ## xmm10 = mem[0],zero,zero,zero
	vmulss	%xmm1, %xmm10, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vsubss	%xmm14, %xmm2, %xmm1
	vmovaps	%xmm0, %xmm14
	vmovshdup	%xmm2, %xmm2    ## xmm2 = xmm2[1,1,3,3]
	vsubss	%xmm13, %xmm2, %xmm2
	vmovss	-56(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vsubss	%xmm11, %xmm0, %xmm0
	vmulss	%xmm1, %xmm4, %xmm3
	vaddss	%xmm15, %xmm3, %xmm3
	vmulss	-64(%rbp), %xmm2, %xmm4 ## 4-byte Folded Reload
	vaddss	%xmm3, %xmm4, %xmm3
	vmulss	-48(%rbp), %xmm0, %xmm4 ## 4-byte Folded Reload
	vaddss	%xmm3, %xmm4, %xmm3
	vmulss	%xmm1, %xmm12, %xmm4
	vaddss	%xmm15, %xmm4, %xmm4
	vmulss	%xmm2, %xmm9, %xmm5
	vaddss	%xmm4, %xmm5, %xmm4
	vmulss	%xmm0, %xmm8, %xmm5
	vaddss	%xmm4, %xmm5, %xmm4
	vinsertps	$16, %xmm4, %xmm3, %xmm3 ## xmm3 = xmm3[0],xmm4[0],xmm3[2,3]
	vmulss	%xmm1, %xmm6, %xmm1
	vaddss	%xmm15, %xmm1, %xmm1
	vmulss	%xmm2, %xmm7, %xmm2
	vaddss	%xmm1, %xmm2, %xmm1
	vmulss	%xmm0, %xmm10, %xmm0
	vaddss	%xmm1, %xmm0, %xmm2
	vmovss	56(%rdi), %xmm1         ## xmm1 = mem[0],zero,zero,zero
	vbroadcastss	LCPI14_0(%rip), %xmm15 ## xmm15 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	vxorps	%xmm15, %xmm1, %xmm6
	vucomiss	%xmm6, %xmm14
	jbe	LBB14_1
## %bb.2:
	vmovaps	%xmm2, %xmm10
	vmovaps	%xmm3, %xmm7
	vmovaps	-80(%rbp), %xmm5        ## 16-byte Reload
	vucomiss	%xmm6, %xmm10
	ja	LBB14_38
LBB14_4:
	vucomiss	%xmm6, %xmm14
	jbe	LBB14_6
## %bb.5:
	vsubss	%xmm14, %xmm6, %xmm0
	vsubss	%xmm10, %xmm14, %xmm2
	vdivss	%xmm2, %xmm0, %xmm0
	vsubps	%xmm7, %xmm5, %xmm3
	vbroadcastss	%xmm0, %xmm4
	vmulps	%xmm3, %xmm4, %xmm3
	vmulss	%xmm0, %xmm2, %xmm0
	vaddps	%xmm3, %xmm5, %xmm5
	vaddss	%xmm0, %xmm14, %xmm14
LBB14_6:
	vmovshdup	%xmm7, %xmm6    ## xmm6 = xmm7[1,1,3,3]
	movl	(%rdi), %eax
	vxorps	%xmm11, %xmm11, %xmm11
	vcvtsi2ssl	%eax, %xmm11, %xmm0
	movl	4(%rdi), %r14d
	vxorps	%xmm11, %xmm11, %xmm11
	vcvtsi2ssl	%r14d, %xmm11, %xmm3
	vbroadcastss	%xmm1, %xmm1
	vinsertps	$16, %xmm7, %xmm5, %xmm2 ## xmm2 = xmm5[0],xmm7[0],xmm5[2,3]
	vmulps	%xmm2, %xmm1, %xmm2
	vinsertps	$16, %xmm10, %xmm14, %xmm4 ## xmm4 = xmm14[0],xmm10[0],xmm14[2,3]
	vdivps	%xmm4, %xmm2, %xmm2
	vmovshdup	%xmm5, %xmm5    ## xmm5 = xmm5[1,1,3,3]
	vinsertps	$16, %xmm6, %xmm5, %xmm5 ## xmm5 = xmm5[0],xmm6[0],xmm5[2,3]
	vmulps	%xmm5, %xmm1, %xmm1
	vdivps	%xmm4, %xmm1, %xmm1
	vaddps	%xmm2, %xmm2, %xmm2
	vbroadcastss	152(%rdi), %xmm4
	vdivps	%xmm4, %xmm2, %xmm2
	vaddps	%xmm1, %xmm1, %xmm1
	vbroadcastss	156(%rdi), %xmm4
	vdivps	%xmm4, %xmm1, %xmm1
	vbroadcastss	LCPI14_2(%rip), %xmm4 ## xmm4 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vsubps	%xmm2, %xmm4, %xmm5
	vmovss	LCPI14_3(%rip), %xmm2   ## xmm2 = mem[0],zero,zero,zero
	vbroadcastss	%xmm2, %xmm7
	vmulps	%xmm7, %xmm5, %xmm5
	vbroadcastss	%xmm0, %xmm0
	vmulps	%xmm0, %xmm5, %xmm6
	vaddps	%xmm4, %xmm1, %xmm0
	vmulps	%xmm7, %xmm0, %xmm0
	vbroadcastss	%xmm3, %xmm1
	vmulps	%xmm1, %xmm0, %xmm3
	vmovshdup	%xmm6, %xmm12   ## xmm12 = xmm6[1,1,3,3]
	vsubss	%xmm12, %xmm6, %xmm11
	vmovshdup	%xmm3, %xmm1    ## xmm1 = xmm3[1,1,3,3]
	vsubss	%xmm1, %xmm3, %xmm9
	vmulss	%xmm11, %xmm11, %xmm0
	vmulss	%xmm9, %xmm9, %xmm4
	vaddss	%xmm4, %xmm0, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm8
	vxorps	%xmm13, %xmm13, %xmm13
	vmovss	LCPI14_5(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm8, %xmm0
	jae	LBB14_8
## %bb.7:
	vmovss	LCPI14_2(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vdivss	%xmm8, %xmm0, %xmm0
	vmulss	%xmm0, %xmm9, %xmm4
	vxorps	%xmm15, %xmm4, %xmm4
	vmulss	%xmm0, %xmm11, %xmm0
	vunpcklps	%xmm0, %xmm4, %xmm13 ## xmm13 = xmm4[0],xmm0[0],xmm4[1],xmm0[1]
LBB14_8:
	vcvttss2si	%xmm12, %edx
	vcvttss2si	%xmm1, %r9d
	vcvttss2si	%xmm6, %ebx
	vcvttss2si	%xmm3, %r12d
	movl	%r9d, %r10d
	movl	%edx, %r8d
	testl	%edx, %edx
	js	LBB14_9
## %bb.11:
	cmpl	%eax, %r8d
	jge	LBB14_12
LBB14_14:
	testl	%r10d, %r10d
	js	LBB14_15
LBB14_17:
	cmpl	%r14d, %r10d
	jl	LBB14_20
LBB14_18:
	cmpl	%r12d, %r14d
	jle	LBB14_38
## %bb.19:
	leal	-1(%r14), %ecx
	movl	%ecx, %esi
	subl	%r10d, %esi
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%esi, %xmm15, %xmm0
	movl	%r12d, %esi
	subl	%r10d, %esi
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%esi, %xmm15, %xmm3
	movl	%ebx, %esi
	subl	%r8d, %esi
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%esi, %xmm15, %xmm4
	vdivss	%xmm3, %xmm0, %xmm0
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%r8d, %xmm15, %xmm3
	vmulss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vcvttss2si	%xmm0, %r8d
	movl	%ecx, %r10d
	jmp	LBB14_20
LBB14_1:
	vmovaps	%xmm14, %xmm10
	vmovaps	-80(%rbp), %xmm7        ## 16-byte Reload
	vmovaps	%xmm2, %xmm14
	vmovaps	%xmm3, %xmm5
	vucomiss	%xmm6, %xmm10
	jbe	LBB14_4
	jmp	LBB14_38
LBB14_9:
	testl	%ebx, %ebx
	js	LBB14_38
## %bb.10:
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%edx, %xmm15, %xmm0
	movl	%ebx, %ecx
	subl	%edx, %ecx
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%ecx, %xmm15, %xmm3
	vdivss	%xmm3, %xmm0, %xmm0
	movl	%r12d, %ecx
	subl	%r9d, %ecx
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%ecx, %xmm15, %xmm3
	vmulss	%xmm3, %xmm0, %xmm0
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%r9d, %xmm15, %xmm3
	vsubss	%xmm0, %xmm3, %xmm0
	vcvttss2si	%xmm0, %r10d
	xorl	%r8d, %r8d
	cmpl	%eax, %r8d
	jl	LBB14_14
LBB14_12:
	cmpl	%ebx, %eax
	jle	LBB14_38
## %bb.13:
	leal	-1(%rax), %ecx
	movl	%ecx, %esi
	subl	%r8d, %esi
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%esi, %xmm15, %xmm0
	movl	%ebx, %esi
	subl	%r8d, %esi
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%esi, %xmm15, %xmm3
	movl	%r12d, %esi
	subl	%r10d, %esi
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%esi, %xmm15, %xmm4
	vdivss	%xmm3, %xmm0, %xmm0
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%r10d, %xmm15, %xmm3
	vmulss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vcvttss2si	%xmm0, %r10d
	movl	%ecx, %r8d
	testl	%r10d, %r10d
	jns	LBB14_17
LBB14_15:
	testl	%r12d, %r12d
	js	LBB14_38
## %bb.16:
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%r10d, %xmm15, %xmm0
	movl	%r12d, %ecx
	subl	%r10d, %ecx
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%ecx, %xmm15, %xmm3
	vdivss	%xmm3, %xmm0, %xmm0
	movl	%ebx, %ecx
	subl	%r8d, %ecx
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%ecx, %xmm15, %xmm3
	vmulss	%xmm3, %xmm0, %xmm0
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%r8d, %xmm15, %xmm3
	vsubss	%xmm0, %xmm3, %xmm0
	vcvttss2si	%xmm0, %r8d
	xorl	%r10d, %r10d
	cmpl	%r14d, %r10d
	jge	LBB14_18
LBB14_20:
	vmovss	LCPI14_4(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vmovaps	-96(%rbp), %xmm4        ## 16-byte Reload
	vmovshdup	%xmm4, %xmm3    ## xmm3 = xmm4[1,1,3,3]
	vmulss	%xmm0, %xmm4, %xmm4
	vmulss	%xmm0, %xmm3, %xmm3
	vaddss	%xmm2, %xmm4, %xmm4
	vaddss	%xmm2, %xmm3, %xmm3
	vcvttss2si	%xmm4, %rcx
	vcvttss2si	%xmm3, %rsi
	vmulss	-60(%rbp), %xmm0, %xmm0 ## 4-byte Folded Reload
	vaddss	%xmm2, %xmm0, %xmm0
	vcvttss2si	%xmm0, %r11
	shll	$24, %ecx
	shll	$16, %esi
	orl	%ecx, %esi
	vmovss	LCPI14_1(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	shll	$8, %r11d
	orl	%esi, %r11d
	vdivss	%xmm10, %xmm0, %xmm10
	vxorps	%xmm2, %xmm2, %xmm2
	xorl	%ecx, %ecx
	vucomiss	%xmm2, %xmm11
	vdivss	%xmm14, %xmm0, %xmm11
	seta	%cl
	xorl	%esi, %esi
	vucomiss	%xmm2, %xmm9
	seta	%sil
	leal	-1(%rcx,%rcx), %ecx
	movq	%rcx, -56(%rbp)         ## 8-byte Spill
	leal	-1(%rsi,%rsi), %ecx
	movq	%rcx, -48(%rbp)         ## 8-byte Spill
	vmovshdup	%xmm13, %xmm6   ## xmm6 = xmm13[1,1,3,3]
	subl	%r8d, %ebx
	movl	%ebx, %r15d
	negl	%r15d
	cmovll	%ebx, %r15d
	subl	%r10d, %r12d
	movl	%r12d, %r13d
	negl	%r13d
	cmovll	%r12d, %r13d
	addl	%eax, %r14d
	addl	%r14d, %r14d
	notl	%r14d
	vmovss	LCPI14_2(%rip), %xmm9   ## xmm9 = mem[0],zero,zero,zero
	vbroadcastss	LCPI14_6(%rip), %xmm7 ## xmm7 = [NaN,NaN,NaN,NaN]
	.p2align	4, 0x90
LBB14_21:                               ## =>This Inner Loop Header: Depth=1
	incl	%r14d
	je	LBB14_38
## %bb.22:                              ##   in Loop: Header=BB14_21 Depth=1
	testl	%edx, %edx
	js	LBB14_38
## %bb.23:                              ##   in Loop: Header=BB14_21 Depth=1
	testl	%r9d, %r9d
	js	LBB14_38
## %bb.24:                              ##   in Loop: Header=BB14_21 Depth=1
	cmpl	(%rdi), %edx
	jge	LBB14_38
## %bb.25:                              ##   in Loop: Header=BB14_21 Depth=1
	cmpl	4(%rdi), %r9d
	jge	LBB14_38
## %bb.26:                              ##   in Loop: Header=BB14_21 Depth=1
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%edx, %xmm15, %xmm0
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%r9d, %xmm15, %xmm2
	vsubss	%xmm12, %xmm0, %xmm4
	vsubss	%xmm1, %xmm2, %xmm5
	vmulss	%xmm4, %xmm4, %xmm0
	vmulss	%xmm5, %xmm5, %xmm2
	vaddss	%xmm0, %xmm2, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm0
	vdivss	%xmm8, %xmm0, %xmm0
	vsubss	%xmm0, %xmm9, %xmm2
	vmulss	%xmm2, %xmm10, %xmm2
	vmulss	%xmm0, %xmm11, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vdivss	%xmm0, %xmm9, %xmm2
	leal	(,%rdx,4), %esi
	movq	48(%rdi), %rbx
	movl	24(%rdi), %eax
	imull	%r9d, %eax
	leal	(%rax,%rdx,4), %ecx
	movslq	%ecx, %rcx
	vmovss	(%rbx,%rcx,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm2, %xmm0
	jbe	LBB14_28
## %bb.27:                              ##   in Loop: Header=BB14_21 Depth=1
	vmovss	%xmm2, (%rbx,%rcx,4)
	movq	40(%rdi), %rax
	movl	%r11d, (%rax,%rcx,4)
	movl	24(%rdi), %eax
	imull	%r9d, %eax
LBB14_28:                               ##   in Loop: Header=BB14_21 Depth=1
	movl	%esi, %ecx
	orl	$1, %ecx
	addl	%eax, %ecx
	movslq	%ecx, %rcx
	vmovss	(%rbx,%rcx,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm2, %xmm0
	jbe	LBB14_30
## %bb.29:                              ##   in Loop: Header=BB14_21 Depth=1
	vmovss	%xmm2, (%rbx,%rcx,4)
	movq	40(%rdi), %rax
	movl	%r11d, (%rax,%rcx,4)
	movl	24(%rdi), %eax
	imull	%r9d, %eax
LBB14_30:                               ##   in Loop: Header=BB14_21 Depth=1
	movl	%esi, %ecx
	orl	$2, %ecx
	addl	%eax, %ecx
	movslq	%ecx, %rcx
	vmovss	(%rbx,%rcx,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm2, %xmm0
	jbe	LBB14_32
## %bb.31:                              ##   in Loop: Header=BB14_21 Depth=1
	vmovss	%xmm2, (%rbx,%rcx,4)
	movq	40(%rdi), %rax
	movl	%r11d, (%rax,%rcx,4)
	movl	24(%rdi), %eax
	imull	%r9d, %eax
LBB14_32:                               ##   in Loop: Header=BB14_21 Depth=1
	orl	$3, %esi
	addl	%eax, %esi
	movslq	%esi, %rax
	vmovss	(%rbx,%rax,4), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm2, %xmm0
	jbe	LBB14_34
## %bb.33:                              ##   in Loop: Header=BB14_21 Depth=1
	vmovss	%xmm2, (%rbx,%rax,4)
	movq	40(%rdi), %rcx
	movl	%r11d, (%rcx,%rax,4)
LBB14_34:                               ##   in Loop: Header=BB14_21 Depth=1
	movq	-56(%rbp), %rax         ## 8-byte Reload
	leal	(%rdx,%rax), %eax
	vcvtsi2ssl	%eax, %xmm14, %xmm0
	vsubss	%xmm12, %xmm0, %xmm0
	vmulss	%xmm0, %xmm13, %xmm0
	vmulss	%xmm5, %xmm6, %xmm2
	vaddss	%xmm0, %xmm2, %xmm0
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	leal	(%r9,%rcx), %esi
	vcvtsi2ssl	%esi, %xmm1, %xmm2
	vandps	%xmm7, %xmm0, %xmm0
	vsubss	%xmm1, %xmm2, %xmm2
	vmulss	%xmm4, %xmm13, %xmm3
	vmulss	%xmm2, %xmm6, %xmm2
	vaddss	%xmm2, %xmm3, %xmm2
	vandps	%xmm7, %xmm2, %xmm2
	vucomiss	%xmm0, %xmm2
	ja	LBB14_36
## %bb.35:                              ##   in Loop: Header=BB14_21 Depth=1
	movl	%esi, %r9d
	movl	%edx, %eax
LBB14_36:                               ##   in Loop: Header=BB14_21 Depth=1
	movl	%eax, %ecx
	subl	%r8d, %ecx
	movl	%ecx, %edx
	negl	%edx
	cmovll	%ecx, %edx
	cmpl	%r15d, %edx
	jg	LBB14_38
## %bb.37:                              ##   in Loop: Header=BB14_21 Depth=1
	movl	%r9d, %ecx
	subl	%r10d, %ecx
	movl	%ecx, %esi
	negl	%esi
	cmovll	%ecx, %esi
	movl	%eax, %edx
	cmpl	%r13d, %esi
	jle	LBB14_21
LBB14_38:
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z11push_sphereP14Render_Context2v3fS1_ ## -- Begin function _Z11push_sphereP14Render_Context2v3fS1_
	.p2align	4, 0x90
__Z11push_sphereP14Render_Context2v3fS1_: ## @_Z11push_sphereP14Render_Context2v3fS1_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z9push_meshP14Render_ContextP4Mesh2v3S3_S3_S3_ ## -- Begin function _Z9push_meshP14Render_ContextP4Mesh2v3S3_S3_S3_
	.p2align	4, 0x90
__Z9push_meshP14Render_ContextP4Mesh2v3S3_S3_S3_: ## @_Z9push_meshP14Render_ContextP4Mesh2v3S3_S3_S3_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function _Z11render_tileP14Render_Contexti
LCPI17_0:
	.quad	9223372036854775807     ## double NaN
	.quad	9223372036854775807     ## double NaN
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI17_1:
	.quad	4547007121832542208     ## double 9.9999997473787516E-5
LCPI17_2:
	.quad	4607182418800017408     ## double 1
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI17_3:
	.long	2147483648              ## float -0
LCPI17_5:
	.long	1065353216              ## float 1
LCPI17_6:
	.long	1132396544              ## float 255
LCPI17_9:
	.long	998277249               ## float 0.00392156886
LCPI17_10:
	.long	1048576000              ## float 0.25
LCPI17_11:
	.long	1056964608              ## float 0.5
LCPI17_12:
	.long	0                       ## float 0
	.section	__TEXT,__const
	.p2align	5
LCPI17_4:
	.long	0                       ## 0x0
	.long	1                       ## 0x1
	.long	2                       ## 0x2
	.long	3                       ## 0x3
	.long	4                       ## 0x4
	.long	5                       ## 0x5
	.long	6                       ## 0x6
	.long	7                       ## 0x7
LCPI17_7:
	.byte	2                       ## 0x2
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	6                       ## 0x6
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	10                      ## 0xa
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	14                      ## 0xe
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	18                      ## 0x12
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	22                      ## 0x16
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	26                      ## 0x1a
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	30                      ## 0x1e
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
LCPI17_8:
	.byte	1                       ## 0x1
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	5                       ## 0x5
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	9                       ## 0x9
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	13                      ## 0xd
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	17                      ## 0x11
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	21                      ## 0x15
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	25                      ## 0x19
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	29                      ## 0x1d
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.byte	255                     ## 0xff
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z11render_tileP14Render_Contexti
	.p2align	4, 0x90
__Z11render_tileP14Render_Contexti:     ## @_Z11render_tileP14Render_Contexti
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
	andq	$-32, %rsp
	subq	$1568, %rsp             ## imm = 0x620
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r13
	movl	(%rdi), %ecx
	movl	4(%rdi), %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	shrl	$28, %eax
	addl	%ecx, %eax
	sarl	$4, %eax
	movl	%esi, %ecx
	sarl	$31, %ecx
	shrl	$28, %ecx
	addl	%esi, %ecx
	movl	%ecx, %edi
	andl	$-16, %edi
	movl	%esi, %ebx
	subl	%edi, %ebx
	imull	%eax, %ebx
	sarl	$4, %ecx
	movl	%edx, %edi
	sarl	$31, %edi
	shrl	$28, %edi
	addl	%edx, %edi
	sarl	$4, %edi
	vcvtsi2ssl	%ebx, %xmm0, %xmm0
	imull	%edi, %ecx
	vcvtsi2ssl	%ecx, %xmm1, %xmm1
	addl	%ebx, %eax
	vcvtsi2ssl	%eax, %xmm2, %xmm2
	addl	%ecx, %edi
	vcvtsi2ssl	%edi, %xmm3, %xmm3
	movslq	%esi, %rdx
	vcvttss2si	%xmm0, %eax
	movl	%eax, 36(%rsp)          ## 4-byte Spill
	vcvttss2si	%xmm1, %eax
	movl	%eax, 44(%rsp)          ## 4-byte Spill
	vcvttss2si	%xmm2, %eax
	movl	%eax, 28(%rsp)          ## 4-byte Spill
	vcvttss2si	%xmm3, %eax
	movl	%eax, 40(%rsp)          ## 4-byte Spill
	cmpl	$0, 2248(%r13,%rdx,4)
	jle	LBB17_13
## %bb.1:
	vmovsd	3552(%r13), %xmm0       ## xmm0 = mem[0],zero
	vmovss	3560(%r13), %xmm1       ## xmm1 = mem[0],zero,zero,zero
	vmovss	112(%r13), %xmm14       ## xmm14 = mem[0],zero,zero,zero
	vmovss	116(%r13), %xmm12       ## xmm12 = mem[0],zero,zero,zero
	vmovss	120(%r13), %xmm13       ## xmm13 = mem[0],zero,zero,zero
	vmovss	124(%r13), %xmm9        ## xmm9 = mem[0],zero,zero,zero
	vmovss	128(%r13), %xmm6        ## xmm6 = mem[0],zero,zero,zero
	vmovss	132(%r13), %xmm5        ## xmm5 = mem[0],zero,zero,zero
	vmovsd	64(%r13), %xmm2         ## xmm2 = mem[0],zero
	vsubss	%xmm2, %xmm0, %xmm3
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vmovshdup	%xmm2, %xmm2    ## xmm2 = xmm2[1,1,3,3]
	vsubss	%xmm2, %xmm0, %xmm2
	vsubss	72(%r13), %xmm1, %xmm0
	vmulss	%xmm3, %xmm14, %xmm1
	vxorps	%xmm11, %xmm11, %xmm11
	vaddss	%xmm11, %xmm1, %xmm1
	vmulss	%xmm2, %xmm12, %xmm4
	vaddss	%xmm1, %xmm4, %xmm1
	vmulss	%xmm0, %xmm13, %xmm4
	vaddss	%xmm1, %xmm4, %xmm1
	vmulss	%xmm3, %xmm9, %xmm4
	vaddss	%xmm11, %xmm4, %xmm4
	vmovss	%xmm6, 160(%rsp)        ## 4-byte Spill
	vmulss	%xmm2, %xmm6, %xmm6
	vaddss	%xmm4, %xmm6, %xmm4
	vmovss	%xmm5, 96(%rsp)         ## 4-byte Spill
	vmulss	%xmm0, %xmm5, %xmm6
	vaddss	%xmm4, %xmm6, %xmm4
	vinsertps	$16, %xmm4, %xmm1, %xmm1 ## xmm1 = xmm1[0],xmm4[0],xmm1[2,3]
	vmovss	144(%r13), %xmm6        ## xmm6 = mem[0],zero,zero,zero
	vmulss	%xmm0, %xmm6, %xmm4
	vmovss	136(%r13), %xmm8        ## xmm8 = mem[0],zero,zero,zero
	vmovss	140(%r13), %xmm10       ## xmm10 = mem[0],zero,zero,zero
	vmulss	%xmm2, %xmm10, %xmm2
	vmulss	%xmm3, %xmm8, %xmm3
	vaddss	%xmm11, %xmm3, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vaddss	%xmm2, %xmm4, %xmm2
	vbroadcastss	%xmm1, %ymm0
	vmovaps	%ymm0, 864(%rsp)        ## 32-byte Spill
	vmovshdup	%xmm1, %xmm1    ## xmm1 = xmm1[1,1,3,3]
	vbroadcastsd	%xmm1, %ymm0
	vmovaps	%ymm0, 832(%rsp)        ## 32-byte Spill
	vbroadcastss	%xmm2, %ymm0
	vmovaps	%ymm0, 800(%rsp)        ## 32-byte Spill
	xorl	%esi, %esi
	movq	%rdx, 64(%rsp)          ## 8-byte Spill
	jmp	LBB17_2
	.p2align	4, 0x90
LBB17_25:                               ##   in Loop: Header=BB17_2 Depth=1
	vmovss	112(%r13), %xmm14       ## xmm14 = mem[0],zero,zero,zero
	vmovss	116(%r13), %xmm12       ## xmm12 = mem[0],zero,zero,zero
	vmovss	120(%r13), %xmm13       ## xmm13 = mem[0],zero,zero,zero
	vmovss	124(%r13), %xmm9        ## xmm9 = mem[0],zero,zero,zero
	vmovss	128(%r13), %xmm0        ## xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 160(%rsp)        ## 4-byte Spill
	vmovss	132(%r13), %xmm0        ## xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 96(%rsp)         ## 4-byte Spill
	vmovss	136(%r13), %xmm8        ## xmm8 = mem[0],zero,zero,zero
	vmovss	140(%r13), %xmm10       ## xmm10 = mem[0],zero,zero,zero
	vmovss	144(%r13), %xmm6        ## xmm6 = mem[0],zero,zero,zero
LBB17_2:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB17_5 Depth 2
                                        ##       Child Loop BB17_7 Depth 3
	movq	184(%r13), %rcx
	movq	200(%r13,%rdx,8), %rax
	movq	%rsi, 72(%rsp)          ## 8-byte Spill
	movslq	(%rax,%rsi,4), %rax
	imulq	$168, %rax, %rdx
	vmovsd	116(%rcx,%rdx), %xmm3   ## xmm3 = mem[0],zero
	vmovsd	128(%rcx,%rdx), %xmm1   ## xmm1 = mem[0],zero
	vmovsd	140(%rcx,%rdx), %xmm2   ## xmm2 = mem[0],zero
	vsubps	%xmm3, %xmm1, %xmm1
	vsubps	%xmm3, %xmm2, %xmm2
	vpermilps	$225, %xmm2, %xmm4 ## xmm4 = xmm2[1,0,2,3]
	movl	152(%rcx,%rdx), %eax
	movl	160(%rcx,%rdx), %r8d
	movl	164(%rcx,%rdx), %edi
	movl	36(%rsp), %esi          ## 4-byte Reload
	cmpl	%esi, %eax
	cmovll	%esi, %eax
	movl	28(%rsp), %esi          ## 4-byte Reload
	cmpl	%esi, %r8d
	movl	%r8d, %ebx
	cmovgl	%esi, %ebx
	movl	40(%rsp), %esi          ## 4-byte Reload
	cmpl	%esi, %edi
	cmovgl	%esi, %edi
	movl	%edi, 48(%rsp)          ## 4-byte Spill
	vcvtps2pd	%xmm4, %xmm4
	vcvtps2pd	%xmm1, %xmm5
	vmulpd	%xmm4, %xmm5, %xmm4
	vpermilpd	$1, %xmm4, %xmm5 ## xmm5 = xmm4[1,0]
	vsubsd	%xmm5, %xmm4, %xmm15
	vandpd	LCPI17_0(%rip), %xmm15, %xmm5
	vmovsd	LCPI17_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	vucomisd	%xmm5, %xmm0
	ja	LBB17_24
## %bb.3:                               ##   in Loop: Header=BB17_2 Depth=1
	movl	156(%rcx,%rdx), %edi
	movl	44(%rsp), %esi          ## 4-byte Reload
	cmpl	%esi, %edi
	cmovll	%esi, %edi
	movl	%edi, 32(%rsp)          ## 4-byte Spill
	cmpl	48(%rsp), %edi          ## 4-byte Folded Reload
	jge	LBB17_24
## %bb.4:                               ##   in Loop: Header=BB17_2 Depth=1
	vmovsd	36(%rcx,%rdx), %xmm5    ## xmm5 = mem[0],zero
	vmovss	%xmm6, 320(%rsp)        ## 4-byte Spill
	vmulss	%xmm5, %xmm14, %xmm6
	vmovaps	%xmm14, %xmm11
	vxorps	%xmm14, %xmm14, %xmm14
	vaddss	%xmm14, %xmm6, %xmm6
	vmovshdup	%xmm5, %xmm0    ## xmm0 = xmm5[1,1,3,3]
	vmovaps	%xmm2, 416(%rsp)        ## 16-byte Spill
	vmovaps	%xmm9, %xmm2
	vmovss	%xmm9, 384(%rsp)        ## 4-byte Spill
	vmovaps	%xmm13, %xmm9
	vmovaps	%xmm12, %xmm4
	vmovss	%xmm12, 352(%rsp)       ## 4-byte Spill
	vmovaps	%xmm8, %xmm13
	vmovss	%xmm8, 448(%rsp)        ## 4-byte Spill
	vmovss	160(%rsp), %xmm12       ## 4-byte Reload
                                        ## xmm12 = mem[0],zero,zero,zero
	vmulss	%xmm0, %xmm4, %xmm8
	vaddss	%xmm6, %xmm8, %xmm6
	vmovss	96(%rsp), %xmm4         ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	vmovss	44(%rcx,%rdx), %xmm7    ## xmm7 = mem[0],zero,zero,zero
	vmovaps	%xmm1, 288(%rsp)        ## 16-byte Spill
	vmulss	%xmm7, %xmm9, %xmm1
	vaddss	%xmm6, %xmm1, %xmm1
	vmulss	%xmm5, %xmm2, %xmm6
	vaddss	%xmm14, %xmm6, %xmm6
	vmulss	%xmm0, %xmm12, %xmm2
	vaddss	%xmm6, %xmm2, %xmm2
	vmulss	%xmm7, %xmm4, %xmm6
	vmovss	%xmm4, 96(%rsp)         ## 4-byte Spill
	vaddss	%xmm2, %xmm6, %xmm2
	vinsertps	$16, %xmm2, %xmm1, %xmm1 ## xmm1 = xmm1[0],xmm2[0],xmm1[2,3]
	vmovaps	%xmm1, 128(%rsp)        ## 16-byte Spill
	vmulss	%xmm5, %xmm13, %xmm1
	vaddss	%xmm14, %xmm1, %xmm1
	vmulss	%xmm0, %xmm10, %xmm0
	vmovaps	%xmm10, %xmm8
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	320(%rsp), %xmm10       ## 4-byte Reload
                                        ## xmm10 = mem[0],zero,zero,zero
	vmulss	%xmm7, %xmm10, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vmovaps	%xmm0, 256(%rsp)        ## 16-byte Spill
	vmovsd	48(%rcx,%rdx), %xmm1    ## xmm1 = mem[0],zero
	vmulss	%xmm1, %xmm11, %xmm0
	vaddss	%xmm14, %xmm0, %xmm0
	vxorps	%xmm6, %xmm6, %xmm6
	vmovshdup	%xmm1, %xmm2    ## xmm2 = xmm1[1,1,3,3]
	vmovss	352(%rsp), %xmm13       ## 4-byte Reload
                                        ## xmm13 = mem[0],zero,zero,zero
	vmulss	%xmm2, %xmm13, %xmm5
	vaddss	%xmm0, %xmm5, %xmm0
	vmovss	56(%rcx,%rdx), %xmm5    ## xmm5 = mem[0],zero,zero,zero
	vmulss	%xmm5, %xmm9, %xmm7
	vaddss	%xmm0, %xmm7, %xmm0
	vmovss	384(%rsp), %xmm14       ## 4-byte Reload
                                        ## xmm14 = mem[0],zero,zero,zero
	vmulss	%xmm1, %xmm14, %xmm7
	vaddss	%xmm6, %xmm7, %xmm7
	vmulss	%xmm2, %xmm12, %xmm6
	vaddss	%xmm7, %xmm6, %xmm6
	vmulss	%xmm5, %xmm4, %xmm7
	vaddss	%xmm6, %xmm7, %xmm6
	vinsertps	$16, %xmm6, %xmm0, %xmm0 ## xmm0 = xmm0[0],xmm6[0],xmm0[2,3]
	vmovaps	%xmm0, 224(%rsp)        ## 16-byte Spill
	vmovss	448(%rsp), %xmm4        ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	vmulss	%xmm1, %xmm4, %xmm1
	vaddss	LCPI17_12(%rip), %xmm1, %xmm1
	vmulss	%xmm2, %xmm8, %xmm2
	vaddss	%xmm1, %xmm2, %xmm1
	vmulss	%xmm5, %xmm10, %xmm2
	vaddss	%xmm1, %xmm2, %xmm0
	vmovaps	%xmm0, 192(%rsp)        ## 16-byte Spill
	vmovsd	60(%rcx,%rdx), %xmm1    ## xmm1 = mem[0],zero
	vmulss	%xmm1, %xmm11, %xmm2
	vxorps	%xmm0, %xmm0, %xmm0
	vaddss	%xmm0, %xmm2, %xmm2
	vmovshdup	%xmm1, %xmm6    ## xmm6 = xmm1[1,1,3,3]
	vmulss	%xmm6, %xmm13, %xmm5
	vaddss	%xmm2, %xmm5, %xmm2
	vmovss	68(%rcx,%rdx), %xmm7    ## xmm7 = mem[0],zero,zero,zero
	vmulss	%xmm7, %xmm9, %xmm5
	vaddss	%xmm2, %xmm5, %xmm2
	vmulss	%xmm1, %xmm14, %xmm5
	vaddss	%xmm0, %xmm5, %xmm5
	vxorps	%xmm9, %xmm9, %xmm9
	vmulss	%xmm6, %xmm12, %xmm0
	vaddss	%xmm5, %xmm0, %xmm0
	vmulss	96(%rsp), %xmm7, %xmm5  ## 4-byte Folded Reload
	vaddss	%xmm0, %xmm5, %xmm0
	vinsertps	$16, %xmm0, %xmm2, %xmm5 ## xmm5 = xmm2[0],xmm0[0],xmm2[2,3]
	vmulss	%xmm1, %xmm4, %xmm0
	vaddss	%xmm9, %xmm0, %xmm0
	vxorps	%xmm14, %xmm14, %xmm14
	vmulss	%xmm6, %xmm8, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vmulss	%xmm7, %xmm10, %xmm1
	vaddss	%xmm0, %xmm1, %xmm8
	vmovss	124(%rcx,%rdx), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vmovss	136(%rcx,%rdx), %xmm1   ## xmm1 = mem[0],zero,zero,zero
	vmovsd	LCPI17_2(%rip), %xmm2   ## xmm2 = mem[0],zero
	vdivsd	%xmm15, %xmm2, %xmm2
	movq	%rbx, %rsi
	subl	%eax, %esi
	movq	%rsi, 80(%rsp)          ## 8-byte Spill
	leal	(,%rsi,4), %r14d
	vmovd	%eax, %xmm4
	vpbroadcastd	%xmm4, %ymm15
	vbroadcastss	%xmm3, %ymm4
	vmovaps	%ymm4, 160(%rsp)        ## 32-byte Spill
	vmovshdup	%xmm3, %xmm3    ## xmm3 = xmm3[1,1,3,3]
	vbroadcastsd	%xmm3, %ymm3
	vmovaps	%ymm3, 448(%rsp)        ## 32-byte Spill
	vcvtsd2ss	%xmm2, %xmm2, %xmm2
	vbroadcastss	LCPI17_3(%rip), %xmm3 ## xmm3 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	vmovaps	288(%rsp), %xmm7        ## 16-byte Reload
	vmovshdup	%xmm7, %xmm4    ## xmm4 = xmm7[1,1,3,3]
	vxorps	%xmm3, %xmm4, %xmm4
	vmovaps	416(%rsp), %xmm6        ## 16-byte Reload
	vxorps	%xmm3, %xmm6, %xmm3
	vmovshdup	%xmm6, %xmm6    ## xmm6 = xmm6[1,1,3,3]
	vbroadcastsd	%xmm6, %ymm6
	vmovaps	%ymm6, 416(%rsp)        ## 32-byte Spill
	vbroadcastss	%xmm3, %ymm3
	vmovaps	%ymm3, 384(%rsp)        ## 32-byte Spill
	vbroadcastss	%xmm2, %ymm2
	vmovaps	%ymm2, 352(%rsp)        ## 32-byte Spill
	vbroadcastss	%xmm4, %ymm2
	vmovaps	%ymm2, 320(%rsp)        ## 32-byte Spill
	vbroadcastss	%xmm7, %ymm2
	vmovaps	%ymm2, 288(%rsp)        ## 32-byte Spill
	vbroadcastss	%xmm0, %ymm0
	vmovaps	%ymm0, 544(%rsp)        ## 32-byte Spill
	vbroadcastss	%xmm1, %ymm0
	vmovaps	%ymm0, 512(%rsp)        ## 32-byte Spill
	vmovss	148(%rcx,%rdx), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vbroadcastss	%xmm0, %ymm0
	vmovaps	%ymm0, 480(%rsp)        ## 32-byte Spill
	leal	(,%rax,4), %esi
	movq	%rsi, 88(%rsp)          ## 8-byte Spill
	vmovsd	(%rcx,%rdx), %xmm0      ## xmm0 = mem[0],zero
	vbroadcastss	%xmm0, %ymm1
	vmovaps	%ymm1, 1440(%rsp)       ## 32-byte Spill
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vbroadcastsd	%xmm0, %ymm0
	vmovaps	%ymm0, 1408(%rsp)       ## 32-byte Spill
	vmovss	8(%rcx,%rdx), %xmm0     ## xmm0 = mem[0],zero,zero,zero
	vbroadcastss	%xmm0, %ymm0
	vmovaps	%ymm0, 1376(%rsp)       ## 32-byte Spill
	vmovsd	12(%rcx,%rdx), %xmm0    ## xmm0 = mem[0],zero
	vbroadcastss	%xmm0, %ymm1
	vmovaps	%ymm1, 1344(%rsp)       ## 32-byte Spill
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vbroadcastsd	%xmm0, %ymm0
	vmovaps	%ymm0, 1312(%rsp)       ## 32-byte Spill
	vmovss	20(%rcx,%rdx), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	vbroadcastss	%xmm0, %ymm0
	vmovaps	%ymm0, 1280(%rsp)       ## 32-byte Spill
	vmovsd	24(%rcx,%rdx), %xmm0    ## xmm0 = mem[0],zero
	vbroadcastss	%xmm0, %ymm1
	vmovaps	%ymm1, 1248(%rsp)       ## 32-byte Spill
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vbroadcastsd	%xmm0, %ymm0
	vmovaps	%ymm0, 1216(%rsp)       ## 32-byte Spill
	vmovss	32(%rcx,%rdx), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	vbroadcastss	%xmm0, %ymm0
	vmovaps	%ymm0, 1184(%rsp)       ## 32-byte Spill
	leaq	96(%rcx,%rdx), %rsi
	movq	%rsi, 56(%rsp)          ## 8-byte Spill
	vmovsd	72(%rcx,%rdx), %xmm0    ## xmm0 = mem[0],zero
	vbroadcastss	%xmm0, %ymm1
	vmovaps	%ymm1, 768(%rsp)        ## 32-byte Spill
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vbroadcastsd	%xmm0, %ymm0
	vmovaps	%ymm0, 736(%rsp)        ## 32-byte Spill
	vmovsd	80(%rcx,%rdx), %xmm0    ## xmm0 = mem[0],zero
	vbroadcastss	%xmm0, %ymm1
	vmovaps	%ymm1, 704(%rsp)        ## 32-byte Spill
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vbroadcastsd	%xmm0, %ymm0
	vmovaps	%ymm0, 672(%rsp)        ## 32-byte Spill
	vmovsd	88(%rcx,%rdx), %xmm0    ## xmm0 = mem[0],zero
	vbroadcastss	%xmm0, %ymm1
	vmovaps	%ymm1, 640(%rsp)        ## 32-byte Spill
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vbroadcastsd	%xmm0, %ymm0
	vmovaps	%ymm0, 608(%rsp)        ## 32-byte Spill
	vmovaps	128(%rsp), %xmm1        ## 16-byte Reload
	vbroadcastss	%xmm1, %ymm0
	vmovaps	%ymm0, 1152(%rsp)       ## 32-byte Spill
	vmovshdup	%xmm1, %xmm0    ## xmm0 = xmm1[1,1,3,3]
	vbroadcastsd	%xmm0, %ymm0
	vmovaps	%ymm0, 1120(%rsp)       ## 32-byte Spill
	vbroadcastss	256(%rsp), %ymm0 ## 16-byte Folded Reload
	vmovaps	%ymm0, 1088(%rsp)       ## 32-byte Spill
	vmovaps	224(%rsp), %xmm1        ## 16-byte Reload
	vbroadcastss	%xmm1, %ymm0
	vmovaps	%ymm0, 1056(%rsp)       ## 32-byte Spill
	vmovshdup	%xmm1, %xmm0    ## xmm0 = xmm1[1,1,3,3]
	vbroadcastsd	%xmm0, %ymm0
	vmovaps	%ymm0, 1024(%rsp)       ## 32-byte Spill
	vbroadcastss	192(%rsp), %ymm0 ## 16-byte Folded Reload
	vmovaps	%ymm0, 992(%rsp)        ## 32-byte Spill
	vbroadcastss	%xmm5, %ymm0
	vmovaps	%ymm0, 960(%rsp)        ## 32-byte Spill
	vmovshdup	%xmm5, %xmm0    ## xmm0 = xmm5[1,1,3,3]
	vbroadcastsd	%xmm0, %ymm0
	vmovaps	%ymm0, 928(%rsp)        ## 32-byte Spill
	movl	28(%rsp), %ecx          ## 4-byte Reload
	cmpl	%ecx, %r8d
	cmovgl	%ecx, %r8d
	vbroadcastss	%xmm8, %ymm0
	vmovaps	%ymm0, 896(%rsp)        ## 32-byte Spill
	movl	%r8d, %ecx
	notl	%ecx
	addl	%eax, %ecx
	subl	%eax, %r8d
	shll	$2, %r8d
	cmpl	$7, %r8d
	movl	$8, %eax
	cmovlel	%eax, %r8d
	decl	%r8d
	andl	$-8, %r8d
	leal	11(,%rcx,4), %eax
	movl	%eax, 52(%rsp)          ## 4-byte Spill
	addq	$8, %r8
	vmovdqa	%ymm15, 1472(%rsp)      ## 32-byte Spill
	.p2align	4, 0x90
LBB17_5:                                ##   Parent Loop BB17_2 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB17_7 Depth 3
	cmpl	$0, 80(%rsp)            ## 4-byte Folded Reload
	jle	LBB17_23
## %bb.6:                               ##   in Loop: Header=BB17_5 Depth=2
	movl	32(%rsp), %eax          ## 4-byte Reload
	vxorps	%xmm13, %xmm13, %xmm13
	vcvtsi2ssl	%eax, %xmm13, %xmm0
	vbroadcastss	%xmm0, %ymm0
	vmovaps	%ymm0, 96(%rsp)         ## 32-byte Spill
	xorl	%r12d, %r12d
	movl	52(%rsp), %eax          ## 4-byte Reload
	movl	%eax, %r15d
	.p2align	4, 0x90
LBB17_7:                                ##   Parent Loop BB17_2 Depth=1
                                        ##     Parent Loop BB17_5 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	vmovd	%r12d, %xmm0
	vpbroadcastd	%xmm0, %ymm0
	vpaddd	LCPI17_4(%rip), %ymm0, %ymm0
	vpsrld	$2, %ymm0, %ymm0
	vpaddd	%ymm15, %ymm0, %ymm0
	vcvtdq2ps	%ymm0, %ymm0
	vaddps	3296(%r13), %ymm0, %ymm0
	vmovaps	96(%rsp), %ymm1         ## 32-byte Reload
	vaddps	3328(%r13), %ymm1, %ymm1
	vsubps	160(%rsp), %ymm0, %ymm0 ## 32-byte Folded Reload
	vsubps	448(%rsp), %ymm1, %ymm1 ## 32-byte Folded Reload
	vmulps	416(%rsp), %ymm0, %ymm2 ## 32-byte Folded Reload
	vmulps	384(%rsp), %ymm1, %ymm3 ## 32-byte Folded Reload
	vaddps	%ymm3, %ymm2, %ymm2
	vmovaps	352(%rsp), %ymm3        ## 32-byte Reload
	vmulps	%ymm2, %ymm3, %ymm4
	vmulps	320(%rsp), %ymm0, %ymm0 ## 32-byte Folded Reload
	vmulps	288(%rsp), %ymm1, %ymm1 ## 32-byte Folded Reload
	vaddps	%ymm1, %ymm0, %ymm0
	vmulps	%ymm0, %ymm3, %ymm3
	vaddps	%ymm3, %ymm4, %ymm0
	vbroadcastss	LCPI17_5(%rip), %ymm12 ## ymm12 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vsubps	%ymm0, %ymm12, %ymm5
	vcmpleps	%ymm4, %ymm14, %ymm0
	vcmpleps	%ymm3, %ymm14, %ymm1
	vandps	%ymm0, %ymm1, %ymm0
	vcmpleps	%ymm5, %ymm14, %ymm1
	vandps	%ymm1, %ymm0, %ymm2
	leal	8(%r12), %eax
	cmpl	%r14d, %eax
	jle	LBB17_9
## %bb.8:                               ##   in Loop: Header=BB17_7 Depth=3
	leal	1(%r15), %edx
	shlq	$2, %rdx
	movl	%r15d, %eax
	shlq	$2, %rax
	leaq	604(%rsp), %rdi
	subq	%rax, %rdi
	vmovaps	%ymm14, 576(%rsp)
	movl	$255, %esi
	movq	%r8, %rbx
	vmovaps	%ymm12, 128(%rsp)       ## 32-byte Spill
	vmovaps	%ymm4, 256(%rsp)        ## 32-byte Spill
	vmovaps	%ymm3, 224(%rsp)        ## 32-byte Spill
	vmovaps	%ymm5, 192(%rsp)        ## 32-byte Spill
	vmovaps	%ymm2, 1504(%rsp)       ## 32-byte Spill
	vzeroupper
	callq	_memset
	vmovdqa	1504(%rsp), %ymm2       ## 32-byte Reload
	vmovaps	192(%rsp), %ymm5        ## 32-byte Reload
	vmovaps	224(%rsp), %ymm3        ## 32-byte Reload
	vmovaps	256(%rsp), %ymm4        ## 32-byte Reload
	vmovaps	128(%rsp), %ymm12       ## 32-byte Reload
	vmovdqa	1472(%rsp), %ymm15      ## 32-byte Reload
	movq	%rbx, %r8
	vxorps	%xmm14, %xmm14, %xmm14
	vmovdqa	576(%rsp), %ymm0
	vpblendvb	%ymm0, %ymm14, %ymm2, %ymm2
LBB17_9:                                ##   in Loop: Header=BB17_7 Depth=3
	vptest	%ymm2, %ymm2
	je	LBB17_22
## %bb.10:                              ##   in Loop: Header=BB17_7 Depth=3
	vmulps	544(%rsp), %ymm5, %ymm0 ## 32-byte Folded Reload
	vmulps	512(%rsp), %ymm4, %ymm1 ## 32-byte Folded Reload
	vaddps	%ymm0, %ymm1, %ymm0
	vmulps	480(%rsp), %ymm3, %ymm1 ## 32-byte Folded Reload
	vaddps	%ymm0, %ymm1, %ymm0
	vdivps	%ymm0, %ymm12, %ymm0
	movl	24(%r13), %eax
	imull	32(%rsp), %eax          ## 4-byte Folded Reload
	movq	88(%rsp), %rcx          ## 8-byte Reload
	leal	(%rcx,%r12), %ecx
	addl	%eax, %ecx
	movq	48(%r13), %rdx
	movslq	%ecx, %rax
	vmaskmovps	(%rdx,%rax,4), %ymm2, %ymm1
	vcmpltps	%ymm1, %ymm0, %ymm1
	vandps	%ymm1, %ymm2, %ymm1
	vptest	%ymm1, %ymm1
	jne	LBB17_11
LBB17_22:                               ##   in Loop: Header=BB17_7 Depth=3
	addl	$8, %r15d
	addq	$8, %r12
	cmpq	%r12, %r8
	jne	LBB17_7
	jmp	LBB17_23
LBB17_11:                               ##   in Loop: Header=BB17_7 Depth=3
	vmulps	544(%rsp), %ymm0, %ymm2 ## 32-byte Folded Reload
	vmulps	%ymm2, %ymm5, %ymm6
	vmulps	512(%rsp), %ymm0, %ymm2 ## 32-byte Folded Reload
	vmulps	%ymm2, %ymm4, %ymm7
	vmulps	480(%rsp), %ymm0, %ymm2 ## 32-byte Folded Reload
	vmulps	%ymm2, %ymm3, %ymm2
	vmulps	1440(%rsp), %ymm6, %ymm3 ## 32-byte Folded Reload
	vmulps	1408(%rsp), %ymm6, %ymm4 ## 32-byte Folded Reload
	vmulps	1376(%rsp), %ymm6, %ymm5 ## 32-byte Folded Reload
	vmulps	1344(%rsp), %ymm7, %ymm8 ## 32-byte Folded Reload
	vaddps	%ymm8, %ymm3, %ymm3
	vmulps	1312(%rsp), %ymm7, %ymm8 ## 32-byte Folded Reload
	vaddps	%ymm8, %ymm4, %ymm4
	vmulps	1280(%rsp), %ymm7, %ymm8 ## 32-byte Folded Reload
	vaddps	%ymm8, %ymm5, %ymm5
	vmulps	1248(%rsp), %ymm2, %ymm8 ## 32-byte Folded Reload
	vaddps	%ymm3, %ymm8, %ymm11
	vmulps	1216(%rsp), %ymm2, %ymm8 ## 32-byte Folded Reload
	vaddps	%ymm4, %ymm8, %ymm13
	vmulps	1184(%rsp), %ymm2, %ymm8 ## 32-byte Folded Reload
	vaddps	%ymm5, %ymm8, %ymm3
	movq	56(%rsp), %rcx          ## 8-byte Reload
	movq	(%rcx), %rcx
	testq	%rcx, %rcx
	vmovaps	%ymm3, 128(%rsp)        ## 32-byte Spill
	je	LBB17_12
## %bb.20:                              ##   in Loop: Header=BB17_7 Depth=3
	vmulps	768(%rsp), %ymm6, %ymm8 ## 32-byte Folded Reload
	vmulps	736(%rsp), %ymm6, %ymm9 ## 32-byte Folded Reload
	vmulps	704(%rsp), %ymm7, %ymm10 ## 32-byte Folded Reload
	vaddps	%ymm10, %ymm8, %ymm8
	vmulps	672(%rsp), %ymm7, %ymm10 ## 32-byte Folded Reload
	vaddps	%ymm10, %ymm9, %ymm9
	vmulps	640(%rsp), %ymm2, %ymm10 ## 32-byte Folded Reload
	vaddps	%ymm8, %ymm10, %ymm8
	vmulps	608(%rsp), %ymm2, %ymm10 ## 32-byte Folded Reload
	vaddps	%ymm9, %ymm10, %ymm9
	vroundps	$9, %ymm8, %ymm10
	vsubps	%ymm10, %ymm8, %ymm8
	vroundps	$9, %ymm9, %ymm10
	vsubps	%ymm10, %ymm9, %ymm9
	movl	(%rcx), %edx
	vxorps	%xmm12, %xmm12, %xmm12
	vcvtsi2ssl	%edx, %xmm12, %xmm3
	movl	4(%rcx), %esi
	vbroadcastss	%xmm3, %ymm3
	vmulps	%ymm3, %ymm8, %ymm3
	vcvttps2dq	%ymm3, %ymm3
	vxorps	%xmm12, %xmm12, %xmm12
	vcvtsi2ssl	%esi, %xmm12, %xmm4
	vbroadcastss	%xmm4, %ymm4
	vmulps	%ymm4, %ymm9, %ymm4
	vcvttps2dq	%ymm4, %ymm4
	leal	-1(%rdx), %edi
	vmovd	%edi, %xmm5
	vpbroadcastd	%xmm5, %ymm5
	vpminsd	%ymm5, %ymm3, %ymm3
	decl	%esi
	vmovd	%esi, %xmm5
	vpbroadcastd	%xmm5, %ymm5
	vpminsd	%ymm5, %ymm4, %ymm4
	vmovd	%edx, %xmm5
	vpbroadcastd	%xmm5, %ymm5
	vpmulld	%ymm5, %ymm4, %ymm4
	vpaddd	%ymm3, %ymm4, %ymm3
	movq	16(%rcx), %rcx
	vpxor	%xmm4, %xmm4, %xmm4
	vmovdqa	%ymm1, %ymm5
	vpgatherdd	%ymm5, (%rcx,%ymm3,4), %ymm4
	vpsrld	$24, %ymm4, %ymm3
	vcvtdq2ps	%ymm3, %ymm3
	vbroadcastss	LCPI17_6(%rip), %ymm5 ## ymm5 = [2.55E+2,2.55E+2,2.55E+2,2.55E+2,2.55E+2,2.55E+2,2.55E+2,2.55E+2]
	vdivps	%ymm5, %ymm3, %ymm8
	vpshufb	LCPI17_7(%rip), %ymm4, %ymm3 ## ymm3 = ymm4[2],zero,zero,zero,ymm4[6],zero,zero,zero,ymm4[10],zero,zero,zero,ymm4[14],zero,zero,zero,ymm4[18],zero,zero,zero,ymm4[22],zero,zero,zero,ymm4[26],zero,zero,zero,ymm4[30],zero,zero,zero
	vcvtdq2ps	%ymm3, %ymm3
	vdivps	%ymm5, %ymm3, %ymm9
	vpshufb	LCPI17_8(%rip), %ymm4, %ymm3 ## ymm3 = ymm4[1],zero,zero,zero,ymm4[5],zero,zero,zero,ymm4[9],zero,zero,zero,ymm4[13],zero,zero,zero,ymm4[17],zero,zero,zero,ymm4[21],zero,zero,zero,ymm4[25],zero,zero,zero,ymm4[29],zero,zero,zero
	vcvtdq2ps	%ymm3, %ymm3
	vdivps	%ymm5, %ymm3, %ymm12
	jmp	LBB17_21
LBB17_12:                               ##   in Loop: Header=BB17_7 Depth=3
	vmovaps	%ymm12, %ymm9
	vmovaps	%ymm12, %ymm8
LBB17_21:                               ##   in Loop: Header=BB17_7 Depth=3
	vmulps	1152(%rsp), %ymm6, %ymm3 ## 32-byte Folded Reload
	vmulps	1120(%rsp), %ymm6, %ymm4 ## 32-byte Folded Reload
	vmulps	1056(%rsp), %ymm7, %ymm5 ## 32-byte Folded Reload
	vaddps	%ymm5, %ymm3, %ymm3
	vmulps	1024(%rsp), %ymm7, %ymm5 ## 32-byte Folded Reload
	vaddps	%ymm5, %ymm4, %ymm4
	vmulps	1088(%rsp), %ymm6, %ymm5 ## 32-byte Folded Reload
	vmulps	992(%rsp), %ymm7, %ymm6 ## 32-byte Folded Reload
	vaddps	%ymm6, %ymm5, %ymm5
	vmulps	960(%rsp), %ymm2, %ymm6 ## 32-byte Folded Reload
	vaddps	%ymm3, %ymm6, %ymm3
	vmulps	928(%rsp), %ymm2, %ymm6 ## 32-byte Folded Reload
	vaddps	%ymm4, %ymm6, %ymm4
	vmulps	896(%rsp), %ymm2, %ymm2 ## 32-byte Folded Reload
	vaddps	%ymm5, %ymm2, %ymm2
	vmulps	%ymm3, %ymm3, %ymm5
	vmulps	%ymm4, %ymm4, %ymm6
	vaddps	%ymm6, %ymm5, %ymm5
	vmulps	%ymm2, %ymm2, %ymm6
	vaddps	%ymm5, %ymm6, %ymm5
	vrsqrtps	%ymm5, %ymm5
	vmulps	%ymm5, %ymm3, %ymm3
	vmulps	%ymm5, %ymm4, %ymm4
	vmulps	%ymm5, %ymm2, %ymm2
	vmovaps	864(%rsp), %ymm5        ## 32-byte Reload
	vsubps	%ymm11, %ymm5, %ymm5
	vmovaps	832(%rsp), %ymm6        ## 32-byte Reload
	vsubps	%ymm13, %ymm6, %ymm6
	vmovaps	800(%rsp), %ymm7        ## 32-byte Reload
	vsubps	128(%rsp), %ymm7, %ymm7 ## 32-byte Folded Reload
	vmulps	%ymm5, %ymm5, %ymm10
	vmulps	%ymm6, %ymm6, %ymm11
	vaddps	%ymm11, %ymm10, %ymm10
	vmulps	%ymm7, %ymm7, %ymm11
	vaddps	%ymm10, %ymm11, %ymm10
	vrsqrtps	%ymm10, %ymm10
	vmulps	%ymm10, %ymm5, %ymm5
	vmulps	%ymm5, %ymm3, %ymm3
	vmulps	%ymm10, %ymm6, %ymm5
	vmulps	%ymm5, %ymm4, %ymm4
	vaddps	%ymm4, %ymm3, %ymm3
	vmulps	%ymm10, %ymm7, %ymm4
	vmulps	%ymm4, %ymm2, %ymm2
	vaddps	%ymm3, %ymm2, %ymm2
	vmaxps	%ymm14, %ymm2, %ymm2
	vmulps	%ymm2, %ymm8, %ymm3
	vmulps	%ymm2, %ymm9, %ymm4
	vmulps	%ymm2, %ymm12, %ymm2
	movq	56(%rsp), %rcx          ## 8-byte Reload
	vmovsd	8(%rcx), %xmm5          ## xmm5 = mem[0],zero
	vbroadcastss	%xmm5, %ymm6
	vmulps	%ymm6, %ymm3, %ymm3
	vmovshdup	%xmm5, %xmm5    ## xmm5 = xmm5[1,1,3,3]
	vbroadcastsd	%xmm5, %ymm5
	vmulps	%ymm5, %ymm4, %ymm4
	vbroadcastss	16(%rcx), %ymm5
	vmulps	%ymm5, %ymm2, %ymm2
	vbroadcastss	LCPI17_6(%rip), %ymm5 ## ymm5 = [2.55E+2,2.55E+2,2.55E+2,2.55E+2,2.55E+2,2.55E+2,2.55E+2,2.55E+2]
	vmulps	%ymm5, %ymm3, %ymm3
	vmulps	%ymm5, %ymm4, %ymm4
	vmulps	%ymm5, %ymm2, %ymm2
	vcvttps2dq	%ymm3, %ymm3
	vpslld	$24, %ymm3, %ymm3
	vcvttps2dq	%ymm4, %ymm4
	vpslld	$16, %ymm4, %ymm4
	vpor	%ymm3, %ymm4, %ymm3
	vcvttps2dq	%ymm2, %ymm2
	vpslld	$8, %ymm2, %ymm2
	vpor	%ymm2, %ymm3, %ymm2
	movq	40(%r13), %rcx
	vpmaskmovd	%ymm2, %ymm1, (%rcx,%rax,4)
	movq	48(%r13), %rcx
	vmaskmovps	%ymm0, %ymm1, (%rcx,%rax,4)
	addl	$8, %r15d
	addq	$8, %r12
	cmpq	%r12, %r8
	jne	LBB17_7
	.p2align	4, 0x90
LBB17_23:                               ##   in Loop: Header=BB17_5 Depth=2
	movl	32(%rsp), %eax          ## 4-byte Reload
	incl	%eax
	movl	%eax, 32(%rsp)          ## 4-byte Spill
	cmpl	48(%rsp), %eax          ## 4-byte Folded Reload
	jl	LBB17_5
LBB17_24:                               ##   in Loop: Header=BB17_2 Depth=1
	movq	72(%rsp), %rsi          ## 8-byte Reload
	incq	%rsi
	movq	64(%rsp), %rdx          ## 8-byte Reload
	movslq	2248(%r13,%rdx,4), %rax
	cmpq	%rax, %rsi
	jl	LBB17_25
LBB17_13:
	movl	44(%rsp), %r12d         ## 4-byte Reload
	cmpl	40(%rsp), %r12d         ## 4-byte Folded Reload
	jge	LBB17_19
## %bb.14:
	movl	28(%rsp), %eax          ## 4-byte Reload
	cmpl	%eax, 36(%rsp)          ## 4-byte Folded Reload
	jge	LBB17_19
## %bb.15:
	movl	36(%rsp), %ecx          ## 4-byte Reload
	movslq	%ecx, %r8
	movq	16(%r13), %r10
	movq	40(%r13), %rax
	movslq	28(%rsp), %r11          ## 4-byte Folded Reload
	shll	$2, %ecx
	movslq	%ecx, %rcx
	leaq	8(%rax,%rcx,4), %r9
	vmovss	LCPI17_9(%rip), %xmm12  ## xmm12 = mem[0],zero,zero,zero
	vxorps	%xmm8, %xmm8, %xmm8
	vmovss	LCPI17_10(%rip), %xmm9  ## xmm9 = mem[0],zero,zero,zero
	vmovss	LCPI17_6(%rip), %xmm10  ## xmm10 = mem[0],zero,zero,zero
	vmovss	LCPI17_11(%rip), %xmm11 ## xmm11 = mem[0],zero,zero,zero
	.p2align	4, 0x90
LBB17_16:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB17_17 Depth 2
	movq	%r9, %rdi
	movq	%r8, %r14
	.p2align	4, 0x90
LBB17_17:                               ##   Parent Loop BB17_16 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	24(%r13), %ecx
	imull	%r12d, %ecx
	movslq	%ecx, %rsi
	movl	-8(%rdi,%rsi,4), %ebx
	movl	-4(%rdi,%rsi,4), %ecx
	movl	%ebx, %eax
	movzbl	%bh, %edx
	movl	%edx, %r15d
	shrl	$24, %ebx
	vxorps	%xmm13, %xmm13, %xmm13
	vcvtsi2ssl	%ebx, %xmm13, %xmm5
	shrl	$16, %eax
	movl	%ecx, %ebx
	movzbl	%ch, %edx
	shrl	$24, %ecx
	movzbl	%al, %eax
	shrl	$16, %ebx
	vxorps	%xmm13, %xmm13, %xmm13
	vcvtsi2ssl	%r15d, %xmm13, %xmm6
	movzbl	%bl, %r15d
	vxorps	%xmm13, %xmm13, %xmm13
	vcvtsi2ssl	%edx, %xmm13, %xmm13
	movl	(%rdi,%rsi,4), %edx
	movl	%edx, %ebx
	vxorps	%xmm14, %xmm14, %xmm14
	vcvtsi2ssl	%eax, %xmm14, %xmm1
	movzbl	%dh, %eax
	vxorps	%xmm14, %xmm14, %xmm14
	vcvtsi2ssl	%ecx, %xmm14, %xmm2
	shrl	$24, %edx
	vxorps	%xmm14, %xmm14, %xmm14
	vcvtsi2ssl	%r15d, %xmm14, %xmm3
	vxorps	%xmm14, %xmm14, %xmm14
	vcvtsi2ssl	%edx, %xmm14, %xmm4
	vmulss	%xmm12, %xmm5, %xmm5
	vmulss	%xmm12, %xmm6, %xmm6
	shrl	$16, %ebx
	movzbl	%bl, %ecx
	vmulss	%xmm12, %xmm2, %xmm2
	vxorps	%xmm14, %xmm14, %xmm14
	vcvtsi2ssl	%ecx, %xmm14, %xmm14
	vmulss	%xmm12, %xmm1, %xmm1
	vxorps	%xmm7, %xmm7, %xmm7
	vcvtsi2ssl	%eax, %xmm7, %xmm7
	vaddss	%xmm8, %xmm5, %xmm5
	vmulss	%xmm12, %xmm3, %xmm15
	vmulss	%xmm12, %xmm13, %xmm0
	vmulss	%xmm12, %xmm4, %xmm4
	vaddss	%xmm8, %xmm6, %xmm6
	movl	4(%rdi,%rsi,4), %eax
	movl	%eax, %ecx
	movzbl	%ah, %edx
	shrl	$24, %eax
	vaddss	%xmm8, %xmm1, %xmm1
	vcvtsi2ssl	%eax, %xmm12, %xmm3
	vaddss	%xmm2, %xmm5, %xmm2
	vmulss	%xmm12, %xmm7, %xmm5
	shrl	$16, %ecx
	movzbl	%cl, %eax
	vaddss	%xmm0, %xmm6, %xmm0
	vcvtsi2ssl	%eax, %xmm12, %xmm6
	vaddss	%xmm15, %xmm1, %xmm1
	vcvtsi2ssl	%edx, %xmm12, %xmm7
	vaddss	%xmm4, %xmm2, %xmm2
	vaddss	%xmm5, %xmm0, %xmm0
	vmulss	%xmm12, %xmm14, %xmm4
	vmulss	%xmm12, %xmm3, %xmm3
	vaddss	%xmm4, %xmm1, %xmm1
	vaddss	%xmm3, %xmm2, %xmm2
	vmulss	%xmm12, %xmm6, %xmm3
	vmulss	%xmm12, %xmm7, %xmm4
	vaddss	%xmm3, %xmm1, %xmm1
	vaddss	%xmm4, %xmm0, %xmm0
	vmulss	%xmm9, %xmm2, %xmm2
	vmulss	%xmm9, %xmm1, %xmm1
	vsqrtss	%xmm2, %xmm2, %xmm2
	vsqrtss	%xmm1, %xmm1, %xmm1
	vmulss	%xmm9, %xmm0, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm0
	vmulss	%xmm10, %xmm2, %xmm2
	vaddss	%xmm11, %xmm2, %xmm2
	vmulss	%xmm10, %xmm1, %xmm1
	vcvttss2si	%xmm2, %rax
	vaddss	%xmm11, %xmm1, %xmm1
	vmulss	%xmm10, %xmm0, %xmm0
	vcvttss2si	%xmm1, %rcx
	vaddss	%xmm11, %xmm0, %xmm0
	vcvttss2si	%xmm0, %rdx
	shll	$24, %eax
	shll	$16, %ecx
	shll	$8, %edx
	movl	(%r13), %esi
	orl	%eax, %edx
	imull	%r12d, %esi
	addl	%r14d, %esi
	movslq	%esi, %rax
	orl	%ecx, %edx
	movl	%edx, (%r10,%rax,4)
	incq	%r14
	addq	$16, %rdi
	cmpq	%r14, %r11
	jne	LBB17_17
## %bb.18:                              ##   in Loop: Header=BB17_16 Depth=1
	incl	%r12d
	cmpl	40(%rsp), %r12d         ## 4-byte Folded Reload
	jne	LBB17_16
LBB17_19:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z10end_renderP14Render_Context ## -- Begin function _Z10end_renderP14Render_Context
	.p2align	4, 0x90
__Z10end_renderP14Render_Context:       ## @_Z10end_renderP14Render_Context
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movq	3648(%rdi), %rax
	movl	$0, 6272(%rax)
	xorl	%ecx, %ecx
	xchgl	%ecx, 6268(%rax)
	movq	3648(%rdi), %rax
	movl	$1, %esi
	lock		xaddl	%esi, 6268(%rax)
	cmpl	$255, %esi
	jg	LBB18_4
	.p2align	4, 0x90
LBB18_2:                                ## =>This Inner Loop Header: Depth=1
	movq	%rbx, %rdi
	callq	__Z11render_tileP14Render_Contexti
	movq	3648(%rbx), %rax
	lock		incl	6272(%rax)
	movq	3648(%rbx), %rax
	movl	$1, %esi
	lock		xaddl	%esi, 6268(%rax)
	cmpl	$255, %esi
	jle	LBB18_2
	jmp	LBB18_4
	.p2align	4, 0x90
LBB18_3:                                ##   in Loop: Header=BB18_4 Depth=1
	movl	$100, %edi
	callq	_usleep
LBB18_4:                                ## =>This Inner Loop Header: Depth=1
	movq	3648(%rbx), %rax
	movl	6272(%rax), %eax
	cmpl	$256, %eax              ## imm = 0x100
	jne	LBB18_3
## %bb.5:
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z11read_vertexPPcPi   ## -- Begin function _Z11read_vertexPPcPi
	.p2align	4, 0x90
__Z11read_vertexPPcPi:                  ## @_Z11read_vertexPPcPi
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r14
	pushq	%rbx
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	movq	%rsi, %rbx
	movq	%rdi, %r14
	movq	(%rdi), %rdi
	movq	%r14, %rsi
	movl	$10, %edx
	callq	_strtol
	movl	%eax, (%rbx)
	movq	(%r14), %rax
	cmpb	$47, (%rax)
	leaq	1(%rax), %rdi
	movq	%rdi, (%r14)
	jne	LBB19_3
## %bb.1:
	addq	$4, %rbx
	.p2align	4, 0x90
LBB19_2:                                ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rsi
	movl	$10, %edx
	callq	_strtol
	movl	%eax, (%rbx)
	movq	(%r14), %rax
	addq	$4, %rbx
	cmpb	$47, (%rax)
	leaq	1(%rax), %rdi
	movq	%rdi, (%r14)
	je	LBB19_2
LBB19_3:
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function _Z9load_meshPKcP7Texture
LCPI20_0:
	.long	8388608                 ## float 1.17549435E-38
LCPI20_1:
	.long	925353388               ## float 9.99999974E-6
LCPI20_2:
	.long	1065353216              ## float 1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z9load_meshPKcP7Texture
	.p2align	4, 0x90
__Z9load_meshPKcP7Texture:              ## @_Z9load_meshPKcP7Texture
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
	subq	$168, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdx, -200(%rbp)        ## 8-byte Spill
	movq	%rdi, %rbx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	%rsi, %rdi
	callq	__Z16read_entire_filePKc
	movq	%rax, %r12
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, 8(%rbx)
	movq	$0, 40(%rbx)
	movl	$8388608, %edi          ## imm = 0x800000
	vzeroupper
	callq	_malloc
	movq	%rax, -136(%rbp)        ## 8-byte Spill
	movl	$8388608, %edi          ## imm = 0x800000
	callq	_malloc
	movq	%rax, -128(%rbp)        ## 8-byte Spill
	movl	$12582912, %edi         ## imm = 0xC00000
	callq	_malloc
	movq	%rax, -144(%rbp)        ## 8-byte Spill
	movl	$176160768, %edi        ## imm = 0xA800000
	callq	_malloc
	movq	%rax, %r15
	movq	%rbx, -168(%rbp)        ## 8-byte Spill
	movq	%rax, (%rbx)
	movq	%r12, -96(%rbp)
	vmovss	LCPI20_0(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vmovaps	%xmm0, -192(%rbp)       ## 16-byte Spill
	xorl	%r13d, %r13d
	leaq	-96(%rbp), %r14
	movl	$0, -108(%rbp)          ## 4-byte Folded Spill
	movl	$0, -104(%rbp)          ## 4-byte Folded Spill
	movl	$0, -100(%rbp)          ## 4-byte Folded Spill
	movb	(%r12), %al
	cmpb	$102, %al
	jne	LBB20_2
	jmp	LBB20_16
	.p2align	4, 0x90
LBB20_5:
	movb	1(%r12), %al
	cmpb	$116, %al
	je	LBB20_12
## %bb.6:
	cmpb	$110, %al
	je	LBB20_10
## %bb.7:
	cmpb	$32, %al
	jne	LBB20_4
## %bb.8:
	addq	$2, %r12
	movq	%r12, -96(%rbp)
	movq	%r12, %rdi
	movq	%r14, %rsi
	callq	_strtof
	vmovss	%xmm0, -160(%rbp)       ## 4-byte Spill
	movq	-96(%rbp), %rdi
	incq	%rdi
	movq	%rdi, -96(%rbp)
	movq	%r14, %rsi
	callq	_strtof
	vmovss	%xmm0, -120(%rbp)       ## 4-byte Spill
	movq	-96(%rbp), %rdi
	incq	%rdi
	movq	%rdi, -96(%rbp)
	movq	%r14, %rsi
	callq	_strtof
	movl	-100(%rbp), %ecx        ## 4-byte Reload
	cmpl	$1048576, %ecx          ## imm = 0x100000
	jge	LBB20_58
## %bb.9:
	vmovss	-120(%rbp), %xmm5       ## 4-byte Reload
                                        ## xmm5 = mem[0],zero,zero,zero
	vmaxss	%xmm5, %xmm0, %xmm1
	vcmpunordss	%xmm5, %xmm5, %xmm2
	vblendvps	%xmm2, %xmm0, %xmm1, %xmm1
	vmovss	-160(%rbp), %xmm4       ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	vmaxss	%xmm4, %xmm1, %xmm2
	vcmpunordss	%xmm4, %xmm4, %xmm3
	vblendvps	%xmm3, %xmm1, %xmm2, %xmm1
	vmovaps	-192(%rbp), %xmm3       ## 16-byte Reload
	vmaxss	%xmm3, %xmm1, %xmm2
	vcmpunordss	%xmm3, %xmm3, %xmm3
	vblendvps	%xmm3, %xmm1, %xmm2, %xmm1
	vmovaps	%xmm1, -192(%rbp)       ## 16-byte Spill
	movslq	%ecx, %rax
	incl	%ecx
	movl	%ecx, -100(%rbp)        ## 4-byte Spill
	leaq	(%rax,%rax,2), %rax
	movq	-144(%rbp), %rcx        ## 8-byte Reload
	vmovss	%xmm4, (%rcx,%rax,4)
	vmovss	%xmm5, 4(%rcx,%rax,4)
	vmovss	%xmm0, 8(%rcx,%rax,4)
	jmp	LBB20_4
LBB20_10:
	movq	%r13, -160(%rbp)        ## 8-byte Spill
	addq	$3, %r12
	movq	%r12, -96(%rbp)
	movslq	-108(%rbp), %rax        ## 4-byte Folded Reload
	leaq	(%rax,%rax,2), %r13
	movq	-128(%rbp), %rbx        ## 8-byte Reload
	leaq	(%rbx,%r13,4), %rax
	movq	%rax, -120(%rbp)        ## 8-byte Spill
	movq	%r12, %rdi
	movq	%r14, %rsi
	callq	_strtof
	vmovss	%xmm0, (%rbx,%r13,4)
	movq	-96(%rbp), %rdi
	incq	%rdi
	movq	%rdi, -96(%rbp)
	movq	%r14, %rsi
	callq	_strtof
	vmovss	%xmm0, 4(%rbx,%r13,4)
	movq	-96(%rbp), %rdi
	incq	%rdi
	movq	%rdi, -96(%rbp)
	movq	%r14, %rsi
	callq	_strtof
	vmovss	%xmm0, 8(%rbx,%r13,4)
	vmovsd	(%rbx,%r13,4), %xmm1    ## xmm1 = mem[0],zero
	vmulss	%xmm1, %xmm1, %xmm3
	vmovshdup	%xmm1, %xmm2    ## xmm2 = xmm1[1,1,3,3]
	vmulss	%xmm2, %xmm2, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vmulss	%xmm0, %xmm0, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vsqrtss	%xmm3, %xmm3, %xmm3
	vmovss	LCPI20_1(%rip), %xmm4   ## xmm4 = mem[0],zero,zero,zero
	vucomiss	%xmm3, %xmm4
	jae	LBB20_14
## %bb.11:
	vmovss	LCPI20_2(%rip), %xmm4   ## xmm4 = mem[0],zero,zero,zero
	vdivss	%xmm3, %xmm4, %xmm3
	vmulss	%xmm3, %xmm1, %xmm1
	vmulss	%xmm3, %xmm2, %xmm2
	vinsertps	$16, %xmm2, %xmm1, %xmm1 ## xmm1 = xmm1[0],xmm2[0],xmm1[2,3]
	vmulss	%xmm3, %xmm0, %xmm0
	jmp	LBB20_15
LBB20_12:
	addq	$3, %r12
	movq	%r12, -96(%rbp)
	movq	%r12, %rdi
	movq	%r14, %rsi
	callq	_strtof
	vmovaps	%xmm0, -160(%rbp)       ## 16-byte Spill
	movq	-96(%rbp), %rdi
	incq	%rdi
	movq	%rdi, -96(%rbp)
	movq	%r14, %rsi
	callq	_strtof
	vmovaps	-160(%rbp), %xmm1       ## 16-byte Reload
	vinsertps	$16, %xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0],xmm1[2,3]
	movl	-104(%rbp), %ecx        ## 4-byte Reload
	movslq	%ecx, %rax
	incl	%ecx
	movl	%ecx, -104(%rbp)        ## 4-byte Spill
	movq	-136(%rbp), %rcx        ## 8-byte Reload
	vmovlps	%xmm0, (%rcx,%rax,8)
	jmp	LBB20_4
LBB20_14:
	vxorps	%xmm0, %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
LBB20_15:
	movq	-160(%rbp), %rax        ## 8-byte Reload
	incl	-108(%rbp)              ## 4-byte Folded Spill
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	vmovlps	%xmm1, (%rcx)
	vmovss	%xmm0, 8(%rcx)
	movl	%eax, %r9d
	movq	-96(%rbp), %r12
	movb	(%r12), %cl
	testb	%cl, %cl
	jne	LBB20_46
	jmp	LBB20_1
	.p2align	4, 0x90
LBB20_16:
	cmpb	$32, 1(%r12)
	jne	LBB20_4
## %bb.17:
	addq	$2, %r12
	movq	%r12, -96(%rbp)
	movq	$0, -56(%rbp)
	movl	$0, -64(%rbp)
	movq	$0, -72(%rbp)
	movl	$0, -80(%rbp)
	movq	$0, -88(%rbp)
	movq	%r12, %rdi
	movq	%r14, %rsi
	movl	$10, %edx
	callq	_strtol
	movl	%eax, -60(%rbp)
	movq	-96(%rbp), %rax
	cmpb	$47, (%rax)
	leaq	1(%rax), %rdi
	movq	%rdi, -96(%rbp)
	jne	LBB20_20
## %bb.18:
	leaq	-56(%rbp), %rbx
	.p2align	4, 0x90
LBB20_19:                               ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rsi
	movl	$10, %edx
	callq	_strtol
	movl	%eax, (%rbx)
	movq	-96(%rbp), %rax
	addq	$4, %rbx
	cmpb	$47, (%rax)
	leaq	1(%rax), %rdi
	movq	%rdi, -96(%rbp)
	je	LBB20_19
LBB20_20:
	movq	%r14, %rsi
	movl	$10, %edx
	callq	_strtol
	movl	%eax, -72(%rbp)
	movq	-96(%rbp), %rax
	cmpb	$47, (%rax)
	leaq	1(%rax), %rdi
	movq	%rdi, -96(%rbp)
	jne	LBB20_23
## %bb.21:
	leaq	-68(%rbp), %rbx
	.p2align	4, 0x90
LBB20_22:                               ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rsi
	movl	$10, %edx
	callq	_strtol
	movl	%eax, (%rbx)
	movq	-96(%rbp), %rax
	addq	$4, %rbx
	cmpb	$47, (%rax)
	leaq	1(%rax), %rdi
	movq	%rdi, -96(%rbp)
	je	LBB20_22
LBB20_23:
	movq	%r14, %rsi
	movl	$10, %edx
	callq	_strtol
	movl	%eax, -88(%rbp)
	movq	-96(%rbp), %rax
	leaq	1(%rax), %rdi
	cmpb	$47, (%rax)
	movq	%rdi, -96(%rbp)
	jne	LBB20_26
## %bb.24:
	leaq	-84(%rbp), %rbx
	.p2align	4, 0x90
LBB20_25:                               ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rsi
	movl	$10, %edx
	callq	_strtol
	movl	%eax, (%rbx)
	movq	-96(%rbp), %rax
	leaq	1(%rax), %rdi
	addq	$4, %rbx
	cmpb	$47, (%rax)
	movq	%rdi, -96(%rbp)
	je	LBB20_25
LBB20_26:
	movq	%rax, -96(%rbp)
	movq	%r13, %rax
	cmpl	$1048576, %eax          ## imm = 0x100000
	jge	LBB20_57
## %bb.27:
	leal	1(%rax), %r9d
	movq	-168(%rbp), %rax        ## 8-byte Reload
	movl	%r9d, 8(%rax)
	movslq	-60(%rbp), %rsi
	testq	%rsi, %rsi
	jle	LBB20_54
## %bb.28:
	movslq	-72(%rbp), %rdi
	testq	%rdi, %rdi
	jle	LBB20_54
## %bb.29:
	movslq	-88(%rbp), %rbx
	testq	%rbx, %rbx
	jle	LBB20_54
## %bb.30:
	movslq	%r13d, %rcx
	imulq	$168, %rcx, %rcx
	leaq	(%r15,%rcx), %r8
	leaq	(%rsi,%rsi,2), %rsi
	movq	-144(%rbp), %rax        ## 8-byte Reload
	movl	-4(%rax,%rsi,4), %edx
	movl	%edx, 8(%r8)
	movq	-12(%rax,%rsi,4), %rdx
	movq	%rdx, (%r8)
	leaq	(%rdi,%rdi,2), %rdx
	movl	-4(%rax,%rdx,4), %esi
	movl	%esi, 20(%r15,%rcx)
	movq	-12(%rax,%rdx,4), %rdx
	movq	%rdx, 12(%r15,%rcx)
	leaq	(%rbx,%rbx,2), %rdx
	movl	-4(%rax,%rdx,4), %esi
	movl	%esi, 32(%r15,%rcx)
	movq	-12(%rax,%rdx,4), %rdx
	movq	%rdx, 24(%r15,%rcx)
	movq	-200(%rbp), %rax        ## 8-byte Reload
	movq	%rax, 96(%r15,%rcx)
	movslq	-56(%rbp), %rsi
	testq	%rsi, %rsi
	je	LBB20_35
## %bb.31:
	testl	%esi, %esi
	jle	LBB20_55
## %bb.32:
	movslq	-68(%rbp), %rdi
	testq	%rdi, %rdi
	jle	LBB20_55
## %bb.33:
	movslq	-84(%rbp), %rbx
	testq	%rbx, %rbx
	jle	LBB20_55
## %bb.34:
	movq	-136(%rbp), %rax        ## 8-byte Reload
	movq	-8(%rax,%rsi,8), %rdx
	movq	%rdx, 72(%r15,%rcx)
	movq	-8(%rax,%rdi,8), %rdx
	movq	%rdx, 80(%r15,%rcx)
	movq	-8(%rax,%rbx,8), %rdx
	movq	%rdx, 88(%r15,%rcx)
LBB20_35:
	movslq	-52(%rbp), %rsi
	testq	%rsi, %rsi
	je	LBB20_41
## %bb.36:
	testl	%esi, %esi
	jle	LBB20_56
## %bb.37:
	movslq	-64(%rbp), %rdx
	testq	%rdx, %rdx
	jle	LBB20_56
## %bb.38:
	movslq	-80(%rbp), %rdi
	testq	%rdi, %rdi
	jle	LBB20_56
## %bb.39:
	leaq	(%rsi,%rsi,2), %rsi
	movq	-128(%rbp), %rax        ## 8-byte Reload
	movl	-4(%rax,%rsi,4), %ebx
	movl	%ebx, 44(%r15,%rcx)
	movq	-12(%rax,%rsi,4), %rsi
	movq	%rsi, 36(%r15,%rcx)
	leaq	(%rdx,%rdx,2), %rdx
	movl	-4(%rax,%rdx,4), %esi
	movl	%esi, 56(%r15,%rcx)
	movq	-12(%rax,%rdx,4), %rdx
	movq	%rdx, 48(%r15,%rcx)
	leaq	(%rdi,%rdi,2), %rdx
	movl	-4(%rax,%rdx,4), %esi
	movl	%esi, 68(%r15,%rcx)
	movq	-12(%rax,%rdx,4), %rdx
	movq	%rdx, 60(%r15,%rcx)
	movq	-96(%rbp), %r12
	movb	(%r12), %cl
	testb	%cl, %cl
	jne	LBB20_46
	jmp	LBB20_1
	.p2align	4, 0x90
LBB20_4:
	movl	%r13d, %r9d
	movq	-96(%rbp), %r12
	movb	(%r12), %cl
	testb	%cl, %cl
	je	LBB20_1
	.p2align	4, 0x90
LBB20_46:                               ## =>This Inner Loop Header: Depth=1
	incq	%r12
	cmpb	$10, %cl
	je	LBB20_47
## %bb.45:                              ##   in Loop: Header=BB20_46 Depth=1
	movq	%r12, -96(%rbp)
	movzbl	(%r12), %ecx
	testb	%cl, %cl
	jne	LBB20_46
LBB20_1:
	movl	%r9d, %r13d
	movb	(%r12), %al
	cmpb	$102, %al
	jne	LBB20_2
	jmp	LBB20_16
	.p2align	4, 0x90
LBB20_47:
	movq	%r12, -96(%rbp)
	movl	%r9d, %r13d
	movb	(%r12), %al
	cmpb	$102, %al
	jne	LBB20_2
	jmp	LBB20_16
LBB20_41:
	leaq	12(%r15,%rcx), %rdx
	vmovsd	(%rdx), %xmm0           ## xmm0 = mem[0],zero
	vmovss	8(%r15,%rcx), %xmm1     ## xmm1 = mem[0],zero,zero,zero
	vmovss	20(%r15,%rcx), %xmm2    ## xmm2 = mem[0],zero,zero,zero
	vmovsd	(%r8), %xmm3            ## xmm3 = mem[0],zero
	vsubps	%xmm3, %xmm0, %xmm4
	vsubss	%xmm1, %xmm2, %xmm2
	vmovsd	12(%rdx), %xmm0         ## xmm0 = mem[0],zero
	vsubss	%xmm3, %xmm0, %xmm5
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vinsertps	$16, 32(%r15,%rcx), %xmm0, %xmm0 ## xmm0 = xmm0[0],mem[0],xmm0[2,3]
	vmovshdup	%xmm3, %xmm3    ## xmm3 = xmm3[1,1,3,3]
	vinsertps	$16, %xmm1, %xmm3, %xmm1 ## xmm1 = xmm3[0],xmm1[0],xmm3[2,3]
	vsubps	%xmm1, %xmm0, %xmm1
	vmulss	%xmm5, %xmm2, %xmm0
	vmovshdup	%xmm1, %xmm3    ## xmm3 = xmm1[1,1,3,3]
	vmulss	%xmm3, %xmm4, %xmm3
	vsubss	%xmm3, %xmm0, %xmm0
	vmulps	%xmm1, %xmm4, %xmm3
	vmovshdup	%xmm4, %xmm4    ## xmm4 = xmm4[1,1,3,3]
	vinsertps	$16, %xmm2, %xmm4, %xmm2 ## xmm2 = xmm4[0],xmm2[0],xmm4[2,3]
	vinsertps	$28, %xmm1, %xmm5, %xmm1 ## xmm1 = xmm5[0],xmm1[0],zero,zero
	vmulps	%xmm1, %xmm2, %xmm1
	vsubps	%xmm1, %xmm3, %xmm1
	vmulss	%xmm0, %xmm0, %xmm2
	vmulps	%xmm1, %xmm1, %xmm3
	vmovshdup	%xmm3, %xmm4    ## xmm4 = xmm3[1,1,3,3]
	vaddss	%xmm2, %xmm4, %xmm2
	vaddss	%xmm2, %xmm3, %xmm2
	vsqrtss	%xmm2, %xmm2, %xmm2
	vmovss	LCPI20_1(%rip), %xmm3   ## xmm3 = mem[0],zero,zero,zero
	vucomiss	%xmm2, %xmm3
	jae	LBB20_43
## %bb.42:
	vmovss	LCPI20_2(%rip), %xmm3   ## xmm3 = mem[0],zero,zero,zero
	vdivss	%xmm2, %xmm3, %xmm3
	vmovshdup	%xmm1, %xmm2    ## xmm2 = xmm1[1,1,3,3]
	vmulss	%xmm3, %xmm2, %xmm2
	vmulss	%xmm3, %xmm0, %xmm0
	vinsertps	$16, %xmm0, %xmm2, %xmm2 ## xmm2 = xmm2[0],xmm0[0],xmm2[2,3]
	vmulss	%xmm3, %xmm1, %xmm0
	jmp	LBB20_44
LBB20_43:
	vxorps	%xmm0, %xmm0, %xmm0
	vxorps	%xmm2, %xmm2, %xmm2
LBB20_44:
	vmovlps	%xmm2, 60(%r15,%rcx)
	vmovss	%xmm0, 68(%r15,%rcx)
	movl	68(%r15,%rcx), %edx
	movl	%edx, 56(%r15,%rcx)
	movq	60(%r15,%rcx), %rsi
	movq	%rsi, 48(%r15,%rcx)
	movq	%rsi, 36(%r15,%rcx)
	movl	%edx, 44(%r15,%rcx)
	movq	-96(%rbp), %r12
	movb	(%r12), %cl
	testb	%cl, %cl
	jne	LBB20_46
	jmp	LBB20_1
	.p2align	4, 0x90
LBB20_2:
	cmpb	$118, %al
	je	LBB20_5
## %bb.3:
	testb	%al, %al
	jne	LBB20_4
## %bb.48:
	leaq	L_.str.14(%rip), %rdi
	movl	%r13d, %esi
	xorl	%eax, %eax
	callq	_printf
	testl	%r13d, %r13d
	jle	LBB20_51
## %bb.49:
	vmovss	LCPI20_2(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vdivss	-192(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	movl	%r13d, %eax
	vbroadcastss	%xmm0, %xmm1
	addq	$32, %r15
	.p2align	4, 0x90
LBB20_50:                               ## =>This Inner Loop Header: Depth=1
	vmovsd	-32(%r15), %xmm2        ## xmm2 = mem[0],zero
	vmovsd	-20(%r15), %xmm3        ## xmm3 = mem[0],zero
	vmulss	-24(%r15), %xmm0, %xmm4
	vmulps	%xmm2, %xmm1, %xmm2
	vmovlps	%xmm2, -32(%r15)
	vmovss	%xmm4, -24(%r15)
	vmulps	%xmm3, %xmm1, %xmm2
	vmulss	-12(%r15), %xmm0, %xmm3
	vmovlps	%xmm2, -20(%r15)
	vmovss	%xmm3, -12(%r15)
	vmovsd	-8(%r15), %xmm2         ## xmm2 = mem[0],zero
	vmulps	%xmm2, %xmm1, %xmm2
	vmulss	(%r15), %xmm0, %xmm3
	vmovlps	%xmm2, -8(%r15)
	vmovss	%xmm3, (%r15)
	addq	$168, %r15
	decq	%rax
	jne	LBB20_50
LBB20_51:
	movq	-144(%rbp), %rdi        ## 8-byte Reload
	callq	_free
	movq	-128(%rbp), %rdi        ## 8-byte Reload
	callq	_free
	movq	-136(%rbp), %rdi        ## 8-byte Reload
	callq	_free
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB20_53
## %bb.52:
	movq	-168(%rbp), %rax        ## 8-byte Reload
	addq	$168, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB20_53:
	callq	___stack_chk_fail
LBB20_54:
	leaq	L___func__._Z9load_meshPKcP7Texture(%rip), %rdi
	leaq	L_.str.8(%rip), %rsi
	leaq	L_.str.11(%rip), %rcx
	movl	$81, %edx
	callq	___assert_rtn
LBB20_55:
	leaq	L___func__._Z9load_meshPKcP7Texture(%rip), %rdi
	leaq	L_.str.8(%rip), %rsi
	leaq	L_.str.12(%rip), %rcx
	movl	$89, %edx
	callq	___assert_rtn
LBB20_56:
	leaq	L___func__._Z9load_meshPKcP7Texture(%rip), %rdi
	leaq	L_.str.8(%rip), %rsi
	leaq	L_.str.13(%rip), %rcx
	movl	$96, %edx
	callq	___assert_rtn
LBB20_57:
	leaq	L___func__._Z9load_meshPKcP7Texture(%rip), %rdi
	leaq	L_.str.8(%rip), %rsi
	leaq	L_.str.10(%rip), %rcx
	movl	$78, %edx
	callq	___assert_rtn
LBB20_58:
	leaq	L___func__._Z9load_meshPKcP7Texture(%rip), %rdi
	leaq	L_.str.8(%rip), %rsi
	leaq	L_.str.9(%rip), %rcx
	movl	$61, %edx
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.globl	_game_thread_work       ## -- Begin function game_thread_work
	.p2align	4, 0x90
_game_thread_work:                      ## @game_thread_work
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%rbx
	pushq	%rax
	.cfi_offset %rbx, -24
	movq	%rdi, %rbx
	movl	$1, %esi
	lock		xaddl	%esi, 6264(%rdi)
	incl	%esi
	leaq	L_.str.15(%rip), %rdi
	xorl	%eax, %eax
	callq	_printf
	cmpl	$0, 6248(%rbx)
	je	LBB21_2
	jmp	LBB21_5
	.p2align	4, 0x90
LBB21_4:                                ##   in Loop: Header=BB21_2 Depth=1
	movq	6256(%rbx), %rdi
	callq	__Z11render_tileP14Render_Contexti
	lock		incl	6272(%rbx)
	cmpl	$0, 6248(%rbx)
	jne	LBB21_5
LBB21_2:                                ## =>This Inner Loop Header: Depth=1
	movl	$1, %esi
	lock		xaddl	%esi, 6268(%rbx)
	cmpl	$256, %esi              ## imm = 0x100
	jl	LBB21_4
## %bb.3:                               ##   in Loop: Header=BB21_2 Depth=1
	movl	$100, %edi
	callq	_usleep
	cmpl	$0, 6248(%rbx)
	je	LBB21_2
LBB21_5:
	xorl	%eax, %eax
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	__Z14load_animationPKcP4MeshiP7Texture ## -- Begin function _Z14load_animationPKcP4MeshiP7Texture
	.p2align	4, 0x90
__Z14load_animationPKcP4MeshiP7Texture: ## @_Z14load_animationPKcP4MeshiP7Texture
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
	subq	$136, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rcx, -120(%rbp)        ## 8-byte Spill
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	testl	%edx, %edx
	jle	LBB22_3
## %bb.1:
	movq	%rsi, %rbx
	movq	%rdi, %r15
	movl	%edx, %r14d
	leaq	-112(%rbp), %r13
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB22_2:                                ## =>This Inner Loop Header: Depth=1
	cmpq	$8, %r12
	leaq	L_.str.16(%rip), %r8
	leaq	L_.str.18(%rip), %rax
	cmovaq	%rax, %r8
	cmpq	$98, %r12
	leaq	1(%r12), %r12
	leaq	L_.str.17(%rip), %rax
	cmovaq	%rax, %r8
	movl	$64, %esi
	movq	%r13, %rdi
	leaq	L_.str.19(%rip), %rdx
	movq	%r15, %rcx
	movl	%r12d, %r9d
	xorl	%eax, %eax
	vzeroupper
	callq	_snprintf
	leaq	-168(%rbp), %rdi
	movq	%r13, %rsi
	movq	-120(%rbp), %rdx        ## 8-byte Reload
	callq	__Z9load_meshPKcP7Texture
	vmovups	-168(%rbp), %ymm0
	vmovups	-152(%rbp), %ymm1
	vmovups	%ymm1, 16(%rbx)
	vmovups	%ymm0, (%rbx)
	addq	$48, %rbx
	cmpq	%r12, %r14
	jne	LBB22_2
LBB22_3:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB22_5
## %bb.4:
	addq	$136, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
LBB22_5:
	vzeroupper
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function game_update_and_render
LCPI23_0:
	.long	1101004800              ## float 20
LCPI23_1:
	.long	805306368               ## float 4.65661287E-10
LCPI23_2:
	.long	1028443341              ## float 0.0500000007
LCPI23_3:
	.long	1148846080              ## float 1000
LCPI23_4:
	.long	1114636288              ## float 60
LCPI23_5:
	.long	1015580809              ## float 0.0166666675
LCPI23_6:
	.long	2147483648              ## float -0
LCPI23_7:
	.long	2244797952              ## 0x85cce600
LCPI23_9:
	.long	1077936128              ## float 3
LCPI23_12:
	.long	1058642330              ## float 0.600000024
LCPI23_16:
	.long	1036831949              ## float 0.100000001
LCPI23_17:
	.long	1065353216              ## float 1
LCPI23_18:
	.long	3212836864              ## float -1
	.section	__TEXT,__const
	.p2align	5
LCPI23_8:
	.long	0                       ## 0x0
	.long	3                       ## 0x3
	.long	6                       ## 0x6
	.long	1                       ## 0x1
	.long	4                       ## 0x4
	.long	7                       ## 0x7
	.long	2                       ## 0x2
	.long	5                       ## 0x5
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI23_10:
	.long	3296329728              ## float -1000
	.long	3212836864              ## float -1
	.space	4
	.space	4
LCPI23_11:
	.long	1148846080              ## float 1000
	.long	3212836864              ## float -1
	.space	4
	.space	4
LCPI23_13:
	.long	2147483648              ## float -0
	.long	1065353216              ## float 1
	.space	4
	.space	4
LCPI23_14:
	.long	0                       ## float 0
	.long	1148846080              ## float 1000
	.space	4
	.space	4
LCPI23_21:
	.space	16
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI23_15:
	.quad	4575657221408423936     ## 0x3f80000000000000
LCPI23_19:
	.quad	4652007308841189376     ## double 1000
LCPI23_20:
	.quad	4696837146684686336     ## double 1.0E+6
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_game_update_and_render
	.p2align	4, 0x90
_game_update_and_render:                ## @game_update_and_render
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	pushq	%r15
	pushq	%r14
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$4000, %rsp             ## imm = 0xFA0
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r14
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 3976(%rsp)
	cmpl	$0, 188(%rdi)
	jne	LBB23_5
## %bb.1:
	leaq	L_.str.20(%rip), %rsi
	leaq	288(%rsp), %rdi
	callq	__Z12load_texturePKc
	leaq	272(%r14), %r15
	movq	304(%rsp), %rax
	movq	%rax, 288(%r14)
	vmovups	288(%rsp), %xmm0
	vmovups	%xmm0, 272(%r14)
	leaq	L_.str.21(%rip), %rsi
	leaq	288(%rsp), %rdi
	callq	__Z12load_texturePKc
	movq	304(%rsp), %rax
	movq	%rax, 240(%r14)
	vmovups	288(%rsp), %xmm0
	vmovups	%xmm0, 224(%r14)
	leaq	L_.str.22(%rip), %rsi
	leaq	288(%rsp), %rdi
	callq	__Z12load_texturePKc
	movq	304(%rsp), %rax
	movq	%rax, 264(%r14)
	vmovups	288(%rsp), %xmm0
	vmovups	%xmm0, 248(%r14)
	leaq	L_.str.23(%rip), %rsi
	leaq	288(%rsp), %rdi
	callq	__Z12load_texturePKc
	movq	304(%rsp), %rax
	movq	%rax, 336(%r14)
	vmovups	288(%rsp), %xmm0
	vmovups	%xmm0, 320(%r14)
	leaq	L_.str.24(%rip), %rsi
	leaq	288(%rsp), %rdi
	callq	__Z12load_texturePKc
	leaq	344(%r14), %rbx
	movq	304(%rsp), %rax
	movq	%rax, 360(%r14)
	vmovups	288(%rsp), %xmm0
	vmovups	%xmm0, 344(%r14)
	leaq	296(%r14), %r12
	movl	$2, 304(%r14)
	movabsq	$8589934594, %rax       ## imm = 0x200000002
	movq	%rax, 296(%r14)
	movl	$4, %edi
	movl	$4, %esi
	callq	_calloc
	movq	%rax, 312(%r14)
	movl	$-1, 12(%rax)
	movl	$-1, (%rax)
	leaq	L_.str.25(%rip), %rsi
	leaq	288(%rsp), %rdi
	movq	%r15, %rdx
	callq	__Z9load_meshPKcP7Texture
	vmovups	288(%rsp), %ymm0
	vmovups	304(%rsp), %ymm1
	vmovups	%ymm1, 480(%r14)
	vmovups	%ymm0, 464(%r14)
	leaq	L_.str.26(%rip), %rsi
	leaq	288(%rsp), %rdi
	movq	%rbx, %rdx
	vzeroupper
	callq	__Z9load_meshPKcP7Texture
	vmovups	288(%rsp), %ymm0
	vmovups	304(%rsp), %ymm1
	vmovups	%ymm1, 528(%r14)
	vmovups	%ymm0, 512(%r14)
	leaq	L_.str.27(%rip), %rsi
	leaq	288(%rsp), %rdi
	movq	%r12, %rdx
	vzeroupper
	callq	__Z9load_meshPKcP7Texture
	vmovups	288(%rsp), %ymm0
	vmovups	304(%rsp), %ymm1
	vmovups	%ymm1, 384(%r14)
	vmovups	%ymm0, 368(%r14)
	cmpl	$0, 376(%r14)
	jle	LBB23_4
## %bb.2:
	xorl	%eax, %eax
	vbroadcastss	LCPI23_0(%rip), %xmm0 ## xmm0 = [2.0E+1,2.0E+1,2.0E+1,2.0E+1]
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB23_3:                                ## =>This Inner Loop Header: Depth=1
	movq	368(%r14), %rdx
	vmovsd	72(%rdx,%rax), %xmm1    ## xmm1 = mem[0],zero
	vmulps	%xmm0, %xmm1, %xmm1
	vmovlps	%xmm1, 72(%rdx,%rax)
	movq	368(%r14), %rdx
	vmovsd	80(%rdx,%rax), %xmm1    ## xmm1 = mem[0],zero
	vmulps	%xmm0, %xmm1, %xmm1
	vmovlps	%xmm1, 80(%rdx,%rax)
	movq	368(%r14), %rdx
	vmovsd	88(%rdx,%rax), %xmm1    ## xmm1 = mem[0],zero
	vmulps	%xmm0, %xmm1, %xmm1
	vmovlps	%xmm1, 88(%rdx,%rax)
	incq	%rcx
	movslq	376(%r14), %rdx
	addq	$168, %rax
	cmpq	%rdx, %rcx
	jl	LBB23_3
LBB23_4:
	leaq	L_.str.28(%rip), %rsi
	leaq	288(%rsp), %rdi
	xorl	%edx, %edx
	vzeroupper
	callq	__Z9load_meshPKcP7Texture
	vmovups	288(%rsp), %ymm0
	vmovups	304(%rsp), %ymm1
	vmovups	%ymm1, 432(%r14)
	vmovups	%ymm0, 416(%r14)
	leaq	L_.str.29(%rip), %rsi
	leaq	288(%rsp), %rdi
	vzeroupper
	callq	__Z12load_texturePKc
	leaq	656(%r14), %rdx
	movq	304(%rsp), %rax
	movq	%rax, 672(%r14)
	vmovups	288(%rsp), %xmm0
	vmovups	%xmm0, 656(%r14)
	leaq	L_.str.30(%rip), %rsi
	leaq	288(%rsp), %rdi
	callq	__Z9load_meshPKcP7Texture
	vmovups	288(%rsp), %ymm0
	vmovups	304(%rsp), %ymm1
	vmovups	%ymm1, 576(%r14)
	vmovups	%ymm0, 560(%r14)
	movq	$0, 44(%r14)
	movl	$0, 52(%r14)
	xorl	%edi, %edi
	vzeroupper
	callq	_time
	movl	%eax, %edi
	callq	_srand
	callq	_rand
	vcvtsi2ssl	%eax, %xmm2, %xmm0
	vmulss	LCPI23_1(%rip), %xmm0, %xmm0
	vmovss	%xmm0, 192(%r14)
	movl	$3680, %edi             ## imm = 0xE60
	callq	_malloc
	movq	%rax, 6256(%r14)
	subq	$32, %rsp
	movq	16(%r14), %rax
	movq	%rax, 16(%rsp)
	vmovups	(%r14), %xmm0
	vmovups	%xmm0, (%rsp)
	leaq	320(%rsp), %rbx
	vmovss	LCPI23_2(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vmovss	LCPI23_3(%rip), %xmm1   ## xmm1 = mem[0],zero,zero,zero
	vmovss	LCPI23_4(%rip), %xmm2   ## xmm2 = mem[0],zero,zero,zero
	movq	%rbx, %rdi
	movq	%r14, %rsi
	movl	$100000, %edx           ## imm = 0x186A0
	callq	__Z18new_render_contextP4Game7Texturefffi
	addq	$32, %rsp
	movq	6256(%r14), %rdi
	movl	$3680, %edx             ## imm = 0xE60
	movq	%rbx, %rsi
	callq	_memcpy
	movl	$1, 188(%r14)
LBB23_5:
	leaq	176(%rsp), %rsi
	movl	$6, %edi
	callq	_clock_gettime
	vmovsd	104(%r14), %xmm0        ## xmm0 = mem[0],zero
	vmovss	LCPI23_5(%rip), %xmm1   ## xmm1 = mem[0],zero,zero,zero
	vbroadcastss	%xmm1, %xmm2
	vmulss	112(%r14), %xmm1, %xmm1
	vmulps	%xmm2, %xmm0, %xmm0
	vmovsd	44(%r14), %xmm2         ## xmm2 = mem[0],zero
	vaddss	52(%r14), %xmm1, %xmm1
	vaddps	%xmm2, %xmm0, %xmm0
	vmovaps	%xmm0, 272(%rsp)        ## 16-byte Spill
	vmovlps	%xmm0, 44(%r14)
	vmovss	%xmm1, 52(%r14)
	vmovss	56(%r14), %xmm0         ## xmm0 = mem[0],zero,zero,zero
	callq	___sincosf_stret
	vmovaps	%xmm0, 112(%rsp)        ## 16-byte Spill
	vmovshdup	%xmm0, %xmm1    ## xmm1 = xmm0[1,1,3,3]
	vmovaps	%xmm1, 256(%rsp)        ## 16-byte Spill
	vinsertps	$55, %xmm0, %xmm0, %xmm1 ## xmm1 = zero,zero,zero,xmm0[0]
	vmovaps	%ymm1, 192(%rsp)        ## 32-byte Spill
	vmovss	LCPI23_6(%rip), %xmm1   ## xmm1 = mem[0],zero,zero,zero
	vbroadcastss	%xmm1, %xmm1
	vxorps	%xmm1, %xmm0, %xmm0
	vmovaps	%xmm0, 128(%rsp)        ## 16-byte Spill
	vmovss	60(%r14), %xmm0         ## xmm0 = mem[0],zero,zero,zero
	vzeroupper
	callq	___sincosf_stret
	vmovaps	%xmm0, 32(%rsp)         ## 16-byte Spill
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vmovaps	%xmm0, 64(%rsp)         ## 16-byte Spill
	vmovss	64(%r14), %xmm0         ## xmm0 = mem[0],zero,zero,zero
	callq	___sincosf_stret
	vmovaps	%xmm0, %xmm10
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vmovaps	64(%rsp), %xmm15        ## 16-byte Reload
	vmulss	%xmm0, %xmm15, %xmm3
	vmovaps	%xmm0, %xmm7
	vxorps	%xmm1, %xmm1, %xmm1
	vaddss	%xmm1, %xmm3, %xmm3
	vmovss	LCPI23_6(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vmulss	%xmm0, %xmm10, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vmovaps	32(%rsp), %xmm2         ## 16-byte Reload
	vmulss	%xmm0, %xmm2, %xmm5
	vaddss	%xmm3, %xmm5, %xmm6
	vmovss	%xmm6, 52(%rsp)         ## 4-byte Spill
	vmulss	%xmm10, %xmm15, %xmm3
	vaddss	%xmm1, %xmm3, %xmm3
	vmulss	%xmm1, %xmm7, %xmm12
	vaddss	%xmm3, %xmm12, %xmm3
	vaddss	%xmm3, %xmm5, %xmm11
	vmulss	%xmm7, %xmm2, %xmm3
	vmovaps	%xmm7, 240(%rsp)        ## 16-byte Spill
	vaddss	%xmm1, %xmm3, %xmm3
	vaddss	%xmm3, %xmm4, %xmm2
	vmovss	%xmm2, 56(%rsp)         ## 4-byte Spill
	vaddss	%xmm1, %xmm6, %xmm3
	vaddss	%xmm1, %xmm11, %xmm4
	vinsertps	$16, %xmm4, %xmm3, %xmm2 ## xmm2 = xmm3[0],xmm4[0],xmm3[2,3]
	vaddss	%xmm1, %xmm12, %xmm3
	vmovss	%xmm12, 60(%rsp)        ## 4-byte Spill
	vsubss	%xmm10, %xmm3, %xmm3
	vaddss	%xmm1, %xmm3, %xmm3
	vmulss	%xmm1, %xmm10, %xmm0
	vmovss	%xmm0, 28(%rsp)         ## 4-byte Spill
	vaddss	%xmm1, %xmm0, %xmm4
	vaddss	%xmm4, %xmm7, %xmm4
	vaddss	%xmm1, %xmm4, %xmm4
	vmulss	%xmm1, %xmm3, %xmm5
	vmulss	%xmm1, %xmm4, %xmm6
	vunpcklps	%xmm6, %xmm5, %xmm0 ## xmm0 = xmm5[0],xmm6[0],xmm5[1],xmm6[1]
	vmovaps	256(%rsp), %xmm9        ## 16-byte Reload
	vmulss	%xmm4, %xmm9, %xmm5
	vmovaps	128(%rsp), %xmm7        ## 16-byte Reload
	vmulss	%xmm7, %xmm4, %xmm6
	vmulss	%xmm7, %xmm3, %xmm7
	vmulss	%xmm1, %xmm9, %xmm14
	vinsertps	$16, %xmm14, %xmm5, %xmm5 ## xmm5 = xmm5[0],xmm14[0],xmm5[2,3]
	vinsertps	$32, %xmm7, %xmm5, %xmm5 ## xmm5 = xmm5[0,1],xmm7[0],xmm5[3]
	vinsertps	$48, %xmm6, %xmm5, %xmm6 ## xmm6 = xmm5[0,1,2],xmm6[0]
	vmulss	%xmm3, %xmm9, %xmm7
	vmulss	%xmm1, %xmm15, %xmm8
	vaddss	%xmm1, %xmm8, %xmm13
	vmovaps	32(%rsp), %xmm3         ## 16-byte Reload
	vsubss	%xmm3, %xmm13, %xmm5
	vinsertps	$32, %xmm5, %xmm2, %xmm2 ## xmm2 = xmm2[0,1],xmm5[0],xmm2[3]
	vinsertps	$48, %xmm7, %xmm2, %xmm2 ## xmm2 = xmm2[0,1,2],xmm7[0]
	vinsertf128	$1, %xmm6, %ymm2, %ymm4
	vmulss	52(%rsp), %xmm1, %xmm6  ## 4-byte Folded Reload
	vaddss	%xmm1, %xmm6, %xmm6
	vmulss	%xmm1, %xmm11, %xmm7
	vaddss	%xmm1, %xmm7, %xmm7
	vmulss	%xmm1, %xmm5, %xmm5
	vaddss	%xmm1, %xmm5, %xmm5
	vinsertps	$52, %xmm6, %xmm0, %xmm11 ## xmm11 = xmm0[0,1],zero,xmm6[0]
	vinsertps	$16, %xmm5, %xmm7, %xmm2 ## xmm2 = xmm7[0],xmm5[0],xmm7[2,3]
	vinsertps	$32, %xmm6, %xmm2, %xmm2 ## xmm2 = xmm2[0,1],xmm6[0],xmm2[3]
	vinsertps	$48, %xmm7, %xmm2, %xmm2 ## xmm2 = xmm2[0,1,2],xmm7[0]
	vinsertf128	$1, %xmm2, %ymm11, %ymm2
	vaddps	%ymm2, %ymm4, %ymm0
	vmovaps	%ymm0, 128(%rsp)        ## 32-byte Spill
	vmovaps	112(%rsp), %xmm0        ## 16-byte Reload
	vpermilps	$80, %xmm0, %xmm6 ## xmm6 = xmm0[0,0,1,1]
	vmovaps	192(%rsp), %ymm2        ## 32-byte Reload
	vinsertf128	$1, %xmm6, %ymm2, %ymm11
	vaddss	56(%rsp), %xmm8, %xmm7  ## 4-byte Folded Reload
	vmulss	%xmm10, %xmm3, %xmm2
	vaddss	%xmm1, %xmm2, %xmm2
	vaddss	%xmm2, %xmm12, %xmm2
	vaddss	%xmm2, %xmm8, %xmm2
	vmulss	%xmm1, %xmm3, %xmm12
	vaddss	%xmm1, %xmm12, %xmm6
	vaddss	%xmm6, %xmm15, %xmm6
	vinsertps	$16, %xmm6, %xmm2, %xmm4 ## xmm4 = xmm2[0],xmm6[0],xmm2[2,3]
	vinsertps	$32, %xmm7, %xmm4, %xmm4 ## xmm4 = xmm4[0,1],xmm7[0],xmm4[3]
	vinsertps	$48, %xmm2, %xmm4, %xmm4 ## xmm4 = xmm4[0,1,2],xmm2[0]
	vinsertps	$16, %xmm2, %xmm7, %xmm2 ## xmm2 = xmm7[0],xmm2[0],xmm7[2,3]
	vinsertps	$32, %xmm6, %xmm2, %xmm2 ## xmm2 = xmm2[0,1],xmm6[0],xmm2[3]
	vinsertps	$48, %xmm7, %xmm2, %xmm2 ## xmm2 = xmm2[0,1,2],xmm7[0]
	vinsertf128	$1, %xmm4, %ymm2, %ymm2
	vmulps	%ymm2, %ymm11, %ymm2
	vaddps	128(%rsp), %ymm2, %ymm2 ## 32-byte Folded Reload
	vmulss	%xmm1, %xmm0, %xmm4
	vsubss	%xmm4, %xmm5, %xmm5
	vmulss	%xmm6, %xmm9, %xmm6
	vaddss	%xmm5, %xmm6, %xmm5
	vmovups	%ymm2, 116(%r14)
	vmovss	%xmm5, 148(%r14)
	vaddss	%xmm13, %xmm14, %xmm2
	vmovaps	%xmm0, %xmm6
	vmulss	%xmm3, %xmm0, %xmm5
	vaddss	%xmm2, %xmm5, %xmm15
	vmovss	LCPI23_6(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vmulss	%xmm0, %xmm6, %xmm11
	vmovaps	%xmm6, %xmm0
	vaddss	%xmm13, %xmm11, %xmm5
	vmulss	%xmm3, %xmm9, %xmm6
	vaddss	%xmm5, %xmm6, %xmm2
	vmovss	%xmm2, 128(%rsp)        ## 4-byte Spill
	vaddss	%xmm1, %xmm9, %xmm5
	vaddss	%xmm4, %xmm5, %xmm13
	vsubss	%xmm3, %xmm1, %xmm4
	vaddss	%xmm8, %xmm4, %xmm5
	vmovaps	64(%rsp), %xmm2         ## 16-byte Reload
	vaddss	%xmm1, %xmm2, %xmm3
	vaddss	%xmm12, %xmm3, %xmm8
	vsubss	%xmm0, %xmm1, %xmm6
	vaddss	%xmm14, %xmm6, %xmm7
	vsubss	%xmm12, %xmm1, %xmm3
	vaddss	%xmm3, %xmm14, %xmm12
	vmulss	%xmm2, %xmm0, %xmm4
	vmovaps	%xmm2, %xmm0
	vaddss	%xmm12, %xmm4, %xmm2
	vmovss	%xmm2, 112(%rsp)        ## 4-byte Spill
	vaddss	%xmm3, %xmm11, %xmm2
	vmulss	%xmm0, %xmm9, %xmm4
	vaddss	%xmm2, %xmm4, %xmm0
	vmovss	%xmm0, 192(%rsp)        ## 4-byte Spill
	vmovaps	240(%rsp), %xmm6        ## 16-byte Reload
	vmulss	%xmm8, %xmm6, %xmm2
	vaddss	%xmm1, %xmm2, %xmm2
	vsubss	28(%rsp), %xmm2, %xmm11 ## 4-byte Folded Reload
	vmovaps	%xmm15, %xmm9
	vmulss	%xmm15, %xmm6, %xmm4
	vaddss	%xmm1, %xmm4, %xmm4
	vmulss	%xmm10, %xmm13, %xmm2
	vsubss	%xmm2, %xmm4, %xmm14
	vmovss	128(%rsp), %xmm3        ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	vmulss	%xmm3, %xmm6, %xmm4
	vaddss	%xmm1, %xmm4, %xmm4
	vmulss	%xmm10, %xmm7, %xmm2
	vsubss	%xmm2, %xmm4, %xmm12
	vmulss	%xmm8, %xmm10, %xmm4
	vaddss	%xmm1, %xmm4, %xmm4
	vaddss	60(%rsp), %xmm4, %xmm0  ## 4-byte Folded Reload
	vmulss	%xmm1, %xmm5, %xmm4
	vaddss	%xmm11, %xmm4, %xmm15
	vaddss	%xmm0, %xmm4, %xmm0
	vmovss	%xmm0, 28(%rsp)         ## 4-byte Spill
	vmulss	%xmm9, %xmm10, %xmm4
	vmovaps	%xmm9, %xmm11
	vaddss	%xmm1, %xmm4, %xmm4
	vmulss	%xmm13, %xmm6, %xmm2
	vaddss	%xmm4, %xmm2, %xmm2
	vmovss	112(%rsp), %xmm9        ## 4-byte Reload
                                        ## xmm9 = mem[0],zero,zero,zero
	vmulss	%xmm1, %xmm9, %xmm4
	vaddss	%xmm14, %xmm4, %xmm14
	vaddss	%xmm2, %xmm4, %xmm0
	vmovss	%xmm0, 32(%rsp)         ## 4-byte Spill
	vmulss	%xmm3, %xmm10, %xmm0
	vmovaps	%xmm3, %xmm10
	vaddss	%xmm1, %xmm0, %xmm0
	vmulss	%xmm7, %xmm6, %xmm2
	vaddss	%xmm0, %xmm2, %xmm3
	vmovss	192(%rsp), %xmm2        ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	vmulss	%xmm1, %xmm2, %xmm4
	vaddss	%xmm12, %xmm4, %xmm0
	vaddss	%xmm3, %xmm4, %xmm12
	vmulss	%xmm1, %xmm8, %xmm3
	vaddss	%xmm1, %xmm3, %xmm3
	vaddss	%xmm3, %xmm5, %xmm8
	vmulss	%xmm1, %xmm11, %xmm3
	vaddss	%xmm1, %xmm3, %xmm3
	vmulss	%xmm1, %xmm13, %xmm5
	vaddss	%xmm3, %xmm5, %xmm3
	vaddss	%xmm3, %xmm9, %xmm9
	vmulss	%xmm1, %xmm10, %xmm3
	vaddss	%xmm1, %xmm3, %xmm3
	vmulss	%xmm1, %xmm7, %xmm6
	vaddss	%xmm3, %xmm6, %xmm3
	vaddss	%xmm3, %xmm2, %xmm11
	vmovss	%xmm15, 152(%r14)
	vmovss	%xmm14, 64(%rsp)        ## 4-byte Spill
	vmovss	%xmm14, 156(%r14)
	vmovss	%xmm0, 160(%r14)
	vmovss	28(%rsp), %xmm6         ## 4-byte Reload
                                        ## xmm6 = mem[0],zero,zero,zero
	vmovss	%xmm6, 164(%r14)
	vmovss	32(%rsp), %xmm2         ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	vmovss	%xmm2, 168(%r14)
	vmovss	%xmm12, 172(%r14)
	vmovss	%xmm8, 176(%r14)
	vmovss	%xmm9, 180(%r14)
	vmovss	%xmm11, 184(%r14)
	vmulss	%xmm1, %xmm15, %xmm3
	vaddss	%xmm1, %xmm3, %xmm10
	vmulss	%xmm1, %xmm14, %xmm7
	vaddss	%xmm7, %xmm10, %xmm5
	vsubss	%xmm0, %xmm5, %xmm5
	vmulss	%xmm1, %xmm6, %xmm3
	vaddss	%xmm1, %xmm3, %xmm13
	vmulss	%xmm1, %xmm2, %xmm2
	vaddss	%xmm2, %xmm13, %xmm3
	vsubss	%xmm12, %xmm3, %xmm3
	vinsertps	$16, %xmm3, %xmm5, %xmm3 ## xmm3 = xmm5[0],xmm3[0],xmm5[2,3]
	vmulss	%xmm1, %xmm8, %xmm5
	vaddss	%xmm1, %xmm5, %xmm5
	vmovlps	%xmm3, 92(%r14)
	vmulss	%xmm1, %xmm9, %xmm3
	vaddss	%xmm3, %xmm5, %xmm14
	vsubss	%xmm11, %xmm14, %xmm4
	vmovss	%xmm4, 100(%r14)
	vaddss	%xmm1, %xmm15, %xmm4
	vaddss	%xmm7, %xmm4, %xmm4
	vaddss	%xmm1, %xmm6, %xmm7
	vaddss	%xmm2, %xmm7, %xmm2
	vmulss	%xmm1, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm4
	vmulss	%xmm1, %xmm12, %xmm7
	vaddss	%xmm2, %xmm7, %xmm2
	vinsertps	$16, %xmm2, %xmm4, %xmm2 ## xmm2 = xmm4[0],xmm2[0],xmm4[2,3]
	vaddss	%xmm1, %xmm8, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vmulss	%xmm1, %xmm11, %xmm1
	vmovlps	%xmm2, 68(%r14)
	vaddss	%xmm3, %xmm1, %xmm2
	vmovss	%xmm2, 76(%r14)
	vaddss	64(%rsp), %xmm10, %xmm2 ## 4-byte Folded Reload
	vaddss	%xmm0, %xmm2, %xmm0
	vaddss	32(%rsp), %xmm13, %xmm2 ## 4-byte Folded Reload
	vaddss	%xmm7, %xmm2, %xmm2
	vinsertps	$16, %xmm2, %xmm0, %xmm0 ## xmm0 = xmm0[0],xmm2[0],xmm0[2,3]
	vaddss	%xmm9, %xmm5, %xmm2
	vaddss	%xmm1, %xmm2, %xmm1
	vmovlps	%xmm0, 80(%r14)
	vmovss	%xmm1, 88(%r14)
	movq	6256(%r14), %rbx
	movl	52(%r14), %r15d
	movl	184(%r14), %eax
	movl	%eax, 320(%rsp)
	vmovups	152(%r14), %ymm0
	vmovaps	%ymm0, 288(%rsp)
	movl	28(%rbx), %eax
	imull	24(%rbx), %eax
	testl	%eax, %eax
	jle	LBB23_8
## %bb.6:
	vbroadcastss	60(%rbx), %ymm0
	xorl	%eax, %eax
	vbroadcastss	LCPI23_7(%rip), %ymm1 ## ymm1 = [2244797952,2244797952,2244797952,2244797952,2244797952,2244797952,2244797952,2244797952]
	.p2align	4, 0x90
LBB23_7:                                ## =>This Inner Loop Header: Depth=1
	movq	48(%rbx), %rcx
	vmovups	%ymm0, (%rcx,%rax,4)
	movq	40(%rbx), %rcx
	vmovups	%ymm1, (%rcx,%rax,4)
	addq	$8, %rax
	movslq	24(%rbx), %rcx
	movslq	28(%rbx), %rdx
	imulq	%rcx, %rdx
	cmpq	%rdx, %rax
	jl	LBB23_7
LBB23_8:
	movl	$0, 192(%rbx)
	leaq	2248(%rbx), %rdi
	movl	$1024, %esi             ## imm = 0x400
	vzeroupper
	callq	___bzero
	vmovaps	272(%rsp), %xmm0        ## 16-byte Reload
	vmovlps	%xmm0, 64(%rbx)
	movl	%r15d, 72(%rbx)
	vmovaps	288(%rsp), %ymm0
	vmovups	%ymm0, 76(%rbx)
	movl	320(%rsp), %eax
	movl	%eax, 108(%rbx)
	vmovaps	LCPI23_8(%rip), %ymm0   ## ymm0 = [0,3,6,1,4,7,2,5]
	vpermps	76(%rbx), %ymm0, %ymm0
	vmovups	%ymm0, 112(%rbx)
	movl	%eax, 144(%rbx)
	vbroadcastss	LCPI23_9(%rip), %xmm0 ## xmm0 = [3.0E+0,3.0E+0,3.0E+0,3.0E+0]
	vmovlps	%xmm0, 3552(%rbx)
	movl	$-1082130432, 3560(%rbx) ## imm = 0xBF800000
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%ymm0, 288(%rsp)
	vmovaps	%ymm0, 320(%rsp)
	vmovaps	%ymm0, 352(%rsp)
	vmovaps	%ymm0, 384(%rsp)
	vmovaps	%ymm0, 416(%rsp)
	movq	$0, 448(%rsp)
	vmovsd	LCPI23_10(%rip), %xmm0  ## xmm0 = mem[0],zero
	vmovsd	%xmm0, 288(%rsp)
	movl	$1148846080, 296(%rsp)  ## imm = 0x447A0000
	vmovsd	LCPI23_11(%rip), %xmm0  ## xmm0 = mem[0],zero
	vmovsd	%xmm0, 300(%rsp)
	movl	$1148846080, 308(%rsp)  ## imm = 0x447A0000
	vmovsd	%xmm0, 312(%rsp)
	movl	$-998637568, 320(%rsp)  ## imm = 0xC47A0000
	vmovss	LCPI23_3(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vxorps	%xmm1, %xmm1, %xmm1
	vmovlhps	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovups	%xmm0, 360(%rsp)
	vbroadcastss	LCPI23_3(%rip), %xmm0 ## xmm0 = [1.0E+3,1.0E+3,1.0E+3,1.0E+3]
	vmovaps	%xmm0, 64(%rsp)         ## 16-byte Spill
	vmovlps	%xmm0, 376(%rsp)
	vbroadcastss	LCPI23_12(%rip), %xmm0 ## xmm0 = [6.00000024E-1,6.00000024E-1,6.00000024E-1,6.00000024E-1]
	vmovaps	%xmm0, 32(%rsp)         ## 16-byte Spill
	vmovlps	%xmm0, 392(%rsp)
	movl	$1058642330, 400(%rsp)  ## imm = 0x3F19999A
	vmovsd	LCPI23_13(%rip), %xmm0  ## xmm0 = mem[0],zero
	vmovsd	%xmm0, 348(%rsp)
	movl	$0, 356(%rsp)
	movl	356(%rsp), %eax
	movl	%eax, 344(%rsp)
	movq	348(%rsp), %rcx
	movq	%rcx, 336(%rsp)
	movl	%eax, 332(%rsp)
	movq	%rcx, 324(%rsp)
	leaq	296(%r14), %r15
	movq	%r15, 384(%rsp)
	leaq	288(%rsp), %rsi
	movq	%rbx, %rdi
	vzeroupper
	callq	__Z13push_triangleP14Render_ContextP8Triangle
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%ymm0, 288(%rsp)
	vmovaps	%ymm0, 320(%rsp)
	vmovaps	%ymm0, 352(%rsp)
	vmovaps	%ymm0, 384(%rsp)
	vmovaps	%ymm0, 416(%rsp)
	movq	$0, 448(%rsp)
	vmovsd	LCPI23_10(%rip), %xmm0  ## xmm0 = mem[0],zero
	vmovsd	%xmm0, 288(%rsp)
	movl	$1148846080, 296(%rsp)  ## imm = 0x447A0000
	vmovsd	LCPI23_11(%rip), %xmm1  ## xmm1 = mem[0],zero
	vmovsd	%xmm1, 300(%rsp)
	movl	$-998637568, 308(%rsp)  ## imm = 0xC47A0000
	vmovsd	%xmm0, 312(%rsp)
	movl	$-998637568, 320(%rsp)  ## imm = 0xC47A0000
	vxorps	%xmm0, %xmm0, %xmm0
	vunpcklpd	64(%rsp), %xmm0, %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = xmm0[0],mem[0]
	vmovups	%xmm0, 360(%rsp)
	vmovsd	LCPI23_14(%rip), %xmm0  ## xmm0 = mem[0],zero
	vmovsd	%xmm0, 376(%rsp)
	vmovaps	32(%rsp), %xmm0         ## 16-byte Reload
	vmovlps	%xmm0, 392(%rsp)
	movl	$1058642330, 400(%rsp)  ## imm = 0x3F19999A
	vpbroadcastq	LCPI23_15(%rip), %xmm0 ## xmm0 = [4575657221408423936,4575657221408423936]
	vmovdqa	%xmm0, 32(%rsp)         ## 16-byte Spill
	vmovq	%xmm0, 348(%rsp)
	movl	$0, 356(%rsp)
	movl	356(%rsp), %eax
	movl	%eax, 344(%rsp)
	movq	348(%rsp), %rcx
	movq	%rcx, 336(%rsp)
	movl	%eax, 332(%rsp)
	movq	%rcx, 324(%rsp)
	movq	%r15, 384(%rsp)
	leaq	288(%rsp), %rsi
	movq	%rbx, %rdi
	vzeroupper
	callq	__Z13push_triangleP14Render_ContextP8Triangle
	vmovsd	3552(%rbx), %xmm0       ## xmm0 = mem[0],zero
	vmovss	3560(%rbx), %xmm1       ## xmm1 = mem[0],zero,zero,zero
	vbroadcastss	LCPI23_16(%rip), %xmm2 ## xmm2 = [1.00000001E-1,1.00000001E-1,1.00000001E-1,1.00000001E-1]
	vmovlps	%xmm2, 96(%rsp)
	movl	$1036831949, 104(%rsp)  ## imm = 0x3DCCCCCD
	vbroadcastss	LCPI23_17(%rip), %xmm2 ## xmm2 = [1.0E+0,1.0E+0,1.0E+0,1.0E+0]
	vmovlps	%xmm2, 80(%rsp)
	movl	$1065353216, 88(%rsp)   ## imm = 0x3F800000
	movl	88(%rsp), %eax
	movq	80(%rsp), %rcx
	movl	104(%rsp), %r8d
	movq	96(%rsp), %r9
	vmovss	LCPI23_17(%rip), %xmm2  ## xmm2 = mem[0],zero,zero,zero
	xorl	%r15d, %r15d
	vmovss	LCPI23_18(%rip), %xmm7  ## xmm7 = mem[0],zero,zero,zero
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	movq	%rbx, %rdi
	vmovaps	32(%rsp), %xmm4         ## 16-byte Reload
	movl	$0, %esi
	movl	$0, %edx
	pushq	%rax
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	callq	__Z9push_cubeP14Render_Context2v3S1_S1_S1_S1_S1_P7TextureS3_
	addq	$32, %rsp
	movq	3648(%rbx), %rax
	movl	$0, 6272(%rax)
	xchgl	%r15d, 6268(%rax)
	jmp	LBB23_9
	.p2align	4, 0x90
LBB23_10:                               ##   in Loop: Header=BB23_9 Depth=1
	movq	%rbx, %rdi
	callq	__Z11render_tileP14Render_Contexti
	movq	3648(%rbx), %rax
	lock		incl	6272(%rax)
LBB23_9:                                ## =>This Inner Loop Header: Depth=1
	movq	3648(%rbx), %rax
	movl	$1, %esi
	lock		xaddl	%esi, 6268(%rax)
	cmpl	$255, %esi
	jle	LBB23_10
	jmp	LBB23_12
	.p2align	4, 0x90
LBB23_11:                               ##   in Loop: Header=BB23_12 Depth=1
	movl	$100, %edi
	callq	_usleep
LBB23_12:                               ## =>This Inner Loop Header: Depth=1
	movq	3648(%rbx), %rax
	movl	6272(%rax), %eax
	cmpl	$256, %eax              ## imm = 0x100
	jne	LBB23_11
## %bb.13:
	leaq	288(%rsp), %rsi
	movl	$6, %edi
	callq	_clock_gettime
	movq	288(%rsp), %rax
	movq	296(%rsp), %rcx
	subq	176(%rsp), %rax
	vcvtsi2sdq	%rax, %xmm8, %xmm0
	vmulsd	LCPI23_19(%rip), %xmm0, %xmm0
	subq	184(%rsp), %rcx
	vcvtsi2sdq	%rcx, %xmm8, %xmm1
	vdivsd	LCPI23_20(%rip), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, 40(%r14)
	movl	204(%r14), %eax
	testl	%eax, %eax
	je	LBB23_15
## %bb.14:
	vaddss	200(%r14), %xmm0, %xmm0
	vmovss	%xmm0, 200(%r14)
LBB23_15:
	vmovss	196(%r14), %xmm0        ## xmm0 = mem[0],zero,zero,zero
	vaddss	LCPI23_5(%rip), %xmm0, %xmm0
	vmovss	%xmm0, 196(%r14)
	incl	%eax
	movl	%eax, 204(%r14)
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	3976(%rsp), %rax
	jne	LBB23_17
## %bb.16:
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB23_17:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"rb"

L_.str.1:                               ## @.str.1
	.asciz	"failed to load file: %s\n"

L___func__._Z16read_entire_filePKc:     ## @__func__._Z16read_entire_filePKc
	.asciz	"read_entire_file"

L_.str.2:                               ## @.str.2
	.asciz	"./utils.cpp"

L_.str.3:                               ## @.str.3
	.asciz	"f"

L_.str.4:                               ## @.str.4
	.asciz	"result"

L___func__._Z18new_render_contextP4Game7Texturefffi: ## @__func__._Z18new_render_contextP4Game7Texturefffi
	.asciz	"new_render_context"

L_.str.5:                               ## @.str.5
	.asciz	"./renderer.cpp"

L_.str.6:                               ## @.str.6
	.asciz	"r.buffer_aa.pixels && r.triangles"

L___func__._Z13push_triangleP14Render_ContextP8Triangle: ## @__func__._Z13push_triangleP14Render_ContextP8Triangle
	.asciz	"push_triangle"

L_.str.7:                               ## @.str.7
	.asciz	"r->triangle_count < r->max_triangle_count"

L___func__._Z9load_meshPKcP7Texture:    ## @__func__._Z9load_meshPKcP7Texture
	.asciz	"load_mesh"

L_.str.8:                               ## @.str.8
	.asciz	"game.cpp"

L_.str.9:                               ## @.str.9
	.asciz	"vertex_count < max_vertices_count"

L_.str.10:                              ## @.str.10
	.asciz	"mesh.triangle_count < max_triangle_count"

L_.str.11:                              ## @.str.11
	.asciz	"f0[0] > 0 && f1[0] > 0 && f2[0] > 0"

L_.str.12:                              ## @.str.12
	.asciz	"f0[1] > 0 && f1[1] > 0 && f2[1] > 0"

L_.str.13:                              ## @.str.13
	.asciz	"f0[2] > 0 && f1[2] > 0 && f2[2] > 0"

L_.str.14:                              ## @.str.14
	.asciz	"loaded %d triangles\n"

L_.str.15:                              ## @.str.15
	.asciz	"lanched thread %d\n"

L_.str.16:                              ## @.str.16
	.asciz	"000"

L_.str.17:                              ## @.str.17
	.asciz	"0"

L_.str.18:                              ## @.str.18
	.asciz	"00"

L_.str.19:                              ## @.str.19
	.asciz	"%s/frame%s%d.obj"

L_.str.20:                              ## @.str.20
	.asciz	"starwars.png"

L_.str.21:                              ## @.str.21
	.asciz	"grass.png"

L_.str.22:                              ## @.str.22
	.asciz	"grass_top.png"

L_.str.23:                              ## @.str.23
	.asciz	"ground.png"

L_.str.24:                              ## @.str.24
	.asciz	"gun_tex.png"

L_.str.25:                              ## @.str.25
	.asciz	"starwars.obj"

L_.str.26:                              ## @.str.26
	.asciz	"gun.obj"

L_.str.27:                              ## @.str.27
	.asciz	"cow.obj"

L_.str.28:                              ## @.str.28
	.asciz	"monkey.obj"

L_.str.29:                              ## @.str.29
	.asciz	"african_head.png"

L_.str.30:                              ## @.str.30
	.asciz	"african_head.obj"


.subsections_via_symbols
