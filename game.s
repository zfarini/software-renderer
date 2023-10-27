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
	.p2align	2               ## -- Begin function _Z18new_render_context7Texturefffi
LCPI4_0:
	.long	1056964608              ## float 0.5
LCPI4_3:
	.long	1065353216              ## float 1
LCPI4_4:
	.long	925353388               ## float 9.99999974E-6
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI4_1:
	.quad	4580687790476533049     ## double 0.017453292519943295
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4
LCPI4_2:
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
LCPI4_5:
	.long	1048576000              ## float 0.25
	.long	1048576000              ## float 0.25
	.space	4
	.space	4
LCPI4_6:
	.long	1061158912              ## float 0.75
	.long	1048576000              ## float 0.25
	.space	4
	.space	4
LCPI4_7:
	.long	1061158912              ## float 0.75
	.long	1061158912              ## float 0.75
	.space	4
	.space	4
LCPI4_8:
	.long	1048576000              ## float 0.25
	.long	1061158912              ## float 0.75
	.space	4
	.space	4
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z18new_render_context7Texturefffi
	.p2align	4, 0x90
__Z18new_render_context7Texturefffi:    ## @_Z18new_render_context7Texturefffi
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
	subq	$88, %rsp
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movl	%esi, %r13d
	vmovss	%xmm2, -64(%rbp)        ## 4-byte Spill
	vmovss	%xmm1, -44(%rbp)        ## 4-byte Spill
	vmovaps	%xmm0, -96(%rbp)        ## 16-byte Spill
	movq	%rdi, %rbx
	leaq	24(%rdi), %rdi
	movl	$1072, %esi             ## imm = 0x430
	callq	___bzero
	vmovaps	16(%rbp), %xmm0
	vmovups	%xmm0, (%rbx)
	movq	32(%rbp), %rax
	movq	%rax, 16(%rbx)
	movl	(%rbx), %eax
	movl	4(%rbx), %r14d
	movq	%rax, -80(%rbp)         ## 8-byte Spill
	leal	(,%rax,4), %eax
	movl	%eax, 24(%rbx)
	movl	%eax, 32(%rbx)
	movl	%r14d, 28(%rbx)
	imull	%r14d, %eax
	movslq	%eax, %r15
	shlq	$2, %r15
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, %r12
	movq	%rax, 40(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 48(%rbx)
	vmovss	-64(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 148(%rbx)
	vmovaps	-96(%rbp), %xmm0        ## 16-byte Reload
	vmovss	%xmm0, 56(%rbx)
	vmovss	-44(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 60(%rbx)
	movl	%r13d, -44(%rbp)        ## 4-byte Spill
	movslq	%r13d, %r15
	imulq	$168, %r15, %rdi
	callq	_malloc
	movq	%rax, 184(%rbx)
	testq	%rax, %rax
	je	LBB4_14
## %bb.1:
	testq	%r12, %r12
	je	LBB4_14
## %bb.2:
	vmovss	LCPI4_0(%rip), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	vmulss	-64(%rbp), %xmm0, %xmm0 ## 4-byte Folded Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmulsd	LCPI4_1(%rip), %xmm0, %xmm0
	callq	_tan
	vaddsd	%xmm0, %xmm0, %xmm0
	vmovaps	-96(%rbp), %xmm1        ## 16-byte Reload
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, 152(%rbx)
	vcvtsi2ssl	%r14d, %xmm3, %xmm1
	movq	-80(%rbp), %rax         ## 8-byte Reload
	vcvtsi2ssl	%eax, %xmm3, %xmm2
	vdivss	%xmm2, %xmm1, %xmm1
	vmulss	%xmm0, %xmm1, %xmm1
	vmovss	%xmm1, 156(%rbx)
	vmovss	LCPI4_0(%rip), %xmm3    ## xmm3 = mem[0],zero,zero,zero
	vmulss	%xmm3, %xmm1, %xmm2
	vmovaps	%xmm2, -128(%rbp)       ## 16-byte Spill
	vmovss	%xmm2, 168(%rbx)
	vmulss	%xmm3, %xmm0, %xmm1
	vmovaps	%xmm1, -112(%rbp)       ## 16-byte Spill
	vmovss	%xmm1, 164(%rbx)
	vmovaps	LCPI4_2(%rip), %xmm3    ## xmm3 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	vxorps	%xmm3, %xmm2, %xmm0
	vmovaps	%xmm0, -64(%rbp)        ## 16-byte Spill
	vmovss	%xmm0, 172(%rbx)
	vxorps	%xmm3, %xmm1, %xmm0
	vmovaps	%xmm0, -80(%rbp)        ## 16-byte Spill
	vmovss	%xmm0, 160(%rbx)
	shlq	$3, %r15
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 200(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 208(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 216(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 224(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 232(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 240(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 248(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 256(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 264(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 272(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 280(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 288(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 296(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 304(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 312(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 320(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 328(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 336(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 344(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 352(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 360(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 368(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 376(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 384(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 392(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 400(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 408(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 416(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 424(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 432(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 440(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 448(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 456(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 464(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 472(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 480(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 488(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 496(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 504(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 512(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 520(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 528(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 536(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 544(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 552(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 560(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 568(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 576(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 584(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 592(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 600(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 608(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 616(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 624(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 632(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 640(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 648(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 656(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 664(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 672(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 680(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 688(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 696(%rbx)
	movq	%r15, %rdi
	callq	_malloc
	movq	%rax, 704(%rbx)
	vmovaps	-96(%rbp), %xmm1        ## 16-byte Reload
	vxorps	LCPI4_2(%rip), %xmm1, %xmm0
	movq	$0, 1012(%rbx)
	movl	$-1082130432, 1020(%rbx) ## imm = 0xBF800000
	vmovss	%xmm0, 1024(%rbx)
	vmovaps	-128(%rbp), %xmm2       ## 16-byte Reload
	vmulss	%xmm1, %xmm2, %xmm4
	vmulss	%xmm0, %xmm2, %xmm5
	vsubss	%xmm5, %xmm4, %xmm10
	vmovaps	-112(%rbp), %xmm3       ## 16-byte Reload
	vmulss	%xmm1, %xmm3, %xmm6
	vsubss	%xmm6, %xmm6, %xmm12
	vinsertps	$16, %xmm12, %xmm10, %xmm7 ## xmm7 = xmm10[0],xmm12[0],xmm10[2,3]
	vmulss	-80(%rbp), %xmm2, %xmm1 ## 16-byte Folded Reload
	vmulss	%xmm2, %xmm3, %xmm2
	vsubss	%xmm2, %xmm1, %xmm11
	vmovlps	%xmm7, 1028(%rbx)
	vmovss	%xmm11, 1036(%rbx)
	movl	$0, 1040(%rbx)
	vsubss	%xmm4, %xmm5, %xmm13
	vmulss	%xmm0, %xmm3, %xmm0
	vsubss	%xmm0, %xmm0, %xmm14
	vinsertps	$16, %xmm14, %xmm13, %xmm7 ## xmm7 = xmm13[0],xmm14[0],xmm13[2,3]
	vmulss	-64(%rbp), %xmm3, %xmm1 ## 16-byte Folded Reload
	vsubss	%xmm2, %xmm1, %xmm15
	vmovlps	%xmm7, 1044(%rbx)
	vmovss	%xmm15, 1052(%rbx)
	movl	$0, 1056(%rbx)
	vsubss	%xmm5, %xmm5, %xmm1
	vsubss	%xmm6, %xmm0, %xmm2
	vmovaps	%xmm2, -80(%rbp)        ## 16-byte Spill
	vinsertps	$16, %xmm2, %xmm1, %xmm2 ## xmm2 = xmm1[0],xmm2[0],xmm1[2,3]
	vmovlps	%xmm2, 1060(%rbx)
	vmovss	%xmm11, 1068(%rbx)
	movl	$0, 1072(%rbx)
	vsubss	%xmm4, %xmm4, %xmm2
	vsubss	%xmm0, %xmm6, %xmm0
	vmovaps	%xmm2, -96(%rbp)        ## 16-byte Spill
	vmovaps	%xmm0, -64(%rbp)        ## 16-byte Spill
	vinsertps	$16, %xmm0, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm0[0],xmm2[2,3]
	vmovlps	%xmm0, 1076(%rbx)
	vmovss	%xmm15, 1084(%rbx)
	movl	$0, 1088(%rbx)
	vmovsd	1012(%rbx), %xmm4       ## xmm4 = mem[0],zero
	vmulss	%xmm4, %xmm4, %xmm0
	vmovshdup	%xmm4, %xmm6    ## xmm6 = xmm4[1,1,3,3]
	vmulss	%xmm6, %xmm6, %xmm2
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	LCPI4_3(%rip), %xmm0, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm0
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm7, %xmm7, %xmm7
	vmovss	LCPI4_4(%rip), %xmm2    ## xmm2 = mem[0],zero,zero,zero
	vmovaps	%xmm2, %xmm3
	vucomiss	%xmm0, %xmm2
	vxorps	%xmm8, %xmm8, %xmm8
	vxorps	%xmm9, %xmm9, %xmm9
	jae	LBB4_4
## %bb.3:
	vmovss	LCPI4_3(%rip), %xmm2    ## xmm2 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm2, %xmm0
	vmulss	%xmm0, %xmm4, %xmm2
	vmulss	%xmm0, %xmm6, %xmm4
	vinsertps	$16, %xmm4, %xmm2, %xmm8 ## xmm8 = xmm2[0],xmm4[0],xmm2[2,3]
	vxorps	LCPI4_2(%rip), %xmm0, %xmm9
LBB4_4:
	vmovlps	%xmm8, 1012(%rbx)
	vmovss	%xmm9, 1020(%rbx)
	vmulss	%xmm10, %xmm10, %xmm0
	vmulss	%xmm12, %xmm12, %xmm2
	vaddss	%xmm2, %xmm0, %xmm0
	vmulss	%xmm11, %xmm11, %xmm4
	vaddss	%xmm0, %xmm4, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm3, %xmm8
	vucomiss	%xmm0, %xmm3
	jae	LBB4_6
## %bb.5:
	vmovss	LCPI4_3(%rip), %xmm2    ## xmm2 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm2, %xmm0
	vmulss	%xmm0, %xmm10, %xmm2
	vmulss	%xmm0, %xmm12, %xmm3
	vinsertps	$16, %xmm3, %xmm2, %xmm7 ## xmm7 = xmm2[0],xmm3[0],xmm2[2,3]
	vmulss	%xmm0, %xmm11, %xmm5
LBB4_6:
	vmovlps	%xmm7, 1028(%rbx)
	vmovss	%xmm5, 1036(%rbx)
	vmulss	%xmm13, %xmm13, %xmm0
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
	jae	LBB4_8
## %bb.7:
	vmovss	LCPI4_3(%rip), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	vdivss	%xmm6, %xmm0, %xmm6
	vmulss	%xmm6, %xmm13, %xmm0
	vmulss	%xmm6, %xmm14, %xmm7
	vinsertps	$16, %xmm7, %xmm0, %xmm0 ## xmm0 = xmm0[0],xmm7[0],xmm0[2,3]
	vmulss	%xmm6, %xmm15, %xmm7
LBB4_8:
	vmovlps	%xmm0, 1044(%rbx)
	vmovss	%xmm7, 1052(%rbx)
	vmulss	%xmm1, %xmm1, %xmm0
	vmovaps	-80(%rbp), %xmm7        ## 16-byte Reload
	vmulss	%xmm7, %xmm7, %xmm6
	vaddss	%xmm6, %xmm0, %xmm0
	vaddss	%xmm0, %xmm4, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm0
	vucomiss	%xmm0, %xmm8
	jae	LBB4_10
## %bb.9:
	vmovss	LCPI4_3(%rip), %xmm3    ## xmm3 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm3, %xmm0
	vmulss	%xmm0, %xmm1, %xmm1
	vmulss	%xmm0, %xmm7, %xmm3
	vinsertps	$16, %xmm3, %xmm1, %xmm5 ## xmm5 = xmm1[0],xmm3[0],xmm1[2,3]
	vmulss	%xmm0, %xmm11, %xmm3
LBB4_10:
	vmovlps	%xmm5, 1060(%rbx)
	vmovss	%xmm3, 1068(%rbx)
	vmovaps	-96(%rbp), %xmm3        ## 16-byte Reload
	vmulss	%xmm3, %xmm3, %xmm0
	vmovaps	-64(%rbp), %xmm4        ## 16-byte Reload
	vmulss	%xmm4, %xmm4, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vaddss	%xmm0, %xmm2, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm0
	vucomiss	%xmm0, %xmm8
	jae	LBB4_11
## %bb.12:
	vmovss	LCPI4_3(%rip), %xmm1    ## xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm1, %xmm0
	vmulss	%xmm0, %xmm3, %xmm1
	vmulss	%xmm0, %xmm4, %xmm2
	vinsertps	$16, %xmm2, %xmm1, %xmm1 ## xmm1 = xmm1[0],xmm2[0],xmm1[2,3]
	vmulss	%xmm0, %xmm15, %xmm0
	jmp	LBB4_13
LBB4_11:
	vxorps	%xmm0, %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
LBB4_13:
	vmovlps	%xmm1, 1076(%rbx)
	vmovss	%xmm0, 1084(%rbx)
	vmovaps	LCPI4_5(%rip), %xmm0    ## xmm0 = <2.5E-1,2.5E-1,u,u>
	vinsertf128	$1, LCPI4_6(%rip), %ymm0, %ymm1
	movl	-44(%rbp), %eax         ## 4-byte Reload
	movl	%eax, 176(%rbx)
	vinsertf128	$1, LCPI4_7(%rip), %ymm0, %ymm2
	vperm2f128	$49, %ymm2, %ymm1, %ymm1 ## ymm1 = ymm1[2,3],ymm2[2,3]
	vinsertf128	$1, LCPI4_8(%rip), %ymm0, %ymm0
	vunpcklpd	%ymm1, %ymm0, %ymm0 ## ymm0 = ymm0[0],ymm1[0],ymm0[2],ymm1[2]
	vmovups	%ymm0, 968(%rbx)
	movq	%rbx, %rax
	addq	$88, %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
LBB4_14:
	leaq	L___func__._Z18new_render_context7Texturefffi(%rip), %rdi
	leaq	L_.str.5(%rip), %rsi
	leaq	L_.str.7(%rip), %rcx
	movl	$32, %edx
	callq	___assert_rtn
	.cfi_endproc
                                        ## -- End function
	.globl	__Z12begin_renderP14Render_Context2v34m3x3S1_ ## -- Begin function _Z12begin_renderP14Render_Context2v34m3x3S1_
	.p2align	4, 0x90
__Z12begin_renderP14Render_Context2v34m3x3S1_: ## @_Z12begin_renderP14Render_Context2v34m3x3S1_
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	16(%rbp), %r8
	movslq	24(%rdi), %rcx
	movslq	28(%rdi), %rax
	imulq	%rcx, %rax
	testl	%eax, %eax
	jle	LBB5_9
## %bb.1:
	leaq	60(%rdi), %r9
	movq	48(%rdi), %rsi
	cmpl	$31, %eax
	jbe	LBB5_2
## %bb.3:
	leaq	61(%rdi), %rcx
	cmpq	%rsi, %rcx
	jbe	LBB5_5
## %bb.4:
	leaq	(%rsi,%rax,4), %rcx
	cmpq	%rcx, %r9
	jae	LBB5_5
LBB5_2:
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB5_8:                                 ## =>This Inner Loop Header: Depth=1
	movl	(%r9), %edx
	movl	%edx, (%rsi,%rcx,4)
	incq	%rcx
	cmpq	%rax, %rcx
	jl	LBB5_8
LBB5_9:
	movl	$0, 192(%rdi)
	vxorps	%xmm4, %xmm4, %xmm4
	vmovups	%ymm4, 936(%rdi)
	vmovups	%ymm4, 904(%rdi)
	vmovups	%ymm4, 872(%rdi)
	vmovups	%ymm4, 840(%rdi)
	vmovups	%ymm4, 808(%rdi)
	vmovups	%ymm4, 776(%rdi)
	vmovups	%ymm4, 744(%rdi)
	vmovups	%ymm4, 712(%rdi)
	vmovlps	%xmm0, 64(%rdi)
	vmovss	%xmm1, 72(%rdi)
	vmovups	(%r8), %ymm0
	vmovups	%ymm0, 76(%rdi)
	movl	32(%r8), %eax
	movl	%eax, 108(%rdi)
	vmovups	76(%rdi), %ymm0
	vperm2f128	$1, %ymm0, %ymm0, %ymm1 ## ymm1 = ymm0[2,3,0,1]
	vshufps	$18, %ymm0, %ymm1, %ymm1 ## ymm1 = ymm1[2,0],ymm0[1,0],ymm1[6,4],ymm0[5,4]
	vshufps	$140, %ymm1, %ymm0, %ymm0 ## ymm0 = ymm0[0,3],ymm1[0,2],ymm0[4,7],ymm1[4,6]
	vmovups	%ymm0, 112(%rdi)
	movl	%eax, 144(%rdi)
	vmovlps	%xmm2, 1000(%rdi)
	vmovss	%xmm3, 1008(%rdi)
	popq	%rbp
	vzeroupper
	retq
LBB5_5:
	movq	%rax, %rcx
	andq	$-32, %rcx
	vbroadcastss	(%r9), %ymm4
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB5_6:                                 ## =>This Inner Loop Header: Depth=1
	vmovups	%ymm4, (%rsi,%rdx,4)
	vmovups	%ymm4, 32(%rsi,%rdx,4)
	vmovups	%ymm4, 64(%rsi,%rdx,4)
	vmovups	%ymm4, 96(%rsi,%rdx,4)
	addq	$32, %rdx
	cmpq	%rdx, %rcx
	jne	LBB5_6
## %bb.7:
	cmpq	%rax, %rcx
	jne	LBB5_8
	jmp	LBB5_9
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
	vmovsldup	%xmm0, %xmm6    ## xmm6 = xmm0[0,0,2,2]
	vinsertps	$16, 88(%rdi), %xmm2, %xmm2 ## xmm2 = xmm2[0],mem[0],xmm2[2,3]
	vmulps	%xmm2, %xmm6, %xmm2
	vxorps	%xmm6, %xmm6, %xmm6
	vaddps	%xmm6, %xmm2, %xmm2
	vinsertps	$16, 92(%rdi), %xmm3, %xmm3 ## xmm3 = xmm3[0],mem[0],xmm3[2,3]
	vmulps	%xmm3, %xmm5, %xmm3
	vaddps	%xmm3, %xmm2, %xmm2
	vmovsldup	%xmm1, %xmm3    ## xmm3 = xmm1[0,0,2,2]
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
	.p2align	2               ## -- Begin function _Z15color_v3_to_u322v3
LCPI8_0:
	.long	1132396544              ## float 255
LCPI8_1:
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
	vmovss	LCPI8_0(%rip), %xmm2    ## xmm2 = mem[0],zero,zero,zero
	vmulss	%xmm2, %xmm0, %xmm3
	vmovss	LCPI8_1(%rip), %xmm4    ## xmm4 = mem[0],zero,zero,zero
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
LCPI9_0:
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
	vmovss	LCPI9_0(%rip), %xmm3    ## xmm3 = mem[0],zero,zero,zero
	vmulss	%xmm3, %xmm0, %xmm0
	vmulss	%xmm3, %xmm1, %xmm1
	vinsertps	$16, %xmm1, %xmm0, %xmm0 ## xmm0 = xmm0[0],xmm1[0],xmm0[2,3]
	vmulss	%xmm3, %xmm2, %xmm1
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
	shrl	$29, %r10d
	addl	%r8d, %r10d
	sarl	$3, %r10d
	movl	%esi, %eax
	sarl	$31, %eax
	shrl	$29, %eax
	addl	%esi, %eax
	movl	%eax, %edi
	andl	$-8, %edi
	subl	%edi, %esi
	imull	%r10d, %esi
	sarl	$3, %eax
	movl	%r9d, %edi
	sarl	$31, %edi
	shrl	$29, %edi
	addl	%r9d, %edi
	sarl	$3, %edi
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
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function _Z13push_triangleP14Render_ContextP8Triangle
LCPI12_0:
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
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
	subq	$5880, %rsp             ## imm = 0x16F8
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
	vmovss	%xmm6, -5464(%rbp)      ## 4-byte Spill
	vmovss	120(%rdi), %xmm13       ## xmm13 = mem[0],zero,zero,zero
	vmovss	%xmm13, -5432(%rbp)     ## 4-byte Spill
	vmovss	124(%rdi), %xmm11       ## xmm11 = mem[0],zero,zero,zero
	vmovss	128(%rdi), %xmm10       ## xmm10 = mem[0],zero,zero,zero
	vmovss	132(%rdi), %xmm8        ## xmm8 = mem[0],zero,zero,zero
	vmovss	%xmm8, -5536(%rbp)      ## 4-byte Spill
	vmovsd	64(%rdi), %xmm7         ## xmm7 = mem[0],zero
	vmovss	72(%rdi), %xmm1         ## xmm1 = mem[0],zero,zero,zero
	vsubss	%xmm7, %xmm0, %xmm3
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vmovshdup	%xmm7, %xmm15   ## xmm15 = xmm7[1,1,3,3]
	vsubss	%xmm15, %xmm0, %xmm4
	vsubss	%xmm1, %xmm5, %xmm5
	vmovss	%xmm1, -5456(%rbp)      ## 4-byte Spill
	vmulss	%xmm3, %xmm9, %xmm0
	vmovss	%xmm9, -5520(%rbp)      ## 4-byte Spill
	vxorps	%xmm12, %xmm12, %xmm12
	vaddss	%xmm12, %xmm0, %xmm0
	vmulss	%xmm4, %xmm6, %xmm2
	vaddss	%xmm0, %xmm2, %xmm0
	vmulss	%xmm5, %xmm13, %xmm2
	vaddss	%xmm0, %xmm2, %xmm0
	vmulss	%xmm3, %xmm11, %xmm2
	vaddss	%xmm12, %xmm2, %xmm2
	vmulss	%xmm4, %xmm10, %xmm6
	vmovss	%xmm10, -5448(%rbp)     ## 4-byte Spill
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
	vmovss	-5464(%rbp), %xmm9      ## 4-byte Reload
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
	vmovss	-5536(%rbp), %xmm8      ## 4-byte Reload
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
	movq	%rsi, -5560(%rbp)       ## 8-byte Spill
	vmovss	32(%rsi), %xmm2         ## xmm2 = mem[0],zero,zero,zero
	vsubss	-5456(%rbp), %xmm2, %xmm2 ## 4-byte Folded Reload
	vmulss	-5520(%rbp), %xmm1, %xmm4 ## 4-byte Folded Reload
	vaddss	%xmm12, %xmm4, %xmm4
	vmulss	%xmm0, %xmm9, %xmm5
	vaddss	%xmm4, %xmm5, %xmm4
	vmulss	%xmm2, %xmm3, %xmm5
	vaddss	%xmm4, %xmm5, %xmm4
	vmulss	%xmm1, %xmm11, %xmm5
	vaddss	%xmm12, %xmm5, %xmm5
	vmulss	-5448(%rbp), %xmm0, %xmm6 ## 4-byte Folded Reload
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
	xorl	%eax, %eax
	movq	%rdi, -5480(%rbp)       ## 8-byte Spill
	.p2align	4, 0x90
LBB12_1:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB12_3 Depth 2
                                        ##     Child Loop BB12_61 Depth 2
                                        ##     Child Loop BB12_36 Depth 2
	testl	%r9d, %r9d
	jle	LBB12_62
## %bb.2:                               ##   in Loop: Header=BB12_1 Depth=1
	movq	%rax, -5568(%rbp)       ## 8-byte Spill
	shlq	$4, %rax
	vmovsd	1012(%rdi,%rax), %xmm12 ## xmm12 = mem[0],zero
	vmovss	1020(%rdi,%rax), %xmm11 ## xmm11 = mem[0],zero,zero,zero
	vmovshdup	%xmm12, %xmm9   ## xmm9 = xmm12[1,1,3,3]
	vmovss	1024(%rdi,%rax), %xmm7  ## xmm7 = mem[0],zero,zero,zero
	vxorps	LCPI12_0(%rip), %xmm7, %xmm0
	vmovaps	%xmm0, -5808(%rbp)      ## 16-byte Spill
	movl	%r9d, %r11d
	xorl	%r9d, %r9d
	leaq	-2736(%rbp), %rax
	vmovaps	%xmm7, -5680(%rbp)      ## 16-byte Spill
	vmovaps	%xmm12, -5712(%rbp)     ## 16-byte Spill
	vmovss	%xmm11, -5468(%rbp)     ## 4-byte Spill
	vmovaps	%xmm9, -5696(%rbp)      ## 16-byte Spill
	.p2align	4, 0x90
LBB12_3:                                ##   Parent Loop BB12_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	vmovsd	(%rax), %xmm3           ## xmm3 = mem[0],zero
	vmovshdup	%xmm3, %xmm14   ## xmm14 = xmm3[1,1,3,3]
	vmovss	8(%rax), %xmm5          ## xmm5 = mem[0],zero,zero,zero
	vmovsd	12(%rax), %xmm6         ## xmm6 = mem[0],zero
	vmovshdup	%xmm6, %xmm15   ## xmm15 = xmm6[1,1,3,3]
	vmovss	20(%rax), %xmm4         ## xmm4 = mem[0],zero,zero,zero
	vmovsd	24(%rax), %xmm10        ## xmm10 = mem[0],zero
	vmovshdup	%xmm10, %xmm2   ## xmm2 = xmm10[1,1,3,3]
	vmovss	32(%rax), %xmm8         ## xmm8 = mem[0],zero,zero,zero
	vmulss	%xmm12, %xmm3, %xmm0
	vmulss	%xmm9, %xmm14, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm5, -5448(%rbp)      ## 4-byte Spill
	vmulss	%xmm11, %xmm5, %xmm1
	vaddss	%xmm0, %xmm1, %xmm13
	vmulss	%xmm12, %xmm6, %xmm0
	vmulss	%xmm9, %xmm15, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmulss	%xmm11, %xmm4, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vmulss	%xmm12, %xmm10, %xmm1
	vmovaps	%xmm2, -5520(%rbp)      ## 16-byte Spill
	vmulss	%xmm9, %xmm2, %xmm2
	vaddss	%xmm2, %xmm1, %xmm1
	vmovss	%xmm8, -5432(%rbp)      ## 4-byte Spill
	vmulss	%xmm11, %xmm8, %xmm2
	vaddss	%xmm1, %xmm2, %xmm2
	vmovaps	LCPI12_0(%rip), %xmm1   ## xmm1 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	vmovaps	%xmm1, %xmm5
	vxorps	%xmm1, %xmm13, %xmm1
	xorl	%esi, %esi
	vucomiss	%xmm7, %xmm1
	seta	%sil
	vxorps	%xmm5, %xmm0, %xmm0
	xorl	%edx, %edx
	vucomiss	%xmm7, %xmm0
	seta	%dl
	vxorps	%xmm5, %xmm2, %xmm2
	xorl	%edi, %edi
	vucomiss	%xmm7, %xmm2
	seta	%dil
	addl	%esi, %edx
	addl	%edi, %edx
	cmpl	$3, %edx
	je	LBB12_59
## %bb.4:                               ##   in Loop: Header=BB12_3 Depth=2
	testl	%edx, %edx
	jne	LBB12_37
## %bb.5:                               ##   in Loop: Header=BB12_3 Depth=2
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
LBB12_59:                               ##   in Loop: Header=BB12_3 Depth=2
	addq	$168, %rax
	decq	%r11
	jne	LBB12_3
	jmp	LBB12_28
	.p2align	4, 0x90
LBB12_37:                               ##   in Loop: Header=BB12_3 Depth=2
	vucomiss	%xmm7, %xmm1
	vmovaps	%xmm10, %xmm5
	seta	%cl
	cmpl	$2, %edx
	sete	%bl
	vmovd	%xmm4, -5456(%rbp)      ## 4-byte Folded Spill
	movq	72(%rax), %r13
	movq	80(%rax), %r15
	movq	88(%rax), %rsi
	vmovsd	36(%rax), %xmm1         ## xmm1 = mem[0],zero
	movl	44(%rax), %r10d
	vmovsd	48(%rax), %xmm2         ## xmm2 = mem[0],zero
	movl	56(%rax), %edi
	vmovsd	60(%rax), %xmm8         ## xmm8 = mem[0],zero
	movl	68(%rax), %r8d
	xorb	%cl, %bl
	vmovaps	%xmm3, -5648(%rbp)      ## 16-byte Spill
	vmovaps	%xmm14, -5728(%rbp)     ## 16-byte Spill
	vmovaps	%xmm6, -5632(%rbp)      ## 16-byte Spill
	vmovss	%xmm4, -5484(%rbp)      ## 4-byte Spill
	vmovaps	%xmm15, -5792(%rbp)     ## 16-byte Spill
	vmovaps	%xmm10, -5776(%rbp)     ## 16-byte Spill
	je	LBB12_39
## %bb.38:                              ##   in Loop: Header=BB12_3 Depth=2
	vmovaps	%xmm5, -5760(%rbp)      ## 16-byte Spill
	vmovaps	%xmm15, -5584(%rbp)     ## 16-byte Spill
	vmovss	%xmm6, -5436(%rbp)      ## 4-byte Spill
	vmovaps	-5520(%rbp), %xmm7      ## 16-byte Reload
	vmovaps	%xmm10, %xmm5
	vmovaps	%xmm8, -5552(%rbp)      ## 16-byte Spill
	vmovaps	%xmm14, %xmm8
	vmovaps	%xmm3, %xmm10
	movl	%r8d, %r14d
	movl	%edi, %r12d
	vmovaps	%xmm2, -5504(%rbp)      ## 16-byte Spill
	movq	%rsi, %rbx
	movl	%r10d, %r8d
	vmovaps	%xmm1, -5536(%rbp)      ## 16-byte Spill
	vmovss	-5448(%rbp), %xmm15     ## 4-byte Reload
                                        ## xmm15 = mem[0],zero,zero,zero
	vmovaps	%xmm6, -5744(%rbp)      ## 16-byte Spill
	vmovss	%xmm4, -5464(%rbp)      ## 4-byte Spill
	vmovss	-5432(%rbp), %xmm1      ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	jmp	LBB12_48
LBB12_39:                               ##   in Loop: Header=BB12_3 Depth=2
	vmovaps	%xmm1, -5552(%rbp)      ## 16-byte Spill
	movq	%r13, %r14
	cmpl	$2, %edx
	sete	%cl
	vucomiss	%xmm7, %xmm0
	seta	%bl
	xorb	%cl, %bl
	movq	%rsi, %r13
	vmovaps	%xmm8, -5504(%rbp)      ## 16-byte Spill
	testb	%bl, %bl
	cmovneq	%r15, %r13
	movl	%edi, %r12d
	cmovnel	%r8d, %r12d
	jne	LBB12_41
## %bb.40:                              ##   in Loop: Header=BB12_3 Depth=2
	vmovaps	%xmm2, -5504(%rbp)      ## 16-byte Spill
LBB12_41:                               ##   in Loop: Header=BB12_3 Depth=2
	cmovneq	%rsi, %r15
	cmovnel	%edi, %r8d
	vmovaps	%xmm6, %xmm1
	movq	%r14, %rbx
	jne	LBB12_43
## %bb.42:                              ##   in Loop: Header=BB12_3 Depth=2
	vmovaps	%xmm8, %xmm2
	vmovaps	%xmm5, %xmm1
LBB12_43:                               ##   in Loop: Header=BB12_3 Depth=2
	vmovaps	%xmm2, -5536(%rbp)      ## 16-byte Spill
	vmovshdup	%xmm1, %xmm8    ## xmm8 = xmm1[1,1,3,3]
	vmovaps	%xmm4, %xmm7
	jne	LBB12_45
## %bb.44:                              ##   in Loop: Header=BB12_3 Depth=2
	vmovss	-5432(%rbp), %xmm7      ## 4-byte Reload
                                        ## xmm7 = mem[0],zero,zero,zero
	vmovaps	%xmm6, %xmm5
LBB12_45:                               ##   in Loop: Header=BB12_3 Depth=2
	vmovd	-5432(%rbp), %xmm0      ## 4-byte Folded Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vmovd	%xmm0, %esi
	vmovaps	%xmm5, %xmm2
	vmovshdup	%xmm5, %xmm6    ## xmm6 = xmm5[1,1,3,3]
	jne	LBB12_47
## %bb.46:                              ##   in Loop: Header=BB12_3 Depth=2
	vmovdqa	%xmm4, %xmm0
LBB12_47:                               ##   in Loop: Header=BB12_3 Depth=2
	vmovd	%xmm0, -5464(%rbp)      ## 4-byte Folded Spill
	movl	-5456(%rbp), %ecx       ## 4-byte Reload
	cmovnel	%esi, %ecx
	movl	%ecx, -5456(%rbp)       ## 4-byte Spill
	vmulss	%xmm1, %xmm12, %xmm0
	vmulss	%xmm8, %xmm9, %xmm2
	vaddss	%xmm2, %xmm0, %xmm0
	vmulss	%xmm7, %xmm11, %xmm2
	vmovaps	%xmm1, %xmm10
	vmovaps	%xmm7, %xmm15
	vaddss	%xmm0, %xmm2, %xmm13
	vmovaps	%xmm5, %xmm0
	vmovss	%xmm5, -5436(%rbp)      ## 4-byte Spill
	vmovaps	%xmm14, %xmm7
	vmovaps	%xmm3, %xmm5
	movl	%r10d, %r14d
	vmovaps	%xmm0, -5744(%rbp)      ## 16-byte Spill
	vmovaps	%xmm3, -5760(%rbp)      ## 16-byte Spill
	vmovss	-5448(%rbp), %xmm1      ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	vmovaps	%xmm6, -5584(%rbp)      ## 16-byte Spill
LBB12_48:                               ##   in Loop: Header=BB12_3 Depth=2
	vmovaps	%xmm9, %xmm2
	vmovaps	%xmm7, -5600(%rbp)      ## 16-byte Spill
	vmovaps	%xmm1, -5664(%rbp)      ## 16-byte Spill
	vmovaps	-5808(%rbp), %xmm0      ## 16-byte Reload
	vsubss	%xmm13, %xmm0, %xmm3
	vmovaps	%xmm5, -5616(%rbp)      ## 16-byte Spill
	vsubss	%xmm10, %xmm5, %xmm5
	vsubss	%xmm8, %xmm7, %xmm6
	vmovaps	%xmm15, %xmm9
	vsubss	%xmm15, %xmm1, %xmm7
	vmulss	%xmm5, %xmm12, %xmm0
	vmulss	%xmm6, %xmm2, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmulss	%xmm7, %xmm11, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vdivss	%xmm0, %xmm3, %xmm0
	vmulss	%xmm0, %xmm5, %xmm1
	vmulss	%xmm0, %xmm6, %xmm5
	vmulss	%xmm0, %xmm7, %xmm0
	vmovaps	%xmm2, %xmm7
	vaddss	%xmm1, %xmm10, %xmm2
	vaddss	%xmm5, %xmm8, %xmm4
	vaddss	%xmm0, %xmm15, %xmm13
	vmovaps	%xmm12, %xmm6
	vmovss	-5436(%rbp), %xmm12     ## 4-byte Reload
                                        ## xmm12 = mem[0],zero,zero,zero
	vsubss	%xmm10, %xmm12, %xmm0
	vmovaps	-5584(%rbp), %xmm15     ## 16-byte Reload
	vsubss	%xmm8, %xmm15, %xmm1
	vmovss	-5464(%rbp), %xmm14     ## 4-byte Reload
                                        ## xmm14 = mem[0],zero,zero,zero
	vsubss	%xmm9, %xmm14, %xmm5
	vmulss	%xmm0, %xmm6, %xmm6
	vmulss	%xmm1, %xmm7, %xmm7
	vaddss	%xmm7, %xmm6, %xmm6
	vmulss	%xmm5, %xmm11, %xmm7
	vaddss	%xmm6, %xmm7, %xmm6
	vdivss	%xmm6, %xmm3, %xmm3
	vmulss	%xmm3, %xmm0, %xmm0
	vmulss	%xmm3, %xmm1, %xmm1
	vmulss	%xmm3, %xmm5, %xmm3
	vaddss	%xmm0, %xmm10, %xmm7
	vaddss	%xmm1, %xmm8, %xmm11
	vaddss	%xmm3, %xmm9, %xmm6
	vmovaps	%xmm2, -5920(%rbp)      ## 16-byte Spill
	vinsertps	$16, %xmm10, %xmm2, %xmm0 ## xmm0 = xmm2[0],xmm10[0],xmm2[2,3]
	vmovsldup	-5616(%rbp), %xmm1 ## 16-byte Folded Reload
                                        ## xmm1 = mem[0,0,2,2]
	vsubps	%xmm1, %xmm0, %xmm0
	vmovaps	%xmm4, -5904(%rbp)      ## 16-byte Spill
	vinsertps	$16, %xmm8, %xmm4, %xmm1 ## xmm1 = xmm4[0],xmm8[0],xmm4[2,3]
	vmovsldup	-5600(%rbp), %xmm3 ## 16-byte Folded Reload
                                        ## xmm3 = mem[0,0,2,2]
	vsubps	%xmm3, %xmm1, %xmm1
	vmovaps	%xmm13, -5616(%rbp)     ## 16-byte Spill
	vinsertps	$16, %xmm9, %xmm13, %xmm3 ## xmm3 = xmm13[0],xmm9[0],xmm13[2,3]
	vmovsldup	-5664(%rbp), %xmm5 ## 16-byte Folded Reload
                                        ## xmm5 = mem[0,0,2,2]
	vsubps	%xmm5, %xmm3, %xmm3
	vmulps	%xmm0, %xmm0, %xmm0
	vmulps	%xmm1, %xmm1, %xmm1
	vaddps	%xmm1, %xmm0, %xmm0
	vmulps	%xmm3, %xmm3, %xmm1
	vaddps	%xmm0, %xmm1, %xmm0
	vsqrtps	%xmm0, %xmm0
	vmovshdup	%xmm0, %xmm1    ## xmm1 = xmm0[1,1,3,3]
	vdivss	%xmm1, %xmm0, %xmm1
	vmovaps	%xmm7, -5888(%rbp)      ## 16-byte Spill
	vsubss	%xmm12, %xmm7, %xmm0
	vmovaps	%xmm11, -5872(%rbp)     ## 16-byte Spill
	vsubss	%xmm15, %xmm11, %xmm3
	vmovss	%xmm6, -5600(%rbp)      ## 4-byte Spill
	vsubss	%xmm14, %xmm6, %xmm5
	vmulss	%xmm0, %xmm0, %xmm0
	vmulss	%xmm3, %xmm3, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vmulss	%xmm5, %xmm5, %xmm3
	vaddss	%xmm0, %xmm3, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm0
	vmovaps	%xmm10, -5840(%rbp)     ## 16-byte Spill
	vsubss	%xmm12, %xmm10, %xmm2
	vsubss	%xmm15, %xmm8, %xmm3
	vmovaps	%xmm9, -5824(%rbp)      ## 16-byte Spill
	vsubss	%xmm14, %xmm9, %xmm4
	vmulss	%xmm2, %xmm2, %xmm2
	vmulss	%xmm3, %xmm3, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vmulss	%xmm4, %xmm4, %xmm3
	vaddss	%xmm2, %xmm3, %xmm2
	vsqrtss	%xmm2, %xmm2, %xmm2
	vdivss	%xmm2, %xmm0, %xmm9
	vmovss	LCPI12_1(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vmovaps	%xmm0, %xmm8
	vsubss	%xmm1, %xmm0, %xmm0
	vmovd	%r14d, %xmm2
	vmovd	%r8d, %xmm5
	vmovaps	-5552(%rbp), %xmm7      ## 16-byte Reload
	vmulss	%xmm0, %xmm7, %xmm3
	vmovaps	-5536(%rbp), %xmm6      ## 16-byte Reload
	vmulss	%xmm1, %xmm6, %xmm4
	vaddss	%xmm3, %xmm4, %xmm15
	vmovshdup	%xmm7, %xmm3    ## xmm3 = xmm7[1,1,3,3]
	vmovshdup	%xmm6, %xmm4    ## xmm4 = xmm6[1,1,3,3]
	vmulss	%xmm0, %xmm3, %xmm3
	vmovaps	%xmm4, -5856(%rbp)      ## 16-byte Spill
	vmulss	%xmm1, %xmm4, %xmm4
	vaddss	%xmm3, %xmm4, %xmm7
	vmulss	%xmm2, %xmm0, %xmm2
	vmovd	%xmm5, -5584(%rbp)      ## 4-byte Folded Spill
	vmulss	%xmm5, %xmm1, %xmm3
	vaddss	%xmm2, %xmm3, %xmm3
	vmulss	%xmm15, %xmm15, %xmm2
	vmulss	%xmm7, %xmm7, %xmm4
	vaddss	%xmm4, %xmm2, %xmm2
	vmulss	%xmm3, %xmm3, %xmm4
	vaddss	%xmm2, %xmm4, %xmm2
	vmovq	%rbx, %xmm5
	vmovsldup	%xmm0, %xmm10   ## xmm10 = xmm0[0,0,2,2]
	vmovsldup	%xmm1, %xmm12   ## xmm12 = xmm1[0,0,2,2]
	vsqrtss	%xmm2, %xmm2, %xmm0
	vmovss	LCPI12_2(%rip), %xmm1   ## xmm1 = mem[0],zero,zero,zero
	vucomiss	%xmm0, %xmm1
	vmovq	%r13, %xmm4
	vmovq	%r15, %xmm13
	vsubss	%xmm9, %xmm8, %xmm14
	vmovsldup	%xmm14, %xmm2   ## xmm2 = xmm14[0,0,2,2]
	vmovsldup	%xmm9, %xmm11   ## xmm11 = xmm9[0,0,2,2]
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm1, %xmm1, %xmm1
	jae	LBB12_50
## %bb.49:                              ##   in Loop: Header=BB12_3 Depth=2
	vmovss	LCPI12_1(%rip), %xmm8   ## xmm8 = mem[0],zero,zero,zero
	vdivss	%xmm0, %xmm8, %xmm0
	vmulss	%xmm0, %xmm15, %xmm6
	vmulss	%xmm0, %xmm7, %xmm7
	vinsertps	$16, %xmm7, %xmm6, %xmm6 ## xmm6 = xmm6[0],xmm7[0],xmm6[2,3]
	vmulss	%xmm0, %xmm3, %xmm1
LBB12_50:                               ##   in Loop: Header=BB12_3 Depth=2
	vmovss	%xmm1, -5436(%rbp)      ## 4-byte Spill
	vmovaps	%xmm6, %xmm15
	vmulps	%xmm5, %xmm10, %xmm10
	vmulps	%xmm4, %xmm12, %xmm5
	vmulps	%xmm13, %xmm2, %xmm13
	vmulps	%xmm4, %xmm11, %xmm12
	vmovd	%r12d, %xmm1
	vmovaps	-5504(%rbp), %xmm3      ## 16-byte Reload
	vmulss	%xmm14, %xmm3, %xmm0
	vmovaps	-5536(%rbp), %xmm7      ## 16-byte Reload
	vmulss	%xmm9, %xmm7, %xmm2
	vaddss	%xmm0, %xmm2, %xmm6
	vmovshdup	%xmm3, %xmm0    ## xmm0 = xmm3[1,1,3,3]
	vmulss	%xmm14, %xmm0, %xmm0
	vmulss	-5856(%rbp), %xmm9, %xmm2 ## 16-byte Folded Reload
	vaddss	%xmm0, %xmm2, %xmm0
	vmulss	%xmm1, %xmm14, %xmm1
	vmulss	-5584(%rbp), %xmm9, %xmm2 ## 4-byte Folded Reload
	vaddss	%xmm1, %xmm2, %xmm1
	vmulss	%xmm6, %xmm6, %xmm2
	vmulss	%xmm0, %xmm0, %xmm3
	vaddss	%xmm3, %xmm2, %xmm2
	vmulss	%xmm1, %xmm1, %xmm3
	vaddss	%xmm2, %xmm3, %xmm2
	vsqrtss	%xmm2, %xmm2, %xmm2
	vmovss	LCPI12_2(%rip), %xmm3   ## xmm3 = mem[0],zero,zero,zero
	vucomiss	%xmm2, %xmm3
	vxorps	%xmm11, %xmm11, %xmm11
	vxorps	%xmm14, %xmm14, %xmm14
	jae	LBB12_52
## %bb.51:                              ##   in Loop: Header=BB12_3 Depth=2
	vmovss	LCPI12_1(%rip), %xmm3   ## xmm3 = mem[0],zero,zero,zero
	vdivss	%xmm2, %xmm3, %xmm2
	vmulss	%xmm2, %xmm6, %xmm3
	vmulss	%xmm2, %xmm0, %xmm0
	vinsertps	$16, %xmm0, %xmm3, %xmm14 ## xmm14 = xmm3[0],xmm0[0],xmm3[2,3]
	vmulss	%xmm2, %xmm1, %xmm11
LBB12_52:                               ##   in Loop: Header=BB12_3 Depth=2
	vmovaps	-5920(%rbp), %xmm0      ## 16-byte Reload
	vinsertps	$16, -5904(%rbp), %xmm0, %xmm4 ## 16-byte Folded Reload
                                        ## xmm4 = xmm0[0],mem[0],xmm0[2,3]
	vmovaps	-5888(%rbp), %xmm0      ## 16-byte Reload
	vinsertps	$16, -5872(%rbp), %xmm0, %xmm2 ## 16-byte Folded Reload
                                        ## xmm2 = xmm0[0],mem[0],xmm0[2,3]
	vaddps	%xmm10, %xmm5, %xmm5
	vaddps	%xmm13, %xmm12, %xmm12
	leal	1(%r9), %r10d
	movslq	%r9d, %rcx
	imulq	$168, %rcx, %rsi
	leaq	-5424(%rbp,%rsi), %rdi
	cmpl	$2, %edx
	vmovaps	-5728(%rbp), %xmm8      ## 16-byte Reload
	vmovss	-5464(%rbp), %xmm3      ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	jne	LBB12_54
## %bb.53:                              ##   in Loop: Header=BB12_3 Depth=2
	vmovlps	%xmm4, (%rdi)
	vmovaps	-5616(%rbp), %xmm0      ## 16-byte Reload
	vmovss	%xmm0, -5416(%rbp,%rsi)
	vmovlps	%xmm2, -5412(%rbp,%rsi)
	vmovss	-5600(%rbp), %xmm0      ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, -5404(%rbp,%rsi)
	vmovaps	-5840(%rbp), %xmm0      ## 16-byte Reload
	vmovlps	%xmm0, -5400(%rbp,%rsi)
	vmovaps	-5824(%rbp), %xmm0      ## 16-byte Reload
	vmovss	%xmm0, -5392(%rbp,%rsi)
	vmovlps	%xmm15, -5388(%rbp,%rsi)
	vmovss	-5436(%rbp), %xmm0      ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, -5380(%rbp,%rsi)
	vmovlps	%xmm14, -5376(%rbp,%rsi)
	vmovss	%xmm11, -5368(%rbp,%rsi)
	vmovlps	%xmm7, -5364(%rbp,%rsi)
	movl	%r8d, -5356(%rbp,%rsi)
	vmovlhps	%xmm12, %xmm5, %xmm0 ## xmm0 = xmm5[0],xmm12[0]
	vmovups	%xmm0, -5352(%rbp,%rsi)
	movq	%r13, -5336(%rbp,%rsi)
	vxorps	%xmm0, %xmm0, %xmm0
	vmovups	%ymm0, -5296(%rbp,%rsi)
	vmovups	%ymm0, -5328(%rbp,%rsi)
	movq	$0, -5264(%rbp,%rsi)
	jmp	LBB12_55
LBB12_54:                               ##   in Loop: Header=BB12_3 Depth=2
	vmovaps	-5760(%rbp), %xmm0      ## 16-byte Reload
	vmovlps	%xmm0, (%rdi)
	vmovaps	-5664(%rbp), %xmm0      ## 16-byte Reload
	vmovss	%xmm0, -5416(%rbp,%rsi)
	vmovaps	-5744(%rbp), %xmm6      ## 16-byte Reload
	vmovlps	%xmm6, -5412(%rbp,%rsi)
	movl	-5456(%rbp), %ecx       ## 4-byte Reload
	movl	%ecx, -5404(%rbp,%rsi)
	vmovlps	%xmm4, -5400(%rbp,%rsi)
	vmovaps	-5616(%rbp), %xmm7      ## 16-byte Reload
	vmovss	%xmm7, -5392(%rbp,%rsi)
	vmovaps	-5552(%rbp), %xmm0      ## 16-byte Reload
	vmovlps	%xmm0, -5388(%rbp,%rsi)
	movl	%r14d, -5380(%rbp,%rsi)
	vmovaps	-5504(%rbp), %xmm0      ## 16-byte Reload
	vmovlps	%xmm0, -5376(%rbp,%rsi)
	movl	%r12d, -5368(%rbp,%rsi)
	vmovaps	%xmm15, %xmm1
	vmovlps	%xmm15, -5364(%rbp,%rsi)
	vmovss	-5436(%rbp), %xmm15     ## 4-byte Reload
                                        ## xmm15 = mem[0],zero,zero,zero
	vmovss	%xmm15, -5356(%rbp,%rsi)
	movq	%rbx, -5352(%rbp,%rsi)
	movq	%r15, -5344(%rbp,%rsi)
	vmovlps	%xmm5, -5336(%rbp,%rsi)
	movslq	%r10d, %rcx
	imulq	$168, %rcx, %rcx
	vxorps	%xmm9, %xmm9, %xmm9
	vmovups	%ymm9, -5296(%rbp,%rsi)
	vmovups	%ymm9, -5328(%rbp,%rsi)
	movq	$0, -5264(%rbp,%rsi)
	vmovlps	%xmm6, -5424(%rbp,%rcx)
	vmovss	%xmm3, -5416(%rbp,%rcx)
	vmovlps	%xmm2, -5412(%rbp,%rcx)
	vmovss	-5600(%rbp), %xmm2      ## 4-byte Reload
                                        ## xmm2 = mem[0],zero,zero,zero
	vmovss	%xmm2, -5404(%rbp,%rcx)
	vmovlps	%xmm4, -5400(%rbp,%rcx)
	vmovss	%xmm7, -5392(%rbp,%rcx)
	vmovlps	%xmm0, -5388(%rbp,%rcx)
	movl	%r12d, -5380(%rbp,%rcx)
	vmovlps	%xmm14, -5376(%rbp,%rcx)
	vmovss	%xmm11, -5368(%rbp,%rcx)
	vmovlps	%xmm1, -5364(%rbp,%rcx)
	vmovss	%xmm15, -5356(%rbp,%rcx)
	vmovlhps	%xmm5, %xmm12, %xmm0 ## xmm0 = xmm12[0],xmm5[0]
	movq	%r15, -5352(%rbp,%rcx)
	vmovups	%xmm0, -5344(%rbp,%rcx)
	addl	$2, %r9d
	vmovups	%ymm9, -5296(%rbp,%rcx)
	vmovups	%ymm9, -5328(%rbp,%rcx)
	movq	$0, -5264(%rbp,%rcx)
	movl	%r9d, %r10d
LBB12_55:                               ##   in Loop: Header=BB12_3 Depth=2
	vmovaps	-5648(%rbp), %xmm0      ## 16-byte Reload
	vmovss	-5448(%rbp), %xmm6      ## 4-byte Reload
                                        ## xmm6 = mem[0],zero,zero,zero
	vmovaps	-5632(%rbp), %xmm1      ## 16-byte Reload
	vmovss	-5484(%rbp), %xmm4      ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	vmovaps	-5792(%rbp), %xmm3      ## 16-byte Reload
	vmovaps	-5776(%rbp), %xmm5      ## 16-byte Reload
	vsubss	%xmm0, %xmm1, %xmm2
	vsubss	%xmm8, %xmm3, %xmm3
	vsubss	%xmm6, %xmm4, %xmm1
	vsubss	%xmm0, %xmm5, %xmm4
	vmovaps	-5520(%rbp), %xmm0      ## 16-byte Reload
	vsubss	%xmm8, %xmm0, %xmm5
	vmovss	-5432(%rbp), %xmm0      ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vsubss	%xmm6, %xmm0, %xmm6
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
	jbe	LBB12_57
## %bb.56:                              ##   in Loop: Header=BB12_3 Depth=2
	leaq	-5412(%rbp,%rsi), %rcx
	vextractps	$0, %xmm6, (%rcx)
	vextractps	$0, %xmm12, 12(%rcx)
	movl	-5408(%rbp,%rsi), %edi
	movl	-5396(%rbp,%rsi), %ebx
	movl	%ebx, -5408(%rbp,%rsi)
	movl	%edi, -5396(%rbp,%rsi)
	vmovss	%xmm13, 8(%rcx)
	vmovss	%xmm11, 20(%rcx)
	vpermilps	$78, -5344(%rbp,%rsi), %xmm0 ## xmm0 = mem[2,3,0,1]
	vmovups	%xmm0, -5344(%rbp,%rsi)
	movl	-5376(%rbp,%rsi), %ecx
	movl	-5364(%rbp,%rsi), %edi
	movl	%edi, -5376(%rbp,%rsi)
	movl	%ecx, -5364(%rbp,%rsi)
	movq	-5372(%rbp,%rsi), %rcx
	movq	-5360(%rbp,%rsi), %rdi
	movq	%rdi, -5372(%rbp,%rsi)
	movq	%rcx, -5360(%rbp,%rsi)
LBB12_57:                               ##   in Loop: Header=BB12_3 Depth=2
	cmpl	$2, %edx
	je	LBB12_58
## %bb.86:                              ##   in Loop: Header=BB12_3 Depth=2
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
	jbe	LBB12_58
## %bb.87:                              ##   in Loop: Header=BB12_3 Depth=2
	leaq	-5412(%rbp,%rdx), %rcx
	vextractps	$0, %xmm6, (%rcx)
	vextractps	$0, %xmm12, 12(%rcx)
	movl	-5408(%rbp,%rdx), %esi
	movl	-5396(%rbp,%rdx), %edi
	movl	%edi, -5408(%rbp,%rdx)
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
LBB12_58:                               ##   in Loop: Header=BB12_3 Depth=2
	movl	%r10d, %r9d
	vmovaps	-5712(%rbp), %xmm12     ## 16-byte Reload
	vmovss	-5468(%rbp), %xmm11     ## 4-byte Reload
                                        ## xmm11 = mem[0],zero,zero,zero
	vmovaps	-5696(%rbp), %xmm9      ## 16-byte Reload
	vmovaps	-5680(%rbp), %xmm7      ## 16-byte Reload
	addq	$168, %rax
	decq	%r11
	jne	LBB12_3
LBB12_28:                               ##   in Loop: Header=BB12_1 Depth=1
	testl	%r9d, %r9d
	setg	%r8b
	jle	LBB12_29
## %bb.32:                              ##   in Loop: Header=BB12_1 Depth=1
	movl	%r9d, %edx
	leaq	-1(%rdx), %rsi
	movl	%edx, %ecx
	andl	$3, %ecx
	cmpq	$3, %rsi
	movq	-5568(%rbp), %rax       ## 8-byte Reload
	jae	LBB12_60
## %bb.33:                              ##   in Loop: Header=BB12_1 Depth=1
	xorl	%esi, %esi
	testq	%rcx, %rcx
	jne	LBB12_35
	jmp	LBB12_30
	.p2align	4, 0x90
LBB12_29:                               ##   in Loop: Header=BB12_1 Depth=1
	xorl	%r8d, %r8d
	movq	-5568(%rbp), %rax       ## 8-byte Reload
	incq	%rax
	cmpq	$4, %rax
	movq	-5480(%rbp), %rdi       ## 8-byte Reload
	jbe	LBB12_31
	jmp	LBB12_6
	.p2align	4, 0x90
LBB12_60:                               ##   in Loop: Header=BB12_1 Depth=1
	subq	%rcx, %rdx
	xorl	%ebx, %ebx
	xorl	%esi, %esi
	.p2align	4, 0x90
LBB12_61:                               ##   Parent Loop BB12_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	-5264(%rbp,%rbx), %rdi
	movq	%rdi, -2576(%rbp,%rbx)
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
	movq	-5096(%rbp,%rbx), %rdi
	movq	%rdi, -2408(%rbp,%rbx)
	movq	-4928(%rbp,%rbx), %rdi
	movq	%rdi, -2240(%rbp,%rbx)
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
	movq	-4760(%rbp,%rbx), %rdi
	movq	%rdi, -2072(%rbp,%rbx)
	addq	$4, %rsi
	addq	$672, %rbx              ## imm = 0x2A0
	cmpq	%rsi, %rdx
	jne	LBB12_61
## %bb.34:                              ##   in Loop: Header=BB12_1 Depth=1
	testq	%rcx, %rcx
	je	LBB12_30
LBB12_35:                               ##   in Loop: Header=BB12_1 Depth=1
	imulq	$168, %rsi, %rsi
	leaq	-2736(%rbp,%rsi), %rdx
	leaq	-5424(%rbp,%rsi), %rsi
	imulq	$168, %rcx, %rcx
	xorl	%ebx, %ebx
	.p2align	4, 0x90
LBB12_36:                               ##   Parent Loop BB12_1 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movq	160(%rsi,%rbx), %rdi
	movq	%rdi, 160(%rdx,%rbx)
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
	jne	LBB12_36
LBB12_30:                               ##   in Loop: Header=BB12_1 Depth=1
	incq	%rax
	cmpq	$4, %rax
	movq	-5480(%rbp), %rdi       ## 8-byte Reload
	ja	LBB12_6
LBB12_31:                               ##   in Loop: Header=BB12_1 Depth=1
	testl	%r9d, %r9d
	jne	LBB12_1
LBB12_6:
	testb	%r8b, %r8b
	je	LBB12_62
## %bb.7:
	movq	-5560(%rbp), %rax       ## 8-byte Reload
	leaq	104(%rax), %rax
	movq	%rax, -5664(%rbp)       ## 8-byte Spill
	movslq	%r9d, %rax
	movq	%rax, -5648(%rbp)       ## 8-byte Spill
	leaq	200(%rdi), %rax
	movq	%rax, -5728(%rbp)       ## 8-byte Spill
	leaq	712(%rdi), %rax
	movq	%rax, -5632(%rbp)       ## 8-byte Spill
	xorl	%eax, %eax
	vmovss	LCPI12_5(%rip), %xmm15  ## xmm15 = mem[0],zero,zero,zero
	.p2align	4, 0x90
LBB12_8:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB12_67 Depth 2
                                        ##       Child Loop BB12_68 Depth 3
	movq	%rax, -5552(%rbp)       ## 8-byte Spill
	imulq	$168, %rax, %rax
	movq	-5560(%rbp), %rcx       ## 8-byte Reload
	movq	96(%rcx), %rcx
	movq	%rcx, -2640(%rbp,%rax)
	movq	-5664(%rbp), %rdx       ## 8-byte Reload
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
	vmovss	%xmm1, -5448(%rbp)      ## 4-byte Spill
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
	jp	LBB12_10
## %bb.9:                               ##   in Loop: Header=BB12_8 Depth=1
	vmaxss	%xmm6, %xmm9, %xmm7
LBB12_10:                               ##   in Loop: Header=BB12_8 Depth=1
	vmulss	%xmm12, %xmm11, %xmm1
	vblendvps	%xmm2, %xmm9, %xmm10, %xmm2
	vblendvps	%xmm3, %xmm5, %xmm4, %xmm3
	vucomiss	%xmm8, %xmm8
	jp	LBB12_12
## %bb.11:                              ##   in Loop: Header=BB12_8 Depth=1
	vmaxss	%xmm8, %xmm7, %xmm7
LBB12_12:                               ##   in Loop: Header=BB12_8 Depth=1
	vmovss	%xmm7, -5520(%rbp)      ## 4-byte Spill
	vminss	%xmm8, %xmm2, %xmm7
	vcmpunordss	%xmm8, %xmm8, %xmm10
	vminss	%xmm1, %xmm3, %xmm12
	vcmpunordss	%xmm1, %xmm1, %xmm13
	vucomiss	%xmm0, %xmm0
	vmovaps	%xmm5, %xmm4
	jp	LBB12_14
## %bb.13:                              ##   in Loop: Header=BB12_8 Depth=1
	vmaxss	%xmm0, %xmm5, %xmm4
LBB12_14:                               ##   in Loop: Header=BB12_8 Depth=1
	vinsertps	$16, %xmm1, %xmm8, %xmm8 ## xmm8 = xmm8[0],xmm1[0],xmm8[2,3]
	vdivss	-5432(%rbp), %xmm15, %xmm11 ## 4-byte Folded Reload
	vinsertps	$16, %xmm0, %xmm6, %xmm6 ## xmm6 = xmm6[0],xmm0[0],xmm6[2,3]
	vdivss	-5448(%rbp), %xmm15, %xmm0 ## 4-byte Folded Reload
	vinsertps	$16, %xmm5, %xmm9, %xmm5 ## xmm5 = xmm9[0],xmm5[0],xmm9[2,3]
	vdivss	%xmm14, %xmm15, %xmm9
	vblendvps	%xmm10, %xmm2, %xmm7, %xmm2
	vblendvps	%xmm13, %xmm3, %xmm12, %xmm3
	vucomiss	%xmm1, %xmm1
	jp	LBB12_16
## %bb.15:                              ##   in Loop: Header=BB12_8 Depth=1
	vmaxss	%xmm1, %xmm4, %xmm4
LBB12_16:                               ##   in Loop: Header=BB12_8 Depth=1
	vroundss	$10, %xmm4, %xmm4, %xmm1
	vmovlps	%xmm8, -2620(%rbp,%rax)
	vmovss	%xmm11, -2612(%rbp,%rax)
	vmovlps	%xmm6, -2608(%rbp,%rax)
	vmovss	%xmm0, -2600(%rbp,%rax)
	vmovlps	%xmm5, -2596(%rbp,%rax)
	vmovss	%xmm9, -2588(%rbp,%rax)
	vroundss	$9, %xmm2, %xmm2, %xmm0
	vcvttss2si	%xmm0, %r11d
	leaq	-2584(%rbp,%rax), %rcx
	movq	%rcx, -5432(%rbp)       ## 8-byte Spill
	movl	%r11d, -2584(%rbp,%rax)
	vmovss	-5520(%rbp), %xmm0      ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vroundss	$10, %xmm0, %xmm0, %xmm0
	vcvttss2si	%xmm0, %esi
	movl	%esi, -2576(%rbp,%rax)
	vroundss	$9, %xmm3, %xmm3, %xmm0
	vcvttss2si	%xmm0, %ebx
	movl	%ebx, -2580(%rbp,%rax)
	vcvttss2si	%xmm1, %edx
	movl	%edx, -2572(%rbp,%rax)
	testl	%r11d, %r11d
	js	LBB12_17
## %bb.18:                              ##   in Loop: Header=BB12_8 Depth=1
	leaq	-2580(%rbp,%rax), %r13
	testl	%ebx, %ebx
	js	LBB12_19
LBB12_20:                               ##   in Loop: Header=BB12_8 Depth=1
	leaq	-2576(%rbp,%rax), %r14
	cmpl	%esi, %r9d
	jl	LBB12_21
LBB12_22:                               ##   in Loop: Header=BB12_8 Depth=1
	leaq	-2572(%rbp,%rax), %r15
	cmpl	%edx, %r8d
	jl	LBB12_23
LBB12_24:                               ##   in Loop: Header=BB12_8 Depth=1
	cmpl	%esi, %r11d
	jge	LBB12_85
LBB12_25:                               ##   in Loop: Header=BB12_8 Depth=1
	cmpl	%edx, %ebx
	jge	LBB12_85
## %bb.26:                              ##   in Loop: Header=BB12_8 Depth=1
	movq	-5480(%rbp), %rdx       ## 8-byte Reload
	movslq	192(%rdx), %rcx
	cmpl	176(%rdx), %ecx
	jge	LBB12_27
## %bb.64:                              ##   in Loop: Header=BB12_8 Depth=1
	leaq	-2736(%rbp,%rax), %rax
	movq	%rdx, %rdi
	movq	184(%rdx), %rdx
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
	shrl	$29, %esi
	addl	%eax, %esi
	sarl	$3, %esi
	movl	%ecx, %edi
	sarl	$31, %edi
	shrl	$29, %edi
	addl	%ecx, %edi
	sarl	$3, %edi
	movq	-5432(%rbp), %rax       ## 8-byte Reload
	movl	(%rax), %eax
	cltd
	idivl	%esi
	movl	%eax, %r8d
	movl	(%r13), %eax
	cltd
	idivl	%edi
	movl	%eax, %ecx
	movl	(%r14), %eax
	leal	-1(%rsi,%rax), %eax
	cltd
	idivl	%esi
	movl	%eax, %r9d
	movl	(%r15), %eax
	leal	-1(%rdi,%rax), %eax
	cltd
	idivl	%edi
	cmpl	%eax, %ecx
	jge	LBB12_85
## %bb.65:                              ##   in Loop: Header=BB12_8 Depth=1
	cmpl	%r9d, %r8d
	jge	LBB12_85
## %bb.66:                              ##   in Loop: Header=BB12_8 Depth=1
	movslq	%r8d, %rdx
	movslq	%ecx, %rdi
	movslq	%r9d, %rsi
	cltq
	movq	%rax, -5464(%rbp)       ## 8-byte Spill
	movq	-5728(%rbp), %rax       ## 8-byte Reload
	leaq	(%rax,%rdx,8), %rax
	movq	%rax, -5504(%rbp)       ## 8-byte Spill
	movl	%ecx, %ebx
	shll	$3, %ebx
	movq	-5632(%rbp), %rax       ## 8-byte Reload
	leaq	(%rax,%rdx,4), %rax
	movq	%rax, -5456(%rbp)       ## 8-byte Spill
	leal	(%r8,%rcx,8), %eax
	subq	%rdx, %rsi
	.p2align	4, 0x90
LBB12_67:                               ##   Parent Loop BB12_8 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB12_68 Depth 3
	movq	%rdi, -5520(%rbp)       ## 8-byte Spill
	movl	%ebx, -5536(%rbp)       ## 4-byte Spill
	movslq	%ebx, %rcx
	movq	-5504(%rbp), %rdx       ## 8-byte Reload
	leaq	(%rdx,%rcx,8), %rdx
	movq	%rdx, -5448(%rbp)       ## 8-byte Spill
	movq	-5456(%rbp), %rdx       ## 8-byte Reload
	leaq	(%rdx,%rcx,4), %r10
	xorl	%r9d, %r9d
	movq	-5480(%rbp), %rdx       ## 8-byte Reload
	.p2align	4, 0x90
LBB12_68:                               ##   Parent Loop BB12_8 Depth=1
                                        ##     Parent Loop BB12_67 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	leal	(%rax,%r9), %edi
	movl	(%rdx), %ecx
	movl	4(%rdx), %ebx
	movl	%ecx, %r11d
	sarl	$31, %r11d
	shrl	$29, %r11d
	addl	%ecx, %r11d
	sarl	$3, %r11d
	movl	%edi, %r12d
	sarl	$31, %r12d
	shrl	$29, %r12d
	addl	%edi, %r12d
	movl	%r12d, %ecx
	andl	$-8, %ecx
	subl	%ecx, %edi
	imull	%r11d, %edi
	sarl	$3, %r12d
	movl	%ebx, %r8d
	sarl	$31, %r8d
	shrl	$29, %r8d
	addl	%ebx, %r8d
	sarl	$3, %r8d
	vcvtsi2ssl	%edi, %xmm7, %xmm0
	imull	%r8d, %r12d
	vcvtsi2ssl	%r12d, %xmm7, %xmm3
	addl	%edi, %r11d
	vcvtsi2ssl	%r11d, %xmm7, %xmm4
	movq	-5432(%rbp), %rcx       ## 8-byte Reload
	vcvtsi2ssl	(%rcx), %xmm7, %xmm1
	addl	%r12d, %r8d
	vucomiss	%xmm1, %xmm0
	vmovaps	%xmm0, %xmm5
	ja	LBB12_71
## %bb.69:                              ##   in Loop: Header=BB12_68 Depth=3
	vucomiss	%xmm4, %xmm1
	vmovaps	%xmm1, %xmm5
	jbe	LBB12_71
## %bb.70:                              ##   in Loop: Header=BB12_68 Depth=3
	vmovaps	%xmm4, %xmm5
LBB12_71:                               ##   in Loop: Header=BB12_68 Depth=3
	vcvtsi2ssl	%r8d, %xmm7, %xmm2
	vcvtsi2ssl	(%r13), %xmm7, %xmm6
	vucomiss	%xmm6, %xmm3
	vmovaps	%xmm3, %xmm1
	ja	LBB12_74
## %bb.72:                              ##   in Loop: Header=BB12_68 Depth=3
	vucomiss	%xmm2, %xmm6
	vmovaps	%xmm6, %xmm1
	jbe	LBB12_74
## %bb.73:                              ##   in Loop: Header=BB12_68 Depth=3
	vmovaps	%xmm2, %xmm1
LBB12_74:                               ##   in Loop: Header=BB12_68 Depth=3
	vcvtsi2ssl	(%r14), %xmm7, %xmm6
	vucomiss	%xmm6, %xmm0
	ja	LBB12_77
## %bb.75:                              ##   in Loop: Header=BB12_68 Depth=3
	vucomiss	%xmm4, %xmm6
	vmovaps	%xmm6, %xmm0
	jbe	LBB12_77
## %bb.76:                              ##   in Loop: Header=BB12_68 Depth=3
	vmovaps	%xmm4, %xmm0
LBB12_77:                               ##   in Loop: Header=BB12_68 Depth=3
	vcvttss2si	%xmm5, %ebx
	vcvtsi2ssl	(%r15), %xmm7, %xmm4
	vcvttss2si	%xmm0, %ecx
	vucomiss	%xmm4, %xmm3
	ja	LBB12_80
## %bb.78:                              ##   in Loop: Header=BB12_68 Depth=3
	vucomiss	%xmm2, %xmm4
	vmovaps	%xmm4, %xmm3
	jbe	LBB12_80
## %bb.79:                              ##   in Loop: Header=BB12_68 Depth=3
	vmovaps	%xmm2, %xmm3
LBB12_80:                               ##   in Loop: Header=BB12_68 Depth=3
	cmpl	%ecx, %ebx
	jge	LBB12_83
## %bb.81:                              ##   in Loop: Header=BB12_68 Depth=3
	vcvttss2si	%xmm3, %ecx
	vcvttss2si	%xmm1, %edi
	cmpl	%ecx, %edi
	jge	LBB12_83
## %bb.82:                              ##   in Loop: Header=BB12_68 Depth=3
	movl	192(%rdx), %ecx
	decl	%ecx
	movq	-5448(%rbp), %rdx       ## 8-byte Reload
	movq	(%rdx,%r9,8), %rdi
	movslq	(%r10,%r9,4), %rbx
	leal	1(%rbx), %edx
	movl	%edx, (%r10,%r9,4)
	movq	-5480(%rbp), %rdx       ## 8-byte Reload
	movl	%ecx, (%rdi,%rbx,4)
LBB12_83:                               ##   in Loop: Header=BB12_68 Depth=3
	incq	%r9
	cmpq	%r9, %rsi
	jne	LBB12_68
## %bb.84:                              ##   in Loop: Header=BB12_67 Depth=2
	movq	-5520(%rbp), %rdi       ## 8-byte Reload
	incq	%rdi
	movl	-5536(%rbp), %ebx       ## 4-byte Reload
	addl	$8, %ebx
	addq	$8, %rax
	cmpq	-5464(%rbp), %rdi       ## 8-byte Folded Reload
	jne	LBB12_67
	jmp	LBB12_85
	.p2align	4, 0x90
LBB12_17:                               ##   in Loop: Header=BB12_8 Depth=1
	movq	-5432(%rbp), %rcx       ## 8-byte Reload
	movl	$0, (%rcx)
	xorl	%r11d, %r11d
	leaq	-2580(%rbp,%rax), %r13
	testl	%ebx, %ebx
	jns	LBB12_20
LBB12_19:                               ##   in Loop: Header=BB12_8 Depth=1
	movl	$0, (%r13)
	xorl	%ebx, %ebx
	leaq	-2576(%rbp,%rax), %r14
	cmpl	%esi, %r9d
	jge	LBB12_22
LBB12_21:                               ##   in Loop: Header=BB12_8 Depth=1
	movl	%r9d, (%r14)
	movl	%r9d, %esi
	leaq	-2572(%rbp,%rax), %r15
	cmpl	%edx, %r8d
	jge	LBB12_24
LBB12_23:                               ##   in Loop: Header=BB12_8 Depth=1
	movl	%r8d, (%r15)
	movl	%r8d, %edx
	cmpl	%esi, %r11d
	jl	LBB12_25
	.p2align	4, 0x90
LBB12_85:                               ##   in Loop: Header=BB12_8 Depth=1
	movq	-5552(%rbp), %rax       ## 8-byte Reload
	incq	%rax
	cmpq	-5648(%rbp), %rax       ## 8-byte Folded Reload
	movq	-5480(%rbp), %rdi       ## 8-byte Reload
	jl	LBB12_8
LBB12_62:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB12_88
## %bb.63:
	addq	$5880, %rsp             ## imm = 0x16F8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	vzeroupper
	retq
LBB12_88:
	vzeroupper
	callq	___stack_chk_fail
LBB12_27:
	leaq	L___func__._Z13push_triangleP14Render_ContextP8Triangle(%rip), %rdi
	leaq	L_.str.5(%rip), %rsi
	leaq	L_.str.8(%rip), %rcx
	movl	$265, %edx              ## imm = 0x109
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
	xorl	%eax, %eax
	testb	$1, %r14b
	sete	%cl
	cmpl	$0, (%rbx)
	je	LBB13_9
## %bb.12:                              ##   in Loop: Header=BB13_8 Depth=1
	testb	$1, %r14b
	movabsq	$4575657221408423936, %rax ## imm = 0x3F80000000000000
	movl	$1065353216, %ecx       ## imm = 0x3F800000
	cmoveq	%rcx, %rax
	vmovq	%rax, %xmm0
	vpshufd	$68, %xmm0, %xmm0       ## xmm0 = xmm0[0,1,0,1]
	vpor	LCPI13_4(%rip), %xmm0, %xmm1
	jmp	LBB13_13
	.p2align	4, 0x90
LBB13_9:                                ##   in Loop: Header=BB13_8 Depth=1
	movb	%cl, %al
	vmovd	%eax, %xmm0
	vpshufd	$68, %xmm0, %xmm0       ## xmm0 = xmm0[0,1,0,1]
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
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function _Z9push_lineP14Render_Context2v3S1_S1_
LCPI14_0:
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
LCPI14_2:
	.long	1065353216              ## float 1
	.long	1065353216              ## float 1
	.space	4
	.space	4
LCPI14_3:
	.long	1056964608              ## float 0.5
	.long	1056964608              ## float 0.5
	.space	4
	.space	4
LCPI14_8:
	.long	2147483647              ## float NaN
	.long	2147483647              ## float NaN
	.long	2147483647              ## float NaN
	.long	2147483647              ## float NaN
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI14_1:
	.long	3212836864              ## float -1
LCPI14_4:
	.long	1132396544              ## float 255
LCPI14_5:
	.long	1056964608              ## float 0.5
LCPI14_6:
	.long	925353388               ## float 9.99999974E-6
LCPI14_7:
	.long	1065353216              ## float 1
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
	vmovaps	%xmm4, -112(%rbp)       ## 16-byte Spill
	vmovss	%xmm3, -56(%rbp)        ## 4-byte Spill
	vmovss	112(%rdi), %xmm5        ## xmm5 = mem[0],zero,zero,zero
	vmovss	%xmm5, -48(%rbp)        ## 4-byte Spill
	vmovss	116(%rdi), %xmm4        ## xmm4 = mem[0],zero,zero,zero
	vmovss	%xmm4, -64(%rbp)        ## 4-byte Spill
	vmovss	120(%rdi), %xmm3        ## xmm3 = mem[0],zero,zero,zero
	vmovss	%xmm3, -68(%rbp)        ## 4-byte Spill
	vmovsd	64(%rdi), %xmm14        ## xmm14 = mem[0],zero
	vmovss	72(%rdi), %xmm12        ## xmm12 = mem[0],zero,zero,zero
	vsubss	%xmm14, %xmm0, %xmm7
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vmovshdup	%xmm14, %xmm13  ## xmm13 = xmm14[1,1,3,3]
	vsubss	%xmm13, %xmm0, %xmm0
	vsubss	%xmm12, %xmm1, %xmm1
	vmulss	%xmm7, %xmm5, %xmm11
	vxorps	%xmm15, %xmm15, %xmm15
	vaddss	%xmm15, %xmm11, %xmm11
	vmulss	%xmm0, %xmm4, %xmm6
	vaddss	%xmm11, %xmm6, %xmm11
	vmulss	%xmm1, %xmm3, %xmm6
	vaddss	%xmm11, %xmm6, %xmm6
	vmovss	124(%rdi), %xmm11       ## xmm11 = mem[0],zero,zero,zero
	vmulss	%xmm7, %xmm11, %xmm5
	vaddss	%xmm15, %xmm5, %xmm5
	vmovss	128(%rdi), %xmm4        ## xmm4 = mem[0],zero,zero,zero
	vmulss	%xmm0, %xmm4, %xmm8
	vaddss	%xmm5, %xmm8, %xmm5
	vmovss	132(%rdi), %xmm8        ## xmm8 = mem[0],zero,zero,zero
	vmulss	%xmm1, %xmm8, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vinsertps	$16, %xmm3, %xmm6, %xmm3 ## xmm3 = xmm6[0],xmm3[0],xmm6[2,3]
	vmovaps	%xmm3, -96(%rbp)        ## 16-byte Spill
	vmovss	136(%rdi), %xmm9        ## xmm9 = mem[0],zero,zero,zero
	vmulss	%xmm7, %xmm9, %xmm6
	vaddss	%xmm15, %xmm6, %xmm6
	vmovss	140(%rdi), %xmm7        ## xmm7 = mem[0],zero,zero,zero
	vmulss	%xmm0, %xmm7, %xmm0
	vaddss	%xmm6, %xmm0, %xmm0
	vmovss	144(%rdi), %xmm5        ## xmm5 = mem[0],zero,zero,zero
	vmulss	%xmm1, %xmm5, %xmm1
	vaddss	%xmm0, %xmm1, %xmm10
	vsubss	%xmm14, %xmm2, %xmm1
	vmovshdup	%xmm2, %xmm2    ## xmm2 = xmm2[1,1,3,3]
	vsubss	%xmm13, %xmm2, %xmm2
	vmovss	-56(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vsubss	%xmm12, %xmm0, %xmm0
	vmulss	-48(%rbp), %xmm1, %xmm6 ## 4-byte Folded Reload
	vaddss	%xmm15, %xmm6, %xmm6
	vmulss	-64(%rbp), %xmm2, %xmm3 ## 4-byte Folded Reload
	vaddss	%xmm6, %xmm3, %xmm3
	vmulss	-68(%rbp), %xmm0, %xmm6 ## 4-byte Folded Reload
	vaddss	%xmm3, %xmm6, %xmm3
	vmulss	%xmm1, %xmm11, %xmm6
	vmovaps	%xmm10, %xmm11
	vaddss	%xmm15, %xmm6, %xmm6
	vmulss	%xmm2, %xmm4, %xmm4
	vaddss	%xmm6, %xmm4, %xmm4
	vmulss	%xmm0, %xmm8, %xmm6
	vaddss	%xmm4, %xmm6, %xmm4
	vinsertps	$16, %xmm4, %xmm3, %xmm6 ## xmm6 = xmm3[0],xmm4[0],xmm3[2,3]
	vmulss	%xmm1, %xmm9, %xmm1
	vaddss	%xmm15, %xmm1, %xmm1
	vmulss	%xmm2, %xmm7, %xmm2
	vaddss	%xmm1, %xmm2, %xmm1
	vmulss	%xmm0, %xmm5, %xmm0
	vaddss	%xmm1, %xmm0, %xmm7
	vmovss	56(%rdi), %xmm1         ## xmm1 = mem[0],zero,zero,zero
	vxorps	LCPI14_0(%rip), %xmm1, %xmm3
	vucomiss	%xmm3, %xmm10
	jbe	LBB14_1
## %bb.2:
	vmovaps	%xmm7, %xmm10
	vmovaps	%xmm6, %xmm2
	vmovaps	-96(%rbp), %xmm6        ## 16-byte Reload
	vucomiss	%xmm3, %xmm10
	ja	LBB14_38
LBB14_4:
	vucomiss	%xmm3, %xmm11
	jbe	LBB14_6
## %bb.5:
	vsubss	%xmm11, %xmm3, %xmm0
	vsubss	%xmm10, %xmm11, %xmm3
	vdivss	%xmm3, %xmm0, %xmm0
	vsubps	%xmm2, %xmm6, %xmm4
	vmovsldup	%xmm0, %xmm5    ## xmm5 = xmm0[0,0,2,2]
	vmulps	%xmm4, %xmm5, %xmm4
	vmulss	%xmm0, %xmm3, %xmm0
	vaddps	%xmm4, %xmm6, %xmm6
	vaddss	%xmm0, %xmm11, %xmm11
LBB14_6:
	vmovshdup	%xmm2, %xmm3    ## xmm3 = xmm2[1,1,3,3]
	movl	(%rdi), %eax
	movl	4(%rdi), %r14d
	vxorps	%xmm14, %xmm14, %xmm14
	vcvtsi2ssl	%eax, %xmm14, %xmm0
	vxorps	%xmm14, %xmm14, %xmm14
	vcvtsi2ssl	%r14d, %xmm14, %xmm4
	vmovsldup	%xmm1, %xmm1    ## xmm1 = xmm1[0,0,2,2]
	vinsertps	$16, %xmm2, %xmm6, %xmm2 ## xmm2 = xmm6[0],xmm2[0],xmm6[2,3]
	vmulps	%xmm2, %xmm1, %xmm2
	vinsertps	$16, %xmm10, %xmm11, %xmm5 ## xmm5 = xmm11[0],xmm10[0],xmm11[2,3]
	vdivps	%xmm5, %xmm2, %xmm2
	vmovshdup	%xmm6, %xmm6    ## xmm6 = xmm6[1,1,3,3]
	vinsertps	$16, %xmm3, %xmm6, %xmm3 ## xmm3 = xmm6[0],xmm3[0],xmm6[2,3]
	vmulps	%xmm3, %xmm1, %xmm1
	vdivps	%xmm5, %xmm1, %xmm1
	vaddps	%xmm2, %xmm2, %xmm2
	vbroadcastss	152(%rdi), %xmm3
	vdivps	%xmm3, %xmm2, %xmm2
	vaddps	%xmm1, %xmm1, %xmm1
	vbroadcastss	156(%rdi), %xmm3
	vdivps	%xmm3, %xmm1, %xmm1
	vmovaps	LCPI14_2(%rip), %xmm3   ## xmm3 = <1.0E+0,1.0E+0,u,u>
	vsubps	%xmm2, %xmm3, %xmm2
	vmovaps	LCPI14_3(%rip), %xmm5   ## xmm5 = <5.0E-1,5.0E-1,u,u>
	vmulps	%xmm5, %xmm2, %xmm2
	vmovsldup	%xmm0, %xmm0    ## xmm0 = xmm0[0,0,2,2]
	vmulps	%xmm0, %xmm2, %xmm6
	vaddps	%xmm3, %xmm1, %xmm0
	vmulps	%xmm5, %xmm0, %xmm0
	vmovsldup	%xmm4, %xmm1    ## xmm1 = xmm4[0,0,2,2]
	vmulps	%xmm1, %xmm0, %xmm2
	vmovshdup	%xmm6, %xmm7    ## xmm7 = xmm6[1,1,3,3]
	vsubss	%xmm7, %xmm6, %xmm12
	vmovshdup	%xmm2, %xmm1    ## xmm1 = xmm2[1,1,3,3]
	vsubss	%xmm1, %xmm2, %xmm9
	vmulss	%xmm12, %xmm12, %xmm0
	vmulss	%xmm9, %xmm9, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm8
	vxorps	%xmm3, %xmm3, %xmm3
	vmovss	LCPI14_6(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm8, %xmm0
	jae	LBB14_8
## %bb.7:
	vmovss	LCPI14_7(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vdivss	%xmm8, %xmm0, %xmm0
	vmulss	%xmm0, %xmm9, %xmm3
	vxorps	LCPI14_0(%rip), %xmm3, %xmm3
	vmulss	%xmm0, %xmm12, %xmm0
	vunpcklps	%xmm0, %xmm3, %xmm3 ## xmm3 = xmm3[0],xmm0[0],xmm3[1],xmm0[1]
LBB14_8:
	vcvttss2si	%xmm7, %edx
	vcvttss2si	%xmm1, %r9d
	vcvttss2si	%xmm6, %ebx
	vcvttss2si	%xmm2, %r12d
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
	vcvtsi2ssl	%esi, %xmm14, %xmm0
	movl	%r12d, %esi
	subl	%r10d, %esi
	vcvtsi2ssl	%esi, %xmm13, %xmm2
	movl	%ebx, %esi
	subl	%r8d, %esi
	vcvtsi2ssl	%esi, %xmm13, %xmm4
	vdivss	%xmm2, %xmm0, %xmm0
	vcvtsi2ssl	%r8d, %xmm13, %xmm2
	vmulss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vcvttss2si	%xmm0, %r8d
	movl	%ecx, %r10d
	jmp	LBB14_20
LBB14_1:
	vmovaps	%xmm11, %xmm10
	vmovaps	-96(%rbp), %xmm2        ## 16-byte Reload
	vmovaps	%xmm7, %xmm11
	vucomiss	%xmm3, %xmm10
	jbe	LBB14_4
	jmp	LBB14_38
LBB14_9:
	testl	%ebx, %ebx
	js	LBB14_38
## %bb.10:
	vxorps	%xmm14, %xmm14, %xmm14
	vcvtsi2ssl	%edx, %xmm14, %xmm0
	movl	%ebx, %ecx
	subl	%edx, %ecx
	vxorps	%xmm14, %xmm14, %xmm14
	vcvtsi2ssl	%ecx, %xmm14, %xmm2
	vdivss	%xmm2, %xmm0, %xmm0
	movl	%r12d, %ecx
	subl	%r9d, %ecx
	vcvtsi2ssl	%ecx, %xmm14, %xmm2
	vmulss	%xmm2, %xmm0, %xmm0
	vcvtsi2ssl	%r9d, %xmm14, %xmm2
	vsubss	%xmm0, %xmm2, %xmm0
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
	vxorps	%xmm14, %xmm14, %xmm14
	vcvtsi2ssl	%esi, %xmm14, %xmm0
	movl	%ebx, %esi
	subl	%r8d, %esi
	vcvtsi2ssl	%esi, %xmm14, %xmm2
	movl	%r12d, %esi
	subl	%r10d, %esi
	vcvtsi2ssl	%esi, %xmm13, %xmm4
	vdivss	%xmm2, %xmm0, %xmm0
	vcvtsi2ssl	%r10d, %xmm13, %xmm2
	vmulss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vcvttss2si	%xmm0, %r10d
	movl	%ecx, %r8d
	testl	%r10d, %r10d
	jns	LBB14_17
LBB14_15:
	testl	%r12d, %r12d
	js	LBB14_38
## %bb.16:
	vxorps	%xmm14, %xmm14, %xmm14
	vcvtsi2ssl	%r10d, %xmm14, %xmm0
	movl	%r12d, %ecx
	subl	%r10d, %ecx
	vcvtsi2ssl	%ecx, %xmm14, %xmm2
	vdivss	%xmm2, %xmm0, %xmm0
	movl	%ebx, %ecx
	subl	%r8d, %ecx
	vcvtsi2ssl	%ecx, %xmm13, %xmm2
	vmulss	%xmm2, %xmm0, %xmm0
	vcvtsi2ssl	%r8d, %xmm13, %xmm2
	vsubss	%xmm0, %xmm2, %xmm0
	vcvttss2si	%xmm0, %r8d
	xorl	%r10d, %r10d
	cmpl	%r14d, %r10d
	jge	LBB14_18
LBB14_20:
	vmovss	LCPI14_4(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vmovaps	-112(%rbp), %xmm4       ## 16-byte Reload
	vmovshdup	%xmm4, %xmm2    ## xmm2 = xmm4[1,1,3,3]
	vmulss	%xmm0, %xmm4, %xmm4
	vmovss	LCPI14_5(%rip), %xmm5   ## xmm5 = mem[0],zero,zero,zero
	vmulss	%xmm0, %xmm2, %xmm2
	vaddss	%xmm5, %xmm4, %xmm4
	vaddss	%xmm5, %xmm2, %xmm2
	vcvttss2si	%xmm4, %rcx
	vcvttss2si	%xmm2, %rsi
	vmulss	-60(%rbp), %xmm0, %xmm0 ## 4-byte Folded Reload
	vaddss	%xmm5, %xmm0, %xmm0
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
	vucomiss	%xmm2, %xmm12
	vdivss	%xmm11, %xmm0, %xmm11
	seta	%cl
	xorl	%esi, %esi
	vucomiss	%xmm2, %xmm9
	seta	%sil
	leal	-1(%rcx,%rcx), %ecx
	movq	%rcx, -56(%rbp)         ## 8-byte Spill
	leal	-1(%rsi,%rsi), %ecx
	movq	%rcx, -48(%rbp)         ## 8-byte Spill
	vmovshdup	%xmm3, %xmm6    ## xmm6 = xmm3[1,1,3,3]
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
	vmovss	LCPI14_7(%rip), %xmm9   ## xmm9 = mem[0],zero,zero,zero
	vmovaps	LCPI14_8(%rip), %xmm12  ## xmm12 = [NaN,NaN,NaN,NaN]
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
	vcvtsi2ssl	%edx, %xmm13, %xmm2
	vcvtsi2ssl	%r9d, %xmm13, %xmm5
	vsubss	%xmm7, %xmm2, %xmm4
	vsubss	%xmm1, %xmm5, %xmm5
	vmulss	%xmm4, %xmm4, %xmm2
	vmulss	%xmm5, %xmm5, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
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
	vcvtsi2ssl	%eax, %xmm13, %xmm0
	vsubss	%xmm7, %xmm0, %xmm0
	vmulss	%xmm0, %xmm3, %xmm0
	vmulss	%xmm5, %xmm6, %xmm2
	vaddss	%xmm0, %xmm2, %xmm0
	movq	-48(%rbp), %rcx         ## 8-byte Reload
	leal	(%r9,%rcx), %esi
	vcvtsi2ssl	%esi, %xmm1, %xmm2
	vandps	%xmm12, %xmm0, %xmm0
	vsubss	%xmm1, %xmm2, %xmm2
	vmulss	%xmm4, %xmm3, %xmm4
	vmulss	%xmm2, %xmm6, %xmm2
	vaddss	%xmm2, %xmm4, %xmm2
	vandps	%xmm12, %xmm2, %xmm2
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
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function _Z11push_sphereP14Render_Context2v3fS1_
LCPI15_0:
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
	.long	2147483648              ## float -0
LCPI15_12:
	.long	1037368819              ## float 0.103999995
	.long	1042536203              ## float 0.160000011
	.space	4
	.space	4
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI15_1:
	.long	3221225472              ## float -2
LCPI15_2:
	.long	1065353216              ## float 1
LCPI15_3:
	.long	1056964608              ## float 0.5
LCPI15_4:
	.long	3212836864              ## float -1
LCPI15_5:
	.long	3204448256              ## float -0.5
LCPI15_6:
	.long	3229614080              ## float -4
LCPI15_7:
	.long	925353388               ## float 9.99999974E-6
LCPI15_10:
	.long	1101004800              ## float 20
LCPI15_11:
	.long	1061997773              ## float 0.800000011
LCPI15_13:
	.long	1043878379              ## float 0.179999992
LCPI15_14:
	.long	1132396544              ## float 255
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI15_8:
	.quad	4607182418800017408     ## double 1
LCPI15_9:
	.quad	4621819117588971520     ## double 10
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z11push_sphereP14Render_Context2v3fS1_
	.p2align	4, 0x90
__Z11push_sphereP14Render_Context2v3fS1_: ## @_Z11push_sphereP14Render_Context2v3fS1_
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
	subq	$264, %rsp              ## imm = 0x108
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	vmovss	%xmm4, -208(%rbp)       ## 4-byte Spill
	vmovaps	%xmm3, -304(%rbp)       ## 16-byte Spill
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -48(%rbp)
	vmovss	136(%rdi), %xmm9        ## xmm9 = mem[0],zero,zero,zero
	vmovss	140(%rdi), %xmm10       ## xmm10 = mem[0],zero,zero,zero
	vmovss	144(%rdi), %xmm11       ## xmm11 = mem[0],zero,zero,zero
	vmovsd	64(%rdi), %xmm6         ## xmm6 = mem[0],zero
	vmovss	72(%rdi), %xmm5         ## xmm5 = mem[0],zero,zero,zero
	vsubss	%xmm6, %xmm0, %xmm8
	vmovshdup	%xmm0, %xmm3    ## xmm3 = xmm0[1,1,3,3]
	vmovshdup	%xmm6, %xmm4    ## xmm4 = xmm6[1,1,3,3]
	vsubss	%xmm4, %xmm3, %xmm12
	vsubss	%xmm5, %xmm1, %xmm1
	vxorps	%xmm13, %xmm13, %xmm13
	vmulss	%xmm8, %xmm9, %xmm3
	vaddss	%xmm13, %xmm3, %xmm3
	vmulss	%xmm12, %xmm10, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vmulss	%xmm1, %xmm11, %xmm3
	vaddss	%xmm0, %xmm3, %xmm14
	vsubss	%xmm2, %xmm14, %xmm0
	vmovss	56(%rdi), %xmm3         ## xmm3 = mem[0],zero,zero,zero
	vxorps	LCPI15_0(%rip), %xmm3, %xmm7
	vucomiss	%xmm7, %xmm0
	ja	LBB15_29
## %bb.1:
	movq	%rdi, %rbx
	vmovaps	%xmm4, -240(%rbp)       ## 16-byte Spill
	vmovaps	%xmm6, -272(%rbp)       ## 16-byte Spill
	vmovss	%xmm5, -256(%rbp)       ## 4-byte Spill
	vmovss	%xmm9, -180(%rbp)       ## 4-byte Spill
	vmovss	%xmm10, -184(%rbp)      ## 4-byte Spill
	vmovss	%xmm11, -188(%rbp)      ## 4-byte Spill
	vmovss	112(%rdi), %xmm0        ## xmm0 = mem[0],zero,zero,zero
	vmovss	116(%rdi), %xmm7        ## xmm7 = mem[0],zero,zero,zero
	vmovss	120(%rdi), %xmm5        ## xmm5 = mem[0],zero,zero,zero
	vmovss	124(%rdi), %xmm6        ## xmm6 = mem[0],zero,zero,zero
	vmovss	128(%rdi), %xmm4        ## xmm4 = mem[0],zero,zero,zero
	vmovss	132(%rdi), %xmm9        ## xmm9 = mem[0],zero,zero,zero
	vmovss	%xmm0, -148(%rbp)       ## 4-byte Spill
	vmulss	%xmm8, %xmm0, %xmm0
	vaddss	%xmm13, %xmm0, %xmm0
	vmovss	%xmm7, -152(%rbp)       ## 4-byte Spill
	vmulss	%xmm12, %xmm7, %xmm7
	vaddss	%xmm0, %xmm7, %xmm0
	vmovss	%xmm5, -172(%rbp)       ## 4-byte Spill
	vmulss	%xmm1, %xmm5, %xmm7
	vaddss	%xmm0, %xmm7, %xmm11
	vmovss	%xmm6, -156(%rbp)       ## 4-byte Spill
	vmulss	%xmm8, %xmm6, %xmm0
	vaddss	%xmm13, %xmm0, %xmm0
	vmovss	%xmm4, -164(%rbp)       ## 4-byte Spill
	vmulss	%xmm12, %xmm4, %xmm4
	vaddss	%xmm0, %xmm4, %xmm0
	vmovss	%xmm9, -168(%rbp)       ## 4-byte Spill
	vmulss	%xmm1, %xmm9, %xmm4
	vaddss	%xmm0, %xmm4, %xmm0
	vmovss	%xmm0, -160(%rbp)       ## 4-byte Spill
	movl	(%rdi), %r9d
	movl	4(%rdi), %r8d
	vmovss	152(%rdi), %xmm15       ## xmm15 = mem[0],zero,zero,zero
	vcvtsi2ssl	%r9d, %xmm2, %xmm8
	vmovss	156(%rdi), %xmm9        ## xmm9 = mem[0],zero,zero,zero
	vcvtsi2ssl	%r8d, %xmm2, %xmm10
	leaq	-136(%rbp), %rdx
	xorl	%eax, %eax
	vmovss	LCPI15_3(%rip), %xmm12  ## xmm12 = mem[0],zero,zero,zero
	movl	%r9d, %edi
	movl	%r8d, %r11d
	xorl	%ecx, %ecx
	xorl	%r10d, %r10d
	vmovss	%xmm14, -176(%rbp)      ## 4-byte Spill
	.p2align	4, 0x90
LBB15_2:                                ## =>This Inner Loop Header: Depth=1
	movl	%eax, %esi
	andl	$1, %esi
	leal	-1(%rsi,%rsi), %esi
	vcvtsi2ssl	%esi, %xmm2, %xmm0
	movl	%eax, %esi
	andl	$2, %esi
	decl	%esi
	vmulss	%xmm13, %xmm0, %xmm5
	vcvtsi2ssl	%esi, %xmm2, %xmm6
	movl	%eax, %esi
	vmulss	%xmm13, %xmm6, %xmm7
	andl	$4, %esi
	shrl	%esi
	decl	%esi
	vaddss	%xmm0, %xmm7, %xmm0
	vcvtsi2ssl	%esi, %xmm2, %xmm14
	vaddss	%xmm6, %xmm5, %xmm6
	vaddss	%xmm7, %xmm5, %xmm5
	vmulss	%xmm13, %xmm14, %xmm7
	vaddss	%xmm0, %xmm7, %xmm0
	vaddss	%xmm6, %xmm7, %xmm6
	vaddss	%xmm14, %xmm5, %xmm5
	vmovss	-176(%rbp), %xmm14      ## 4-byte Reload
                                        ## xmm14 = mem[0],zero,zero,zero
	vmulss	%xmm2, %xmm0, %xmm0
	vmulss	%xmm2, %xmm6, %xmm6
	vmulss	%xmm2, %xmm5, %xmm5
	vaddss	%xmm0, %xmm11, %xmm0
	vaddss	-160(%rbp), %xmm6, %xmm6 ## 4-byte Folded Reload
	vmulss	%xmm0, %xmm3, %xmm0
	vaddss	%xmm5, %xmm14, %xmm5
	vdivss	%xmm5, %xmm0, %xmm0
	vmulss	LCPI15_1(%rip), %xmm0, %xmm0
	vmulss	%xmm6, %xmm3, %xmm6
	vdivss	%xmm15, %xmm0, %xmm0
	vdivss	%xmm5, %xmm6, %xmm6
	vaddss	%xmm6, %xmm6, %xmm6
	vdivss	%xmm9, %xmm6, %xmm6
	vmovss	LCPI15_2(%rip), %xmm1   ## xmm1 = mem[0],zero,zero,zero
	vaddss	%xmm1, %xmm0, %xmm0
	vmulss	%xmm12, %xmm0, %xmm0
	vaddss	%xmm1, %xmm6, %xmm6
	vmulss	%xmm12, %xmm6, %xmm6
	vmulss	%xmm8, %xmm0, %xmm0
	vmulss	%xmm10, %xmm6, %xmm6
	vinsertps	$16, %xmm6, %xmm0, %xmm6 ## xmm6 = xmm0[0],xmm6[0],xmm0[2,3]
	vmovss	LCPI15_4(%rip), %xmm1   ## xmm1 = mem[0],zero,zero,zero
	vdivss	%xmm5, %xmm1, %xmm5
	vmovlps	%xmm6, -8(%rdx)
	vmovss	%xmm5, (%rdx)
	vcvtsi2sdl	%edi, %xmm2, %xmm5
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vcmpunordsd	%xmm5, %xmm5, %xmm6
	vcvtsi2sdl	%r11d, %xmm2, %xmm7
	vminsd	%xmm5, %xmm0, %xmm5
	vcvtsi2sdl	%ecx, %xmm2, %xmm4
	vblendvpd	%xmm6, %xmm0, %xmm5, %xmm5
	vmovss	-4(%rdx), %xmm6         ## xmm6 = mem[0],zero,zero,zero
	vmaxsd	%xmm4, %xmm0, %xmm1
	vcmpunordsd	%xmm4, %xmm4, %xmm4
	vcvtss2sd	%xmm6, %xmm6, %xmm6
	vblendvpd	%xmm4, %xmm0, %xmm1, %xmm0
	vcmpunordsd	%xmm7, %xmm7, %xmm1
	vminsd	%xmm7, %xmm6, %xmm4
	vcvtsi2sdl	%r10d, %xmm2, %xmm7
	vblendvpd	%xmm1, %xmm6, %xmm4, %xmm1
	vmaxsd	%xmm7, %xmm6, %xmm4
	vcmpunordsd	%xmm7, %xmm7, %xmm7
	vblendvpd	%xmm7, %xmm6, %xmm4, %xmm4
	vcvttsd2si	%xmm5, %edi
	vcvttsd2si	%xmm1, %r11d
	vcvttsd2si	%xmm0, %ecx
	vcvttsd2si	%xmm4, %r10d
	incq	%rax
	addq	$12, %rdx
	cmpq	$8, %rax
	jne	LBB15_2
## %bb.3:
	xorl	%r14d, %r14d
	testl	%edi, %edi
	cmovsl	%r14d, %edi
	testl	%r11d, %r11d
	cmovnsl	%r11d, %r14d
	cmpl	%ecx, %r9d
	cmovlel	%r9d, %ecx
	cmpl	%r10d, %r8d
	cmovlel	%r8d, %r10d
	cmpl	%r10d, %r14d
	vmovss	-160(%rbp), %xmm10      ## 4-byte Reload
                                        ## xmm10 = mem[0],zero,zero,zero
	vmovss	LCPI15_2(%rip), %xmm13  ## xmm13 = mem[0],zero,zero,zero
	jge	LBB15_29
## %bb.4:
	vmovsd	1000(%rbx), %xmm0       ## xmm0 = mem[0],zero
	vmovss	1008(%rbx), %xmm1       ## xmm1 = mem[0],zero,zero,zero
	vsubss	-272(%rbp), %xmm0, %xmm3 ## 16-byte Folded Reload
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vsubss	-240(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vsubss	-256(%rbp), %xmm1, %xmm1 ## 4-byte Folded Reload
	vmulss	-148(%rbp), %xmm3, %xmm4 ## 4-byte Folded Reload
	vxorps	%xmm7, %xmm7, %xmm7
	vaddss	%xmm7, %xmm4, %xmm4
	vmulss	-152(%rbp), %xmm0, %xmm5 ## 4-byte Folded Reload
	vaddss	%xmm4, %xmm5, %xmm4
	vmulss	-172(%rbp), %xmm1, %xmm5 ## 4-byte Folded Reload
	vaddss	%xmm4, %xmm5, %xmm4
	vmovss	%xmm4, -172(%rbp)       ## 4-byte Spill
	vmulss	-156(%rbp), %xmm3, %xmm4 ## 4-byte Folded Reload
	vaddss	%xmm7, %xmm4, %xmm4
	vmulss	-164(%rbp), %xmm0, %xmm5 ## 4-byte Folded Reload
	vaddss	%xmm4, %xmm5, %xmm4
	vmulss	-168(%rbp), %xmm1, %xmm5 ## 4-byte Folded Reload
	vaddss	%xmm4, %xmm5, %xmm4
	vmovss	%xmm4, -168(%rbp)       ## 4-byte Spill
	vmulss	-180(%rbp), %xmm3, %xmm3 ## 4-byte Folded Reload
	vaddss	%xmm7, %xmm3, %xmm3
	vmulss	-184(%rbp), %xmm0, %xmm0 ## 4-byte Folded Reload
	vaddss	%xmm3, %xmm0, %xmm0
	vmulss	-188(%rbp), %xmm1, %xmm1 ## 4-byte Folded Reload
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, -164(%rbp)       ## 4-byte Spill
	vsubss	%xmm11, %xmm7, %xmm8
	vsubss	%xmm10, %xmm7, %xmm9
	vsubss	%xmm14, %xmm7, %xmm15
	vmulss	%xmm8, %xmm8, %xmm0
	vmulss	%xmm9, %xmm9, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmulss	%xmm15, %xmm15, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vmulss	%xmm2, %xmm2, %xmm1
	vsubss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, -180(%rbp)       ## 4-byte Spill
	leal	(,%rdi,4), %eax
	movq	%rax, -280(%rbp)        ## 8-byte Spill
	vmovss	%xmm11, -192(%rbp)      ## 4-byte Spill
	movl	%r10d, -196(%rbp)       ## 4-byte Spill
	movl	%ecx, -200(%rbp)        ## 4-byte Spill
	movq	%rdi, -216(%rbp)        ## 8-byte Spill
	vmovss	%xmm8, -156(%rbp)       ## 4-byte Spill
	vmovss	%xmm9, -152(%rbp)       ## 4-byte Spill
	vmovss	%xmm15, -148(%rbp)      ## 4-byte Spill
	.p2align	4, 0x90
LBB15_5:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB15_7 Depth 2
                                        ##       Child Loop BB15_8 Depth 3
	cmpl	%ecx, %edi
	jge	LBB15_28
## %bb.6:                               ##   in Loop: Header=BB15_5 Depth=1
	vcvtsi2ssl	%r14d, %xmm13, %xmm0
	vmovss	%xmm0, -184(%rbp)       ## 4-byte Spill
	movq	-280(%rbp), %rdi        ## 8-byte Reload
	movq	-216(%rbp), %rax        ## 8-byte Reload
                                        ## kill: def $eax killed $eax killed $rax
	.p2align	4, 0x90
LBB15_7:                                ##   Parent Loop BB15_5 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB15_8 Depth 3
	movl	%eax, -204(%rbp)        ## 4-byte Spill
	vcvtsi2ssl	%eax, %xmm13, %xmm0
	vmovss	%xmm0, -188(%rbp)       ## 4-byte Spill
	xorl	%r15d, %r15d
	movq	%rdi, -240(%rbp)        ## 8-byte Spill
	.p2align	4, 0x90
LBB15_8:                                ##   Parent Loop BB15_5 Depth=1
                                        ##     Parent Loop BB15_7 Depth=2
                                        ## =>    This Inner Loop Header: Depth=3
	vmovsd	968(%rbx,%r15,8), %xmm0 ## xmm0 = mem[0],zero
	vaddss	-188(%rbp), %xmm0, %xmm1 ## 4-byte Folded Reload
	vcvtsi2ssl	(%rbx), %xmm13, %xmm2
	vdivss	%xmm2, %xmm1, %xmm1
	vmovss	LCPI15_5(%rip), %xmm2   ## xmm2 = mem[0],zero,zero,zero
	vmovaps	%xmm2, %xmm3
	vaddss	%xmm2, %xmm1, %xmm1
	vmulss	152(%rbx), %xmm1, %xmm1
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vcvtsi2ssl	4(%rbx), %xmm13, %xmm2
	vaddss	-184(%rbp), %xmm0, %xmm0 ## 4-byte Folded Reload
	vdivss	%xmm2, %xmm0, %xmm0
	vsubss	%xmm0, %xmm13, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vmulss	156(%rbx), %xmm0, %xmm2
	vmovss	56(%rbx), %xmm0         ## xmm0 = mem[0],zero,zero,zero
	vmulss	%xmm1, %xmm1, %xmm3
	vmulss	%xmm2, %xmm2, %xmm4
	vaddss	%xmm4, %xmm3, %xmm3
	vmulss	%xmm0, %xmm0, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vmulss	%xmm1, %xmm8, %xmm4
	vmulss	%xmm2, %xmm9, %xmm5
	vaddss	%xmm5, %xmm4, %xmm4
	vmulss	%xmm0, %xmm15, %xmm5
	vsubss	%xmm5, %xmm4, %xmm4
	vaddss	%xmm4, %xmm4, %xmm4
	vmulss	%xmm4, %xmm4, %xmm5
	vmulss	LCPI15_6(%rip), %xmm3, %xmm6
	vmulss	-180(%rbp), %xmm6, %xmm6 ## 4-byte Folded Reload
	vaddss	%xmm6, %xmm5, %xmm5
	vucomiss	%xmm7, %xmm5
	jb	LBB15_26
## %bb.9:                               ##   in Loop: Header=BB15_8 Depth=3
	vsqrtss	%xmm5, %xmm5, %xmm5
	vxorps	LCPI15_0(%rip), %xmm4, %xmm6
	vaddss	%xmm3, %xmm3, %xmm3
	vinsertps	$16, %xmm6, %xmm5, %xmm6 ## xmm6 = xmm5[0],xmm6[0],xmm5[2,3]
	vinsertps	$16, %xmm5, %xmm4, %xmm4 ## xmm4 = xmm4[0],xmm5[0],xmm4[2,3]
	vsubps	%xmm4, %xmm6, %xmm4
	vmovsldup	%xmm3, %xmm3    ## xmm3 = xmm3[0,0,2,2]
	vdivps	%xmm3, %xmm4, %xmm4
	vmovshdup	%xmm4, %xmm5    ## xmm5 = xmm4[1,1,3,3]
	vcmpnless	%xmm5, %xmm7, %xmm3
	vmovss	LCPI15_4(%rip), %xmm6   ## xmm6 = mem[0],zero,zero,zero
	vblendvps	%xmm3, %xmm6, %xmm5, %xmm3
	vucomiss	%xmm7, %xmm4
	jb	LBB15_11
## %bb.10:                              ##   in Loop: Header=BB15_8 Depth=3
	vcmpltss	%xmm5, %xmm4, %xmm6
	vblendvps	%xmm6, %xmm4, %xmm3, %xmm3
	vcmpltss	%xmm7, %xmm5, %xmm5
	vblendvps	%xmm5, %xmm4, %xmm3, %xmm3
LBB15_11:                               ##   in Loop: Header=BB15_8 Depth=3
	vucomiss	%xmm3, %xmm7
	ja	LBB15_26
## %bb.12:                              ##   in Loop: Header=BB15_8 Depth=3
	vmovaps	LCPI15_0(%rip), %xmm4   ## xmm4 = [-0.0E+0,-0.0E+0,-0.0E+0,-0.0E+0]
	vxorps	%xmm4, %xmm0, %xmm0
	vmulss	%xmm0, %xmm3, %xmm0
	vaddss	%xmm7, %xmm0, %xmm12
	vxorps	%xmm4, %xmm12, %xmm0
	movl	24(%rbx), %eax
	imull	%r14d, %eax
	leal	(%rdi,%r15), %ecx
	addl	%eax, %ecx
	movq	48(%rbx), %r12
	movslq	%ecx, %r13
	vmovss	(%r12,%r13,4), %xmm4    ## xmm4 = mem[0],zero,zero,zero
	vucomiss	%xmm0, %xmm4
	jbe	LBB15_26
## %bb.13:                              ##   in Loop: Header=BB15_8 Depth=3
	vmovaps	%xmm0, -256(%rbp)       ## 16-byte Spill
	vmulss	%xmm3, %xmm1, %xmm1
	vmulss	%xmm3, %xmm2, %xmm2
	vaddss	%xmm7, %xmm1, %xmm8
	vaddss	%xmm7, %xmm2, %xmm9
	vsubss	%xmm11, %xmm8, %xmm3
	vsubss	%xmm10, %xmm9, %xmm6
	vsubss	%xmm14, %xmm12, %xmm1
	vmulss	%xmm3, %xmm3, %xmm2
	vmulss	%xmm6, %xmm6, %xmm4
	vaddss	%xmm4, %xmm2, %xmm2
	vmulss	%xmm1, %xmm1, %xmm4
	vaddss	%xmm2, %xmm4, %xmm2
	vsqrtss	%xmm2, %xmm2, %xmm0
	vxorps	%xmm10, %xmm10, %xmm10
	vxorps	%xmm2, %xmm2, %xmm2
	vmovss	LCPI15_7(%rip), %xmm4   ## xmm4 = mem[0],zero,zero,zero
	vucomiss	%xmm0, %xmm4
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm11, %xmm11, %xmm11
	jae	LBB15_15
## %bb.14:                              ##   in Loop: Header=BB15_8 Depth=3
	vdivss	%xmm0, %xmm13, %xmm5
	vmulss	%xmm5, %xmm3, %xmm3
	vmulss	%xmm5, %xmm6, %xmm4
	vinsertps	$16, %xmm4, %xmm3, %xmm4 ## xmm4 = xmm3[0],xmm4[0],xmm3[2,3]
	vmulss	%xmm5, %xmm1, %xmm11
LBB15_15:                               ##   in Loop: Header=BB15_8 Depth=3
	vmovss	-172(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vsubss	%xmm8, %xmm0, %xmm6
	vmovss	-168(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vsubss	%xmm9, %xmm0, %xmm14
	vmovss	-164(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vsubss	%xmm12, %xmm0, %xmm1
	vmulss	%xmm6, %xmm6, %xmm3
	vmulss	%xmm14, %xmm14, %xmm0
	vaddss	%xmm0, %xmm3, %xmm0
	vmulss	%xmm1, %xmm1, %xmm3
	vaddss	%xmm0, %xmm3, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm3
	vmovss	LCPI15_7(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm3, %xmm0
	jae	LBB15_17
## %bb.16:                              ##   in Loop: Header=BB15_8 Depth=3
	vdivss	%xmm3, %xmm13, %xmm0
	vmulss	%xmm0, %xmm6, %xmm10
	vmulss	%xmm0, %xmm14, %xmm2
	vinsertps	$16, %xmm2, %xmm10, %xmm2 ## xmm2 = xmm10[0],xmm2[0],xmm10[2,3]
	vmulss	%xmm0, %xmm1, %xmm10
LBB15_17:                               ##   in Loop: Header=BB15_8 Depth=3
	vmulss	%xmm2, %xmm4, %xmm0
	vmovshdup	%xmm2, %xmm2    ## xmm2 = xmm2[1,1,3,3]
	vmovshdup	%xmm4, %xmm5    ## xmm5 = xmm4[1,1,3,3]
	vmulss	%xmm2, %xmm5, %xmm2
	vaddss	%xmm2, %xmm0, %xmm0
	vmulss	%xmm10, %xmm11, %xmm2
	vaddss	%xmm0, %xmm2, %xmm0
	vxorps	%xmm15, %xmm15, %xmm15
	vmaxss	%xmm0, %xmm15, %xmm0
	vmulss	%xmm3, %xmm3, %xmm3
	vcvtss2sd	%xmm3, %xmm3, %xmm3
	vmovsd	LCPI15_8(%rip), %xmm2   ## xmm2 = mem[0],zero
	vdivsd	%xmm3, %xmm2, %xmm3
	vmulsd	LCPI15_9(%rip), %xmm3, %xmm3
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm3, %xmm10
	vmulss	%xmm4, %xmm6, %xmm0
	vmulss	%xmm5, %xmm14, %xmm3
	vaddss	%xmm3, %xmm0, %xmm0
	vmulss	%xmm11, %xmm1, %xmm3
	vaddss	%xmm0, %xmm3, %xmm0
	vaddss	%xmm0, %xmm0, %xmm0
	vmulss	%xmm0, %xmm4, %xmm3
	vmulss	%xmm0, %xmm5, %xmm4
	vmulss	%xmm0, %xmm11, %xmm0
	vsubss	%xmm3, %xmm6, %xmm3
	vsubss	%xmm4, %xmm14, %xmm2
	vsubss	%xmm0, %xmm1, %xmm6
	vmulss	%xmm3, %xmm3, %xmm0
	vmulss	%xmm2, %xmm2, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmulss	%xmm6, %xmm6, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm1
	vxorps	%xmm11, %xmm11, %xmm11
	vmovss	LCPI15_7(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	jae	LBB15_19
## %bb.18:                              ##   in Loop: Header=BB15_8 Depth=3
	vdivss	%xmm1, %xmm13, %xmm0
	vmulss	%xmm0, %xmm3, %xmm1
	vmulss	%xmm0, %xmm2, %xmm3
	vinsertps	$16, %xmm3, %xmm1, %xmm4 ## xmm4 = xmm1[0],xmm3[0],xmm1[2,3]
	vmulss	%xmm0, %xmm6, %xmm5
LBB15_19:                               ##   in Loop: Header=BB15_8 Depth=3
	vcvtsd2ss	%xmm10, %xmm10, %xmm0
	vmovss	%xmm0, -272(%rbp)       ## 4-byte Spill
	vmulss	%xmm8, %xmm8, %xmm0
	vmulss	%xmm9, %xmm9, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmulss	%xmm12, %xmm12, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm1
	vmovss	LCPI15_7(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vucomiss	%xmm1, %xmm0
	jae	LBB15_21
## %bb.20:                              ##   in Loop: Header=BB15_8 Depth=3
	vdivss	%xmm1, %xmm13, %xmm0
	vmulss	%xmm0, %xmm8, %xmm1
	vmulss	%xmm0, %xmm9, %xmm2
	vinsertps	$16, %xmm2, %xmm1, %xmm11 ## xmm11 = xmm1[0],xmm2[0],xmm1[2,3]
	vmulss	%xmm0, %xmm12, %xmm15
LBB15_21:                               ##   in Loop: Header=BB15_8 Depth=3
	vmulss	%xmm15, %xmm5, %xmm0
	vmulps	%xmm11, %xmm4, %xmm1
	vmovshdup	%xmm1, %xmm2    ## xmm2 = xmm1[1,1,3,3]
	vaddss	%xmm2, %xmm1, %xmm1
	vaddss	%xmm1, %xmm0, %xmm0
	vmaxss	%xmm0, %xmm7, %xmm0
	vmovss	LCPI15_10(%rip), %xmm1  ## xmm1 = mem[0],zero,zero,zero
	callq	_powf
	vmovss	LCPI15_2(%rip), %xmm13  ## xmm13 = mem[0],zero,zero,zero
	vmovss	-272(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	vmulss	LCPI15_11(%rip), %xmm1, %xmm1
	vmovsldup	%xmm1, %xmm2    ## xmm2 = xmm1[0,0,2,2]
	vaddps	LCPI15_12(%rip), %xmm2, %xmm2
	vaddss	LCPI15_13(%rip), %xmm1, %xmm1
	vmovsldup	%xmm0, %xmm3    ## xmm3 = xmm0[0,0,2,2]
	vaddps	%xmm3, %xmm2, %xmm2
	vaddss	%xmm0, %xmm1, %xmm1
	vmulps	-304(%rbp), %xmm2, %xmm0 ## 16-byte Folded Reload
	vucomiss	%xmm13, %xmm0
	jbe	LBB15_23
## %bb.22:                              ##   in Loop: Header=BB15_8 Depth=3
	vblendps	$1, %xmm13, %xmm0, %xmm0 ## xmm0 = xmm13[0],xmm0[1,2,3]
LBB15_23:                               ##   in Loop: Header=BB15_8 Depth=3
	vmovss	-176(%rbp), %xmm14      ## 4-byte Reload
                                        ## xmm14 = mem[0],zero,zero,zero
	vmovss	-192(%rbp), %xmm11      ## 4-byte Reload
                                        ## xmm11 = mem[0],zero,zero,zero
	vmovss	-160(%rbp), %xmm10      ## 4-byte Reload
                                        ## xmm10 = mem[0],zero,zero,zero
	vmovss	LCPI15_3(%rip), %xmm3   ## xmm3 = mem[0],zero,zero,zero
	vmovss	-156(%rbp), %xmm8       ## 4-byte Reload
                                        ## xmm8 = mem[0],zero,zero,zero
	vmovss	-152(%rbp), %xmm9       ## 4-byte Reload
                                        ## xmm9 = mem[0],zero,zero,zero
	vmovss	-148(%rbp), %xmm15      ## 4-byte Reload
                                        ## xmm15 = mem[0],zero,zero,zero
	movq	-240(%rbp), %rdi        ## 8-byte Reload
	vmovaps	-256(%rbp), %xmm4       ## 16-byte Reload
	vmulss	-208(%rbp), %xmm1, %xmm1 ## 4-byte Folded Reload
	vmovshdup	%xmm0, %xmm2    ## xmm2 = xmm0[1,1,3,3]
	vucomiss	%xmm13, %xmm2
	vxorps	%xmm7, %xmm7, %xmm7
	jbe	LBB15_25
## %bb.24:                              ##   in Loop: Header=BB15_8 Depth=3
	vinsertps	$16, %xmm13, %xmm0, %xmm0 ## xmm0 = xmm0[0],xmm13[0],xmm0[2,3]
LBB15_25:                               ##   in Loop: Header=BB15_8 Depth=3
	vminss	%xmm1, %xmm13, %xmm1
	vmovss	%xmm4, (%r12,%r13,4)
	vmovss	LCPI15_14(%rip), %xmm2  ## xmm2 = mem[0],zero,zero,zero
	vmovaps	%xmm2, %xmm4
	vmulss	%xmm2, %xmm0, %xmm2
	vaddss	%xmm3, %xmm2, %xmm2
	vcvttss2si	%xmm2, %rax
	shll	$24, %eax
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vmulss	%xmm4, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vcvttss2si	%xmm0, %rcx
	shll	$16, %ecx
	vmulss	%xmm4, %xmm1, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vcvttss2si	%xmm0, %rdx
	shll	$8, %edx
	orl	%eax, %edx
	orl	%ecx, %edx
	movq	16(%rbx), %rax
	movl	%edx, (%rax,%r13,4)
	.p2align	4, 0x90
LBB15_26:                               ##   in Loop: Header=BB15_8 Depth=3
	incq	%r15
	cmpq	$4, %r15
	jne	LBB15_8
## %bb.27:                              ##   in Loop: Header=BB15_7 Depth=2
	movl	-204(%rbp), %eax        ## 4-byte Reload
	incl	%eax
	addq	$4, %rdi
	movl	-200(%rbp), %ecx        ## 4-byte Reload
	cmpl	%ecx, %eax
	jl	LBB15_7
LBB15_28:                               ##   in Loop: Header=BB15_5 Depth=1
	incl	%r14d
	movl	-196(%rbp), %r10d       ## 4-byte Reload
	cmpl	%r10d, %r14d
	movq	-216(%rbp), %rdi        ## 8-byte Reload
	jl	LBB15_5
LBB15_29:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB15_31
## %bb.30:
	addq	$264, %rsp              ## imm = 0x108
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB15_31:
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function _Z9push_meshP14Render_ContextP4Mesh2v3S3_S3_S3_
LCPI16_0:
	.long	2147483648              ## float -0
LCPI16_1:
	.long	925353388               ## float 9.99999974E-6
LCPI16_2:
	.long	1065353216              ## float 1
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z9push_meshP14Render_ContextP4Mesh2v3S3_S3_S3_
	.p2align	4, 0x90
__Z9push_meshP14Render_ContextP4Mesh2v3S3_S3_S3_: ## @_Z9push_meshP14Render_ContextP4Mesh2v3S3_S3_S3_
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
	subq	$440, %rsp              ## imm = 0x1B8
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	vmovss	%xmm7, -100(%rbp)       ## 4-byte Spill
	vmovaps	%xmm6, -480(%rbp)       ## 16-byte Spill
	vmovaps	%xmm4, -128(%rbp)       ## 16-byte Spill
	vmovss	%xmm3, -96(%rbp)        ## 4-byte Spill
	vmovaps	%xmm2, -240(%rbp)       ## 16-byte Spill
	vmovss	%xmm1, -80(%rbp)        ## 4-byte Spill
	vmovaps	%xmm0, -224(%rbp)       ## 16-byte Spill
	movq	%rsi, %r12
	movq	%rdi, %r14
	vmovaps	%xmm5, %xmm0
	callq	___sincosf_stret
	vmovaps	%xmm0, -160(%rbp)       ## 16-byte Spill
	vmovshdup	-128(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,1,3,3]
	callq	___sincosf_stret
	vmovaps	%xmm0, -144(%rbp)       ## 16-byte Spill
	vmovaps	-128(%rbp), %xmm0       ## 16-byte Reload
	callq	___sincosf_stret
	cmpl	$0, 8(%r12)
	jle	LBB16_9
## %bb.1:
	vmovaps	%xmm0, %xmm14
	vmovaps	-144(%rbp), %xmm8       ## 16-byte Reload
	vmovshdup	%xmm8, %xmm7    ## xmm7 = xmm8[1,1,3,3]
	vmovshdup	%xmm0, %xmm1    ## xmm1 = xmm0[1,1,3,3]
	vxorps	%xmm2, %xmm2, %xmm2
	vmulss	%xmm2, %xmm8, %xmm4
	vmulss	%xmm2, %xmm7, %xmm0
	vaddss	%xmm2, %xmm0, %xmm5
	vmovss	%xmm5, -208(%rbp)       ## 4-byte Spill
	vmovaps	%xmm0, %xmm12
	vmovaps	%xmm0, -192(%rbp)       ## 16-byte Spill
	vmulss	%xmm2, %xmm1, %xmm0
	vaddss	%xmm5, %xmm0, %xmm6
	vmulss	%xmm14, %xmm8, %xmm3
	vaddss	%xmm6, %xmm3, %xmm9
	vmovss	LCPI16_0(%rip), %xmm3   ## xmm3 = mem[0],zero,zero,zero
	vmulss	%xmm3, %xmm14, %xmm10
	vaddss	%xmm5, %xmm10, %xmm3
	vmulss	%xmm1, %xmm8, %xmm6
	vaddss	%xmm3, %xmm6, %xmm3
	vmovss	%xmm3, -84(%rbp)        ## 4-byte Spill
	vsubss	%xmm4, %xmm2, %xmm3
	vmovaps	%xmm4, %xmm11
	vmovss	%xmm4, -68(%rbp)        ## 4-byte Spill
	vaddss	%xmm3, %xmm0, %xmm6
	vmovaps	%xmm0, %xmm4
	vmovss	%xmm0, -64(%rbp)        ## 4-byte Spill
	vmovaps	%xmm7, %xmm0
	vmulss	%xmm14, %xmm7, %xmm7
	vaddss	%xmm6, %xmm7, %xmm5
	vmovss	%xmm5, -48(%rbp)        ## 4-byte Spill
	vaddss	%xmm3, %xmm10, %xmm6
	vmovaps	%xmm1, -464(%rbp)       ## 16-byte Spill
	vmulss	%xmm1, %xmm0, %xmm3
	vmovaps	%xmm0, %xmm10
	vmovaps	%xmm0, -448(%rbp)       ## 16-byte Spill
	vaddss	%xmm6, %xmm3, %xmm0
	vmovss	%xmm0, -44(%rbp)        ## 4-byte Spill
	vaddss	%xmm2, %xmm1, %xmm1
	vmulss	%xmm2, %xmm14, %xmm0
	vmovss	%xmm0, -60(%rbp)        ## 4-byte Spill
	vaddss	%xmm0, %xmm1, %xmm13
	vmovaps	-160(%rbp), %xmm15      ## 16-byte Reload
	vmovshdup	%xmm15, %xmm0   ## xmm0 = xmm15[1,1,3,3]
	vmulss	%xmm9, %xmm0, %xmm1
	vmovaps	%xmm9, %xmm5
	vaddss	%xmm2, %xmm1, %xmm1
	vmulss	%xmm15, %xmm13, %xmm6
	vsubss	%xmm6, %xmm1, %xmm1
	vmovss	%xmm1, -56(%rbp)        ## 4-byte Spill
	vsubss	%xmm14, %xmm2, %xmm1
	vaddss	%xmm4, %xmm1, %xmm9
	vmovss	-84(%rbp), %xmm4        ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	vmulss	%xmm4, %xmm0, %xmm6
	vaddss	%xmm2, %xmm6, %xmm6
	vmulss	%xmm15, %xmm9, %xmm7
	vsubss	%xmm7, %xmm6, %xmm1
	vmovss	%xmm1, -52(%rbp)        ## 4-byte Spill
	vaddss	%xmm2, %xmm10, %xmm6
	vaddss	%xmm11, %xmm6, %xmm1
	vsubss	%xmm8, %xmm2, %xmm6
	vaddss	%xmm12, %xmm6, %xmm10
	vmulss	%xmm1, %xmm0, %xmm6
	vaddss	%xmm2, %xmm6, %xmm6
	vmulss	%xmm2, %xmm15, %xmm3
	vmovss	%xmm3, -176(%rbp)       ## 4-byte Spill
	vsubss	%xmm3, %xmm6, %xmm6
	vmulss	%xmm2, %xmm10, %xmm11
	vaddss	%xmm6, %xmm11, %xmm3
	vmovss	%xmm3, -128(%rbp)       ## 4-byte Spill
	vmulss	%xmm1, %xmm15, %xmm6
	vaddss	%xmm2, %xmm6, %xmm3
	vmovss	LCPI16_0(%rip), %xmm6   ## xmm6 = mem[0],zero,zero,zero
	vmulps	%xmm6, %xmm15, %xmm12
	vmovshdup	%xmm12, %xmm6   ## xmm6 = xmm12[1,1,3,3]
	vmovaps	%xmm6, -432(%rbp)       ## 16-byte Spill
	vaddss	%xmm3, %xmm6, %xmm3
	vaddss	%xmm3, %xmm11, %xmm3
	vmovss	%xmm3, -76(%rbp)        ## 4-byte Spill
	vmovaps	%xmm5, %xmm11
	vmulss	%xmm5, %xmm15, %xmm3
	vaddss	%xmm2, %xmm3, %xmm3
	vmulss	%xmm13, %xmm0, %xmm7
	vaddss	%xmm3, %xmm7, %xmm3
	vmovss	-48(%rbp), %xmm5        ## 4-byte Reload
                                        ## xmm5 = mem[0],zero,zero,zero
	vmulss	%xmm2, %xmm5, %xmm7
	vaddss	-56(%rbp), %xmm7, %xmm6 ## 4-byte Folded Reload
	vmovss	%xmm6, -56(%rbp)        ## 4-byte Spill
	vaddss	%xmm3, %xmm7, %xmm3
	vmovss	%xmm3, -92(%rbp)        ## 4-byte Spill
	vmovaps	%xmm4, %xmm7
	vmulss	%xmm4, %xmm15, %xmm3
	vaddss	%xmm2, %xmm3, %xmm3
	vmulss	%xmm9, %xmm0, %xmm0
	vaddss	%xmm3, %xmm0, %xmm0
	vmovss	-44(%rbp), %xmm4        ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	vmulss	%xmm2, %xmm4, %xmm3
	vaddss	-52(%rbp), %xmm3, %xmm6 ## 4-byte Folded Reload
	vmovss	%xmm6, -88(%rbp)        ## 4-byte Spill
	vaddss	%xmm0, %xmm3, %xmm0
	vmovss	%xmm0, -52(%rbp)        ## 4-byte Spill
	vmulss	%xmm2, %xmm1, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm0, %xmm10, %xmm0
	vmovss	%xmm0, -72(%rbp)        ## 4-byte Spill
	vmulss	%xmm2, %xmm11, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vmulss	%xmm2, %xmm13, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vaddss	%xmm0, %xmm5, %xmm0
	vmovss	%xmm0, -48(%rbp)        ## 4-byte Spill
	vmulss	%xmm2, %xmm7, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	vmulss	%xmm2, %xmm9, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vaddss	%xmm0, %xmm4, %xmm0
	vmovss	%xmm0, -44(%rbp)        ## 4-byte Spill
	vxorps	%xmm1, %xmm1, %xmm1
	vpermilps	$225, %xmm15, %xmm0 ## xmm0 = xmm15[1,0,2,3]
	vmovaps	-448(%rbp), %xmm10      ## 16-byte Reload
	vmulps	%xmm0, %xmm10, %xmm3
	vaddps	%xmm1, %xmm3, %xmm3
	vaddps	%xmm3, %xmm12, %xmm3
	vmovss	LCPI16_0(%rip), %xmm11  ## xmm11 = mem[0],zero,zero,zero
	vmulss	%xmm11, %xmm8, %xmm4
	vmovsldup	%xmm4, %xmm4    ## xmm4 = xmm4[0,0,2,2]
	vaddps	%xmm3, %xmm4, %xmm3
	vaddss	-432(%rbp), %xmm2, %xmm4 ## 16-byte Folded Reload
	vaddss	-176(%rbp), %xmm2, %xmm5 ## 4-byte Folded Reload
	vblendps	$2, %xmm15, %xmm4, %xmm4 ## xmm4 = xmm4[0],xmm15[1],xmm4[2,3]
	vinsertps	$16, %xmm5, %xmm15, %xmm5 ## xmm5 = xmm15[0],xmm5[0],xmm15[2,3]
	vaddsubps	%xmm5, %xmm4, %xmm4
	vmovss	-208(%rbp), %xmm5       ## 4-byte Reload
                                        ## xmm5 = mem[0],zero,zero,zero
	vsubss	%xmm8, %xmm5, %xmm9
	vmovsldup	%xmm8, %xmm7    ## xmm7 = xmm8[0,0,2,2]
	vmulps	%xmm0, %xmm7, %xmm0
	vaddps	%xmm1, %xmm0, %xmm0
	vaddps	%xmm0, %xmm12, %xmm0
	vmovsldup	-192(%rbp), %xmm6 ## 16-byte Folded Reload
                                        ## xmm6 = mem[0,0,2,2]
	vaddps	%xmm0, %xmm6, %xmm0
	vaddss	-68(%rbp), %xmm2, %xmm6 ## 4-byte Folded Reload
	vaddss	%xmm6, %xmm10, %xmm8
	vaddps	%xmm1, %xmm4, %xmm4
	vaddps	%xmm1, %xmm3, %xmm7
	vmulps	%xmm1, %xmm4, %xmm5
	vaddps	%xmm5, %xmm7, %xmm5
	vmulps	%xmm1, %xmm0, %xmm7
	vaddps	%xmm5, %xmm7, %xmm5
	vmovaps	%xmm5, -208(%rbp)       ## 16-byte Spill
	vaddss	%xmm2, %xmm9, %xmm5
	vmulss	%xmm2, %xmm8, %xmm7
	vaddss	%xmm7, %xmm5, %xmm5
	vmovss	%xmm5, -68(%rbp)        ## 4-byte Spill
	vmulps	%xmm1, %xmm3, %xmm3
	vaddps	%xmm1, %xmm3, %xmm1
	vmovaps	-464(%rbp), %xmm6       ## 16-byte Reload
	vmulps	%xmm4, %xmm6, %xmm3
	vaddps	%xmm1, %xmm3, %xmm3
	vmovsldup	%xmm14, %xmm5   ## xmm5 = xmm14[0,0,2,2]
	vmulps	%xmm0, %xmm5, %xmm5
	vaddps	%xmm3, %xmm5, %xmm3
	vmovaps	%xmm3, -192(%rbp)       ## 16-byte Spill
	vmulss	%xmm2, %xmm9, %xmm3
	vaddss	%xmm2, %xmm3, %xmm2
	vpermilps	$0, %xmm11, %xmm3 ## xmm3 = xmm11[0,0,0,0]
	vxorps	%xmm3, %xmm14, %xmm3
	vaddss	-64(%rbp), %xmm2, %xmm5 ## 4-byte Folded Reload
	vmulss	%xmm8, %xmm14, %xmm7
	vaddss	%xmm5, %xmm7, %xmm5
	vmovss	%xmm5, -64(%rbp)        ## 4-byte Spill
	vpermilps	$160, %xmm3, %xmm3 ## xmm3 = xmm3[0,0,2,2]
	vmulps	%xmm3, %xmm4, %xmm3
	vaddps	%xmm1, %xmm3, %xmm1
	vmovaps	%xmm6, %xmm3
	vmulps	%xmm0, %xmm6, %xmm0
	vaddps	%xmm1, %xmm0, %xmm0
	vmovaps	%xmm0, -176(%rbp)       ## 16-byte Spill
	vsubss	-60(%rbp), %xmm2, %xmm0 ## 4-byte Folded Reload
	vmulss	%xmm8, %xmm6, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, -60(%rbp)        ## 4-byte Spill
	vmovshdup	-240(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,1,3,3]
	vmovaps	%xmm0, -160(%rbp)       ## 16-byte Spill
	xorl	%ebx, %ebx
	leaq	-416(%rbp), %r15
	xorl	%r13d, %r13d
	vmovshdup	-224(%rbp), %xmm0 ## 16-byte Folded Reload
                                        ## xmm0 = mem[1,1,3,3]
	vmovaps	%xmm0, -144(%rbp)       ## 16-byte Spill
	.p2align	4, 0x90
LBB16_2:                                ## =>This Inner Loop Header: Depth=1
	movq	(%r12), %rax
	vmovups	(%rax,%rbx), %ymm0
	vmovups	32(%rax,%rbx), %ymm1
	vmovups	64(%rax,%rbx), %ymm2
	vmovups	96(%rax,%rbx), %ymm3
	vmovups	%ymm0, -416(%rbp)
	movq	160(%rax,%rbx), %rcx
	movq	%rcx, -256(%rbp)
	vmovups	128(%rax,%rbx), %ymm0
	vmovups	%ymm0, -288(%rbp)
	vmovups	%ymm3, -320(%rbp)
	vmovups	%ymm2, -352(%rbp)
	vmovups	%ymm1, -384(%rbp)
	vmovsd	-416(%rbp), %xmm1       ## xmm1 = mem[0],zero
	vmovss	-408(%rbp), %xmm2       ## xmm2 = mem[0],zero,zero,zero
	vmovss	-128(%rbp), %xmm13      ## 4-byte Reload
                                        ## xmm13 = mem[0],zero,zero,zero
	vmulss	%xmm1, %xmm13, %xmm3
	vxorps	%xmm0, %xmm0, %xmm0
	vaddss	%xmm0, %xmm3, %xmm3
	vmovshdup	%xmm1, %xmm4    ## xmm4 = xmm1[1,1,3,3]
	vmulss	-56(%rbp), %xmm4, %xmm5 ## 4-byte Folded Reload
	vaddss	%xmm3, %xmm5, %xmm3
	vmovss	-88(%rbp), %xmm15       ## 4-byte Reload
                                        ## xmm15 = mem[0],zero,zero,zero
	vmulss	%xmm2, %xmm15, %xmm5
	vaddss	%xmm3, %xmm5, %xmm3
	vmovss	-76(%rbp), %xmm11       ## 4-byte Reload
                                        ## xmm11 = mem[0],zero,zero,zero
	vmulss	%xmm1, %xmm11, %xmm5
	vaddss	%xmm0, %xmm5, %xmm5
	vmovss	-92(%rbp), %xmm14       ## 4-byte Reload
                                        ## xmm14 = mem[0],zero,zero,zero
	vmulss	%xmm4, %xmm14, %xmm6
	vaddss	%xmm5, %xmm6, %xmm5
	vmovss	-52(%rbp), %xmm10       ## 4-byte Reload
                                        ## xmm10 = mem[0],zero,zero,zero
	vmulss	%xmm2, %xmm10, %xmm6
	vaddss	%xmm5, %xmm6, %xmm5
	vmulss	-72(%rbp), %xmm1, %xmm1 ## 4-byte Folded Reload
	vaddss	%xmm0, %xmm1, %xmm1
	vmovss	-48(%rbp), %xmm8        ## 4-byte Reload
                                        ## xmm8 = mem[0],zero,zero,zero
	vmulss	%xmm4, %xmm8, %xmm4
	vaddss	%xmm1, %xmm4, %xmm1
	vmulss	-44(%rbp), %xmm2, %xmm2 ## 4-byte Folded Reload
	vaddss	%xmm1, %xmm2, %xmm1
	vmovaps	-240(%rbp), %xmm7       ## 16-byte Reload
	vmulss	%xmm3, %xmm7, %xmm2
	vmulss	-160(%rbp), %xmm5, %xmm3 ## 16-byte Folded Reload
	vmovss	-96(%rbp), %xmm12       ## 4-byte Reload
                                        ## xmm12 = mem[0],zero,zero,zero
	vmulss	%xmm12, %xmm1, %xmm1
	vaddss	-224(%rbp), %xmm2, %xmm2 ## 16-byte Folded Reload
	vmovaps	-144(%rbp), %xmm9       ## 16-byte Reload
	vaddss	%xmm3, %xmm9, %xmm3
	vinsertps	$16, %xmm3, %xmm2, %xmm2 ## xmm2 = xmm2[0],xmm3[0],xmm2[2,3]
	vaddss	-80(%rbp), %xmm1, %xmm1 ## 4-byte Folded Reload
	vmovlps	%xmm2, -416(%rbp)
	vmovss	%xmm1, -408(%rbp)
	vmovsd	-404(%rbp), %xmm1       ## xmm1 = mem[0],zero
	vmovss	-396(%rbp), %xmm2       ## xmm2 = mem[0],zero,zero,zero
	vmulss	%xmm1, %xmm13, %xmm3
	vaddss	%xmm0, %xmm3, %xmm3
	vmovshdup	%xmm1, %xmm4    ## xmm4 = xmm1[1,1,3,3]
	vmovss	-56(%rbp), %xmm13       ## 4-byte Reload
                                        ## xmm13 = mem[0],zero,zero,zero
	vmulss	%xmm4, %xmm13, %xmm5
	vaddss	%xmm3, %xmm5, %xmm3
	vmulss	%xmm2, %xmm15, %xmm5
	vaddss	%xmm3, %xmm5, %xmm3
	vmulss	%xmm1, %xmm11, %xmm5
	vaddss	%xmm0, %xmm5, %xmm5
	vmulss	%xmm4, %xmm14, %xmm6
	vaddss	%xmm5, %xmm6, %xmm5
	vmulss	%xmm2, %xmm10, %xmm6
	vaddss	%xmm5, %xmm6, %xmm5
	vmovss	-72(%rbp), %xmm11       ## 4-byte Reload
                                        ## xmm11 = mem[0],zero,zero,zero
	vmulss	%xmm1, %xmm11, %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	vmulss	%xmm4, %xmm8, %xmm4
	vaddss	%xmm1, %xmm4, %xmm1
	vmovss	-44(%rbp), %xmm8        ## 4-byte Reload
                                        ## xmm8 = mem[0],zero,zero,zero
	vmulss	%xmm2, %xmm8, %xmm2
	vaddss	%xmm1, %xmm2, %xmm1
	vmulss	%xmm3, %xmm7, %xmm2
	vmovaps	-160(%rbp), %xmm7       ## 16-byte Reload
	vmulss	%xmm5, %xmm7, %xmm3
	vmulss	%xmm12, %xmm1, %xmm1
	vmovaps	-224(%rbp), %xmm10      ## 16-byte Reload
	vaddss	%xmm2, %xmm10, %xmm2
	vaddss	%xmm3, %xmm9, %xmm3
	vinsertps	$16, %xmm3, %xmm2, %xmm2 ## xmm2 = xmm2[0],xmm3[0],xmm2[2,3]
	vmovss	-80(%rbp), %xmm9        ## 4-byte Reload
                                        ## xmm9 = mem[0],zero,zero,zero
	vaddss	%xmm9, %xmm1, %xmm1
	vmovlps	%xmm2, -404(%rbp)
	vmovss	%xmm1, -396(%rbp)
	vmovsd	-392(%rbp), %xmm1       ## xmm1 = mem[0],zero
	vmovss	-384(%rbp), %xmm2       ## xmm2 = mem[0],zero,zero,zero
	vmulss	-128(%rbp), %xmm1, %xmm3 ## 4-byte Folded Reload
	vaddss	%xmm0, %xmm3, %xmm3
	vmovshdup	%xmm1, %xmm4    ## xmm4 = xmm1[1,1,3,3]
	vmulss	%xmm4, %xmm13, %xmm5
	vaddss	%xmm3, %xmm5, %xmm3
	vmulss	%xmm2, %xmm15, %xmm5
	vaddss	%xmm3, %xmm5, %xmm3
	vmulss	-76(%rbp), %xmm1, %xmm5 ## 4-byte Folded Reload
	vaddss	%xmm0, %xmm5, %xmm5
	vmulss	%xmm4, %xmm14, %xmm6
	vaddss	%xmm5, %xmm6, %xmm5
	vmulss	-52(%rbp), %xmm2, %xmm6 ## 4-byte Folded Reload
	vaddss	%xmm5, %xmm6, %xmm5
	vmulss	%xmm1, %xmm11, %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	vmulss	-48(%rbp), %xmm4, %xmm4 ## 4-byte Folded Reload
	vaddss	%xmm1, %xmm4, %xmm1
	vmulss	%xmm2, %xmm8, %xmm2
	vaddss	%xmm1, %xmm2, %xmm1
	vmulss	-240(%rbp), %xmm3, %xmm2 ## 16-byte Folded Reload
	vmulss	%xmm5, %xmm7, %xmm3
	vmulss	%xmm12, %xmm1, %xmm1
	vaddss	%xmm2, %xmm10, %xmm2
	vaddss	-144(%rbp), %xmm3, %xmm3 ## 16-byte Folded Reload
	vinsertps	$16, %xmm3, %xmm2, %xmm2 ## xmm2 = xmm2[0],xmm3[0],xmm2[2,3]
	vaddss	%xmm9, %xmm1, %xmm1
	vmovlps	%xmm2, -392(%rbp)
	vmovss	%xmm1, -384(%rbp)
	vmovsd	-380(%rbp), %xmm3       ## xmm3 = mem[0],zero
	vmovss	-372(%rbp), %xmm4       ## xmm4 = mem[0],zero,zero,zero
	vmovshdup	%xmm3, %xmm5    ## xmm5 = xmm3[1,1,3,3]
	vmovsldup	%xmm3, %xmm1    ## xmm1 = xmm3[0,0,2,2]
	vmovaps	-208(%rbp), %xmm7       ## 16-byte Reload
	vmulps	%xmm1, %xmm7, %xmm2
	vxorps	%xmm1, %xmm1, %xmm1
	vaddps	%xmm1, %xmm2, %xmm2
	vmovaps	-192(%rbp), %xmm9       ## 16-byte Reload
	vmulps	%xmm5, %xmm9, %xmm6
	vaddps	%xmm2, %xmm6, %xmm2
	vpermilps	$0, %xmm4, %xmm6 ## xmm6 = xmm4[0,0,0,0]
	vmovaps	-176(%rbp), %xmm11      ## 16-byte Reload
	vmulps	%xmm6, %xmm11, %xmm6
	vaddps	%xmm2, %xmm6, %xmm2
	vmovss	-68(%rbp), %xmm8        ## 4-byte Reload
                                        ## xmm8 = mem[0],zero,zero,zero
	vmulss	%xmm3, %xmm8, %xmm3
	vaddss	%xmm0, %xmm3, %xmm3
	vmovss	-64(%rbp), %xmm10       ## 4-byte Reload
                                        ## xmm10 = mem[0],zero,zero,zero
	vmulss	%xmm5, %xmm10, %xmm5
	vaddss	%xmm3, %xmm5, %xmm3
	vmovss	-60(%rbp), %xmm12       ## 4-byte Reload
                                        ## xmm12 = mem[0],zero,zero,zero
	vmulss	%xmm4, %xmm12, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vmulps	%xmm2, %xmm2, %xmm4
	vmovshdup	%xmm4, %xmm5    ## xmm5 = xmm4[1,1,3,3]
	vaddss	%xmm5, %xmm4, %xmm4
	vmulss	%xmm3, %xmm3, %xmm5
	vaddss	%xmm4, %xmm5, %xmm4
	vsqrtss	%xmm4, %xmm4, %xmm6
	vmovss	LCPI16_1(%rip), %xmm13  ## xmm13 = mem[0],zero,zero,zero
	vucomiss	%xmm6, %xmm13
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	jae	LBB16_4
## %bb.3:                               ##   in Loop: Header=BB16_2 Depth=1
	vmovss	LCPI16_2(%rip), %xmm4   ## xmm4 = mem[0],zero,zero,zero
	vdivss	%xmm6, %xmm4, %xmm5
	vmovsldup	%xmm5, %xmm4    ## xmm4 = xmm5[0,0,2,2]
	vmulps	%xmm4, %xmm2, %xmm4
	vmulss	%xmm5, %xmm3, %xmm5
LBB16_4:                                ##   in Loop: Header=BB16_2 Depth=1
	vmovlps	%xmm4, -380(%rbp)
	vmovss	%xmm5, -372(%rbp)
	vmovsd	-368(%rbp), %xmm3       ## xmm3 = mem[0],zero
	vmovss	-360(%rbp), %xmm4       ## xmm4 = mem[0],zero,zero,zero
	vmovshdup	%xmm3, %xmm5    ## xmm5 = xmm3[1,1,3,3]
	vmovsldup	%xmm3, %xmm2    ## xmm2 = xmm3[0,0,2,2]
	vmulps	%xmm2, %xmm7, %xmm2
	vaddps	%xmm1, %xmm2, %xmm2
	vmulps	%xmm5, %xmm9, %xmm6
	vaddps	%xmm2, %xmm6, %xmm2
	vpermilps	$0, %xmm4, %xmm6 ## xmm6 = xmm4[0,0,0,0]
	vmulps	%xmm6, %xmm11, %xmm6
	vaddps	%xmm2, %xmm6, %xmm2
	vmulss	%xmm3, %xmm8, %xmm3
	vaddss	%xmm0, %xmm3, %xmm3
	vmulss	%xmm5, %xmm10, %xmm5
	vaddss	%xmm3, %xmm5, %xmm3
	vmulss	%xmm4, %xmm12, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vmulps	%xmm2, %xmm2, %xmm4
	vmovshdup	%xmm4, %xmm5    ## xmm5 = xmm4[1,1,3,3]
	vaddss	%xmm5, %xmm4, %xmm4
	vmulss	%xmm3, %xmm3, %xmm5
	vaddss	%xmm4, %xmm5, %xmm4
	vsqrtss	%xmm4, %xmm4, %xmm4
	vucomiss	%xmm4, %xmm13
	jae	LBB16_6
## %bb.5:                               ##   in Loop: Header=BB16_2 Depth=1
	vmovss	LCPI16_2(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vdivss	%xmm4, %xmm0, %xmm0
	vmovsldup	%xmm0, %xmm1    ## xmm1 = xmm0[0,0,2,2]
	vmulps	%xmm1, %xmm2, %xmm1
	vmulss	%xmm0, %xmm3, %xmm0
LBB16_6:                                ##   in Loop: Header=BB16_2 Depth=1
	vmovlps	%xmm1, -368(%rbp)
	vmovss	%xmm0, -360(%rbp)
	vmovsd	-356(%rbp), %xmm1       ## xmm1 = mem[0],zero
	vmovss	-348(%rbp), %xmm3       ## xmm3 = mem[0],zero,zero,zero
	vmovshdup	%xmm1, %xmm4    ## xmm4 = xmm1[1,1,3,3]
	vmovsldup	%xmm1, %xmm0    ## xmm0 = xmm1[0,0,2,2]
	vmulps	%xmm0, %xmm7, %xmm2
	vxorps	%xmm0, %xmm0, %xmm0
	vaddps	%xmm0, %xmm2, %xmm2
	vmulps	%xmm4, %xmm9, %xmm5
	vaddps	%xmm2, %xmm5, %xmm2
	vpermilps	$0, %xmm3, %xmm5 ## xmm5 = xmm3[0,0,0,0]
	vmulps	%xmm5, %xmm11, %xmm5
	vaddps	%xmm2, %xmm5, %xmm2
	vmulss	%xmm1, %xmm8, %xmm5
	vxorps	%xmm1, %xmm1, %xmm1
	vaddss	%xmm1, %xmm5, %xmm5
	vmulss	%xmm4, %xmm10, %xmm4
	vaddss	%xmm5, %xmm4, %xmm4
	vmulss	%xmm3, %xmm12, %xmm3
	vaddss	%xmm4, %xmm3, %xmm3
	vmulps	%xmm2, %xmm2, %xmm4
	vmovshdup	%xmm4, %xmm5    ## xmm5 = xmm4[1,1,3,3]
	vaddss	%xmm5, %xmm4, %xmm4
	vmulss	%xmm3, %xmm3, %xmm5
	vaddss	%xmm4, %xmm5, %xmm4
	vsqrtss	%xmm4, %xmm4, %xmm4
	vucomiss	%xmm4, %xmm13
	jae	LBB16_8
## %bb.7:                               ##   in Loop: Header=BB16_2 Depth=1
	vmovss	LCPI16_2(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vdivss	%xmm4, %xmm0, %xmm1
	vmovsldup	%xmm1, %xmm0    ## xmm0 = xmm1[0,0,2,2]
	vmulps	%xmm0, %xmm2, %xmm0
	vmulss	%xmm1, %xmm3, %xmm1
LBB16_8:                                ##   in Loop: Header=BB16_2 Depth=1
	vmovlps	%xmm0, -356(%rbp)
	vmovss	%xmm1, -348(%rbp)
	vmovaps	-480(%rbp), %xmm0       ## 16-byte Reload
	vmovlps	%xmm0, -312(%rbp)
	vmovss	-100(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, -304(%rbp)
	movq	%r14, %rdi
	movq	%r15, %rsi
	vzeroupper
	callq	__Z13push_triangleP14Render_ContextP8Triangle
	incq	%r13
	movslq	8(%r12), %rax
	addq	$168, %rbx
	cmpq	%rax, %r13
	jl	LBB16_2
LBB16_9:
	addq	$440, %rsp              ## imm = 0x1B8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function _Z5clearP14Render_Context2v3
LCPI17_0:
	.long	1132396544              ## float 255
LCPI17_1:
	.long	1056964608              ## float 0.5
	.section	__TEXT,__text,regular,pure_instructions
	.globl	__Z5clearP14Render_Context2v3
	.p2align	4, 0x90
__Z5clearP14Render_Context2v3:          ## @_Z5clearP14Render_Context2v3
	.cfi_startproc
## %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movl	28(%rdi), %eax
	imull	24(%rdi), %eax
	testl	%eax, %eax
	jle	LBB17_3
## %bb.1:
	vmovss	LCPI17_0(%rip), %xmm2   ## xmm2 = mem[0],zero,zero,zero
	vmulss	%xmm2, %xmm0, %xmm3
	vmovss	LCPI17_1(%rip), %xmm4   ## xmm4 = mem[0],zero,zero,zero
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
	vcvttss2si	%xmm0, %r8
	shll	$8, %r8d
	orl	%ecx, %r8d
	movq	40(%rdi), %rcx
	xorl	%edx, %edx
	.p2align	4, 0x90
LBB17_2:                                ## =>This Inner Loop Header: Depth=1
	movl	%r8d, (%rcx,%rdx,4)
	incq	%rdx
	movslq	24(%rdi), %rsi
	movslq	28(%rdi), %rax
	imulq	%rsi, %rax
	cmpq	%rax, %rdx
	jl	LBB17_2
LBB17_3:
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function _Z11render_tileP14Render_Contexti
LCPI18_0:
	.quad	9223372036854775807     ## double NaN
	.quad	9223372036854775807     ## double NaN
LCPI18_4:
	.long	1065353216              ## float 1
	.long	1065353216              ## float 1
	.space	4
	.space	4
LCPI18_10:
	.long	1037368819              ## float 0.103999995
	.long	1042536203              ## float 0.160000011
	.space	4
	.space	4
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI18_1:
	.quad	4547007121832542208     ## double 9.9999997473787516E-5
LCPI18_2:
	.quad	4607182418800017408     ## double 1
LCPI18_7:
	.quad	4621819117588971520     ## double 10
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI18_3:
	.long	1065353216              ## float 1
LCPI18_5:
	.long	998277249               ## float 0.00392156886
LCPI18_6:
	.long	925353388               ## float 9.99999974E-6
LCPI18_8:
	.long	1101004800              ## float 20
LCPI18_9:
	.long	1061997773              ## float 0.800000011
LCPI18_11:
	.long	1043878379              ## float 0.179999992
LCPI18_12:
	.long	1092616192              ## float 10
LCPI18_13:
	.long	3240099840              ## float -10
LCPI18_14:
	.long	3259498496              ## float -50
LCPI18_15:
	.long	1132396544              ## float 255
LCPI18_16:
	.long	1056964608              ## float 0.5
LCPI18_17:
	.long	1048576000              ## float 0.25
LCPI18_18:
	.long	0                       ## float 0
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
	subq	$456, %rsp              ## imm = 0x1C8
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %r12
	movl	(%rdi), %ecx
	movl	4(%rdi), %r8d
	movl	%ecx, %eax
	sarl	$31, %eax
	shrl	$29, %eax
	addl	%ecx, %eax
	sarl	$3, %eax
	movl	%esi, %ecx
	sarl	$31, %ecx
	shrl	$29, %ecx
	addl	%esi, %ecx
	movl	%ecx, %edi
	andl	$-8, %edi
	movl	%esi, %edx
	subl	%edi, %edx
	imull	%eax, %edx
	sarl	$3, %ecx
	movl	%r8d, %edi
	sarl	$31, %edi
	shrl	$29, %edi
	addl	%r8d, %edi
	sarl	$3, %edi
	vcvtsi2ssl	%edx, %xmm0, %xmm0
	imull	%edi, %ecx
	vcvtsi2ssl	%ecx, %xmm1, %xmm1
	addl	%edx, %eax
	vcvtsi2ssl	%eax, %xmm2, %xmm2
	addl	%ecx, %edi
	vcvtsi2ssl	%edi, %xmm3, %xmm3
	movslq	%esi, %rcx
	vcvttss2si	%xmm0, %eax
	movl	%eax, -48(%rbp)         ## 4-byte Spill
	vcvttss2si	%xmm1, %eax
	movl	%eax, -56(%rbp)         ## 4-byte Spill
	vcvttss2si	%xmm2, %eax
	movl	%eax, -44(%rbp)         ## 4-byte Spill
	vcvttss2si	%xmm3, %eax
	movl	%eax, -52(%rbp)         ## 4-byte Spill
	cmpl	$0, 712(%r12,%rcx,4)
	jle	LBB18_20
## %bb.1:
	vmovsd	1000(%r12), %xmm3       ## xmm3 = mem[0],zero
	vmovss	1008(%r12), %xmm4       ## xmm4 = mem[0],zero,zero,zero
	vmovss	112(%r12), %xmm5        ## xmm5 = mem[0],zero,zero,zero
	vmovss	116(%r12), %xmm9        ## xmm9 = mem[0],zero,zero,zero
	vmovss	120(%r12), %xmm0        ## xmm0 = mem[0],zero,zero,zero
	vmovss	136(%r12), %xmm15       ## xmm15 = mem[0],zero,zero,zero
	vmovss	140(%r12), %xmm14       ## xmm14 = mem[0],zero,zero,zero
	vmovss	144(%r12), %xmm13       ## xmm13 = mem[0],zero,zero,zero
	vmovsd	64(%r12), %xmm7         ## xmm7 = mem[0],zero
	vsubss	%xmm7, %xmm3, %xmm11
	vmovshdup	%xmm3, %xmm3    ## xmm3 = xmm3[1,1,3,3]
	vmovshdup	%xmm7, %xmm7    ## xmm7 = xmm7[1,1,3,3]
	vsubss	%xmm7, %xmm3, %xmm12
	vsubss	72(%r12), %xmm4, %xmm10
	vinsertps	$16, 124(%r12), %xmm5, %xmm8 ## xmm8 = xmm5[0],mem[0],xmm5[2,3]
	vmovsldup	%xmm11, %xmm4   ## xmm4 = xmm11[0,0,2,2]
	vmulps	%xmm4, %xmm8, %xmm4
	vxorps	%xmm1, %xmm1, %xmm1
	vaddps	%xmm1, %xmm4, %xmm4
	vinsertps	$16, 128(%r12), %xmm9, %xmm5 ## xmm5 = xmm9[0],mem[0],xmm9[2,3]
	vmovsldup	%xmm12, %xmm6   ## xmm6 = xmm12[0,0,2,2]
	vmulps	%xmm6, %xmm5, %xmm6
	vaddps	%xmm4, %xmm6, %xmm6
	vinsertps	$16, 132(%r12), %xmm0, %xmm4 ## xmm4 = xmm0[0],mem[0],xmm0[2,3]
	vmovsldup	%xmm10, %xmm7   ## xmm7 = xmm10[0,0,2,2]
	vmulps	%xmm7, %xmm4, %xmm7
	vaddps	%xmm6, %xmm7, %xmm0
	vmovaps	%xmm0, -304(%rbp)       ## 16-byte Spill
	vmulss	%xmm11, %xmm15, %xmm6
	vxorps	%xmm0, %xmm0, %xmm0
	vaddss	%xmm0, %xmm6, %xmm6
	vmulss	%xmm12, %xmm14, %xmm7
	vxorps	%xmm12, %xmm12, %xmm12
	vaddss	%xmm6, %xmm7, %xmm6
	vmulss	%xmm10, %xmm13, %xmm7
	vaddss	%xmm6, %xmm7, %xmm0
	vmovss	%xmm0, -80(%rbp)        ## 4-byte Spill
	xorl	%edx, %edx
	movq	%rcx, -144(%rbp)        ## 8-byte Spill
	jmp	LBB18_2
	.p2align	4, 0x90
LBB18_30:                               ##   in Loop: Header=BB18_2 Depth=1
	vmovss	112(%r12), %xmm0        ## xmm0 = mem[0],zero,zero,zero
	vmovss	116(%r12), %xmm1        ## xmm1 = mem[0],zero,zero,zero
	vmovss	120(%r12), %xmm2        ## xmm2 = mem[0],zero,zero,zero
	vmovss	136(%r12), %xmm15       ## xmm15 = mem[0],zero,zero,zero
	vmovss	140(%r12), %xmm14       ## xmm14 = mem[0],zero,zero,zero
	vmovss	144(%r12), %xmm13       ## xmm13 = mem[0],zero,zero,zero
	vinsertps	$16, 132(%r12), %xmm2, %xmm4 ## xmm4 = xmm2[0],mem[0],xmm2[2,3]
	vinsertps	$16, 128(%r12), %xmm1, %xmm5 ## xmm5 = xmm1[0],mem[0],xmm1[2,3]
	vinsertps	$16, 124(%r12), %xmm0, %xmm8 ## xmm8 = xmm0[0],mem[0],xmm0[2,3]
LBB18_2:                                ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB18_5 Depth 2
                                        ##       Child Loop BB18_7 Depth 3
                                        ##         Child Loop BB18_8 Depth 4
	movq	184(%r12), %rax
	movq	200(%r12,%rcx,8), %rcx
	movq	%rdx, -152(%rbp)        ## 8-byte Spill
	movslq	(%rcx,%rdx,4), %rcx
	imulq	$168, %rcx, %rcx
	vmovsd	116(%rax,%rcx), %xmm10  ## xmm10 = mem[0],zero
	vmovsd	128(%rax,%rcx), %xmm0   ## xmm0 = mem[0],zero
	vmovsd	140(%rax,%rcx), %xmm7   ## xmm7 = mem[0],zero
	vsubps	%xmm10, %xmm0, %xmm11
	vsubps	%xmm10, %xmm7, %xmm3
	vpermilps	$225, %xmm3, %xmm0 ## xmm0 = xmm3[1,0,2,3]
	movl	152(%rax,%rcx), %esi
	movl	160(%rax,%rcx), %edi
	movl	164(%rax,%rcx), %ebx
	movl	-48(%rbp), %edx         ## 4-byte Reload
	cmpl	%edx, %esi
	cmovll	%edx, %esi
	movq	%rsi, -72(%rbp)         ## 8-byte Spill
	movl	-44(%rbp), %edx         ## 4-byte Reload
	cmpl	%edx, %edi
	cmovgl	%edx, %edi
	movl	%edi, -64(%rbp)         ## 4-byte Spill
	movl	-52(%rbp), %edx         ## 4-byte Reload
	cmpl	%edx, %ebx
	cmovgl	%edx, %ebx
	movl	%ebx, -60(%rbp)         ## 4-byte Spill
	vcvtps2pd	%xmm0, %xmm0
	vcvtps2pd	%xmm11, %xmm7
	vmulpd	%xmm0, %xmm7, %xmm0
	vpermilpd	$1, %xmm0, %xmm7 ## xmm7 = xmm0[1,0]
	vsubsd	%xmm7, %xmm0, %xmm6
	vandpd	LCPI18_0(%rip), %xmm6, %xmm7
	vmovsd	LCPI18_1(%rip), %xmm0   ## xmm0 = mem[0],zero
	vucomisd	%xmm7, %xmm0
	ja	LBB18_29
## %bb.3:                               ##   in Loop: Header=BB18_2 Depth=1
	movl	156(%rax,%rcx), %ebx
	movl	-56(%rbp), %edx         ## 4-byte Reload
	cmpl	%edx, %ebx
	cmovll	%edx, %ebx
	cmpl	-60(%rbp), %ebx         ## 4-byte Folded Reload
	jge	LBB18_29
## %bb.4:                               ##   in Loop: Header=BB18_2 Depth=1
	vmovsd	(%rax,%rcx), %xmm0      ## xmm0 = mem[0],zero
	vmovaps	%xmm0, -400(%rbp)       ## 16-byte Spill
	vmovss	8(%rax,%rcx), %xmm0     ## xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, -116(%rbp)       ## 4-byte Spill
	vmovsd	36(%rax,%rcx), %xmm7    ## xmm7 = mem[0],zero
	vmovss	44(%rax,%rcx), %xmm0    ## xmm0 = mem[0],zero,zero,zero
	vmovshdup	%xmm7, %xmm1    ## xmm1 = xmm7[1,1,3,3]
	vmovsldup	%xmm7, %xmm2    ## xmm2 = xmm7[0,0,2,2]
	vmulps	%xmm2, %xmm8, %xmm2
	vmovaps	%xmm3, -192(%rbp)       ## 16-byte Spill
	vxorps	%xmm9, %xmm9, %xmm9
	vaddps	%xmm9, %xmm2, %xmm2
	vmulps	%xmm1, %xmm5, %xmm3
	vaddps	%xmm2, %xmm3, %xmm2
	vpermilps	$0, %xmm0, %xmm3 ## xmm3 = xmm0[0,0,0,0]
	vmulps	%xmm3, %xmm4, %xmm3
	vaddps	%xmm2, %xmm3, %xmm2
	vmovaps	%xmm2, -384(%rbp)       ## 16-byte Spill
	vmulss	%xmm7, %xmm15, %xmm2
	vaddss	%xmm12, %xmm2, %xmm2
	vmulss	%xmm1, %xmm14, %xmm1
	vaddss	%xmm2, %xmm1, %xmm1
	vmulss	%xmm0, %xmm13, %xmm0
	vaddss	%xmm1, %xmm0, %xmm0
	vmovss	%xmm0, -112(%rbp)       ## 4-byte Spill
	vmovsd	48(%rax,%rcx), %xmm0    ## xmm0 = mem[0],zero
	vmovss	56(%rax,%rcx), %xmm1    ## xmm1 = mem[0],zero,zero,zero
	vmovshdup	%xmm0, %xmm2    ## xmm2 = xmm0[1,1,3,3]
	vmovsldup	%xmm0, %xmm3    ## xmm3 = xmm0[0,0,2,2]
	vmulps	%xmm3, %xmm8, %xmm3
	vaddps	%xmm9, %xmm3, %xmm3
	vmulps	%xmm2, %xmm5, %xmm7
	vaddps	%xmm3, %xmm7, %xmm3
	vpermilps	$0, %xmm1, %xmm7 ## xmm7 = xmm1[0,0,0,0]
	vmulps	%xmm7, %xmm4, %xmm7
	vaddps	%xmm3, %xmm7, %xmm3
	vmovaps	%xmm3, -368(%rbp)       ## 16-byte Spill
	vmulss	%xmm0, %xmm15, %xmm0
	vaddss	%xmm12, %xmm0, %xmm0
	vmulss	%xmm2, %xmm14, %xmm2
	vaddss	%xmm0, %xmm2, %xmm0
	vmulss	%xmm1, %xmm13, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, -108(%rbp)       ## 4-byte Spill
	vmovsd	60(%rax,%rcx), %xmm0    ## xmm0 = mem[0],zero
	vmovss	68(%rax,%rcx), %xmm1    ## xmm1 = mem[0],zero,zero,zero
	vmovsldup	%xmm0, %xmm2    ## xmm2 = xmm0[0,0,2,2]
	vmulps	%xmm2, %xmm8, %xmm2
	vmovshdup	%xmm0, %xmm3    ## xmm3 = xmm0[1,1,3,3]
	vaddps	%xmm9, %xmm2, %xmm2
	vmovaps	-192(%rbp), %xmm7       ## 16-byte Reload
	vmulps	%xmm3, %xmm5, %xmm5
	vaddps	%xmm2, %xmm5, %xmm2
	vpermilps	$0, %xmm1, %xmm5 ## xmm5 = xmm1[0,0,0,0]
	vmulps	%xmm5, %xmm4, %xmm4
	vmovsd	12(%rax,%rcx), %xmm5    ## xmm5 = mem[0],zero
	vmovaps	%xmm5, -352(%rbp)       ## 16-byte Spill
	vaddps	%xmm2, %xmm4, %xmm2
	vmovaps	%xmm2, -336(%rbp)       ## 16-byte Spill
	vmovss	20(%rax,%rcx), %xmm2    ## xmm2 = mem[0],zero,zero,zero
	vmovss	%xmm2, -104(%rbp)       ## 4-byte Spill
	vmulss	%xmm0, %xmm15, %xmm0
	vmovsd	24(%rax,%rcx), %xmm2    ## xmm2 = mem[0],zero
	vmovaps	%xmm2, -320(%rbp)       ## 16-byte Spill
	vmulss	%xmm3, %xmm14, %xmm2
	vmovss	32(%rax,%rcx), %xmm3    ## xmm3 = mem[0],zero,zero,zero
	vmovss	%xmm3, -100(%rbp)       ## 4-byte Spill
	vaddss	%xmm12, %xmm0, %xmm0
	vaddss	%xmm0, %xmm2, %xmm0
	vmulss	%xmm1, %xmm13, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vmovss	%xmm0, -96(%rbp)        ## 4-byte Spill
	vmovss	124(%rax,%rcx), %xmm8   ## xmm8 = mem[0],zero,zero,zero
	vmovss	136(%rax,%rcx), %xmm9   ## xmm9 = mem[0],zero,zero,zero
	vmovss	148(%rax,%rcx), %xmm15  ## xmm15 = mem[0],zero,zero,zero
	vmovsd	LCPI18_2(%rip), %xmm0   ## xmm0 = mem[0],zero
	vdivsd	%xmm6, %xmm0, %xmm6
	leaq	96(%rax,%rcx), %r14
	movq	-72(%rbp), %rdx         ## 8-byte Reload
	leal	(,%rdx,4), %edx
	movq	%rdx, -160(%rbp)        ## 8-byte Spill
	vmovsd	72(%rax,%rcx), %xmm0    ## xmm0 = mem[0],zero
	vmovsd	80(%rax,%rcx), %xmm1    ## xmm1 = mem[0],zero
	vmovsd	88(%rax,%rcx), %xmm2    ## xmm2 = mem[0],zero
	vmovshdup	%xmm10, %xmm3   ## xmm3 = xmm10[1,1,3,3]
	vmovaps	%xmm3, -496(%rbp)       ## 16-byte Spill
	vmovaps	%xmm0, -288(%rbp)       ## 16-byte Spill
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vmovaps	%xmm0, -240(%rbp)       ## 16-byte Spill
	vmovaps	%xmm1, -272(%rbp)       ## 16-byte Spill
	vmovshdup	%xmm1, %xmm0    ## xmm0 = xmm1[1,1,3,3]
	vmovaps	%xmm0, -224(%rbp)       ## 16-byte Spill
	vmovaps	%xmm2, -256(%rbp)       ## 16-byte Spill
	vmovshdup	%xmm2, %xmm0    ## xmm0 = xmm2[1,1,3,3]
	vmovaps	%xmm0, -208(%rbp)       ## 16-byte Spill
	vmovshdup	%xmm7, %xmm0    ## xmm0 = xmm7[1,1,3,3]
	vmovaps	%xmm0, -480(%rbp)       ## 16-byte Spill
	vmovshdup	%xmm11, %xmm0   ## xmm0 = xmm11[1,1,3,3]
	vmovaps	%xmm0, -464(%rbp)       ## 16-byte Spill
	vmovss	%xmm8, -92(%rbp)        ## 4-byte Spill
	vmovss	%xmm9, -88(%rbp)        ## 4-byte Spill
	vmovss	%xmm15, -84(%rbp)       ## 4-byte Spill
	vmovaps	%xmm10, -432(%rbp)      ## 16-byte Spill
	vmovaps	%xmm11, -416(%rbp)      ## 16-byte Spill
	vmovsd	%xmm6, -168(%rbp)       ## 8-byte Spill
	.p2align	4, 0x90
LBB18_5:                                ##   Parent Loop BB18_2 Depth=1
                                        ## =>  This Loop Header: Depth=2
                                        ##       Child Loop BB18_7 Depth 3
                                        ##         Child Loop BB18_8 Depth 4
	movl	-64(%rbp), %eax         ## 4-byte Reload
	cmpl	%eax, -72(%rbp)         ## 4-byte Folded Reload
	vmovss	LCPI18_3(%rip), %xmm13  ## xmm13 = mem[0],zero,zero,zero
	vmovss	LCPI18_6(%rip), %xmm14  ## xmm14 = mem[0],zero,zero,zero
	jge	LBB18_28
## %bb.6:                               ##   in Loop: Header=BB18_5 Depth=2
	vcvtsi2ssl	%ebx, %xmm10, %xmm0
	vmovss	%xmm0, -132(%rbp)       ## 4-byte Spill
	movq	-160(%rbp), %rsi        ## 8-byte Reload
	movq	-72(%rbp), %rax         ## 8-byte Reload
                                        ## kill: def $eax killed $eax killed $rax
	.p2align	4, 0x90
LBB18_7:                                ##   Parent Loop BB18_2 Depth=1
                                        ##     Parent Loop BB18_5 Depth=2
                                        ## =>    This Loop Header: Depth=3
                                        ##         Child Loop BB18_8 Depth 4
	movl	%eax, -76(%rbp)         ## 4-byte Spill
	vcvtsi2ssl	%eax, %xmm10, %xmm0
	vmovss	%xmm0, -136(%rbp)       ## 4-byte Spill
	xorl	%r13d, %r13d
	movq	%rsi, -176(%rbp)        ## 8-byte Spill
	.p2align	4, 0x90
LBB18_8:                                ##   Parent Loop BB18_2 Depth=1
                                        ##     Parent Loop BB18_5 Depth=2
                                        ##       Parent Loop BB18_7 Depth=3
                                        ## =>      This Inner Loop Header: Depth=4
	vmovss	-136(%rbp), %xmm0       ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vaddss	968(%r12,%r13,8), %xmm0, %xmm0
	vmovss	-132(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	vaddss	972(%r12,%r13,8), %xmm1, %xmm1
	vsubss	%xmm10, %xmm0, %xmm2
	vsubss	-496(%rbp), %xmm1, %xmm1 ## 16-byte Folded Reload
	vmulss	-480(%rbp), %xmm2, %xmm0 ## 16-byte Folded Reload
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm6, %xmm0
	vmulss	%xmm1, %xmm7, %xmm3
	vcvtss2sd	%xmm3, %xmm3, %xmm3
	vmulsd	%xmm3, %xmm6, %xmm3
	vsubsd	%xmm3, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vucomiss	%xmm0, %xmm12
	ja	LBB18_39
## %bb.9:                               ##   in Loop: Header=BB18_8 Depth=4
	vmulss	-464(%rbp), %xmm2, %xmm2 ## 16-byte Folded Reload
	vcvtss2sd	%xmm2, %xmm2, %xmm2
	vmulsd	%xmm2, %xmm6, %xmm2
	vmulss	%xmm1, %xmm11, %xmm1
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm6, %xmm1
	vsubsd	%xmm2, %xmm1, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vucomiss	%xmm1, %xmm12
	ja	LBB18_39
## %bb.10:                              ##   in Loop: Header=BB18_8 Depth=4
	vaddss	%xmm1, %xmm0, %xmm2
	vucomiss	%xmm13, %xmm2
	ja	LBB18_39
## %bb.11:                              ##   in Loop: Header=BB18_8 Depth=4
	vsubss	%xmm0, %xmm13, %xmm2
	vsubss	%xmm1, %xmm2, %xmm2
	vmulss	%xmm2, %xmm8, %xmm3
	vmulss	%xmm0, %xmm9, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vmulss	%xmm1, %xmm15, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vdivss	%xmm3, %xmm13, %xmm5
	movl	24(%r12), %eax
	imull	%ebx, %eax
	leal	(%rsi,%r13), %ecx
	addl	%eax, %ecx
	movq	48(%r12), %rax
	movslq	%ecx, %r15
	vucomiss	(%rax,%r15,4), %xmm5
	jae	LBB18_39
## %bb.12:                              ##   in Loop: Header=BB18_8 Depth=4
	vmulss	%xmm5, %xmm8, %xmm3
	vmulss	%xmm3, %xmm2, %xmm4
	vmulss	%xmm5, %xmm9, %xmm2
	vmulss	%xmm0, %xmm2, %xmm3
	vmulss	%xmm5, %xmm15, %xmm0
	vmulss	%xmm1, %xmm0, %xmm2
	vmovsldup	%xmm4, %xmm10   ## xmm10 = xmm4[0,0,2,2]
	vmulps	-400(%rbp), %xmm10, %xmm1 ## 16-byte Folded Reload
	vmulss	-116(%rbp), %xmm4, %xmm7 ## 4-byte Folded Reload
	vmovsldup	%xmm3, %xmm11   ## xmm11 = xmm3[0,0,2,2]
	vmulps	-352(%rbp), %xmm11, %xmm0 ## 16-byte Folded Reload
	vaddps	%xmm0, %xmm1, %xmm0
	vmulss	-104(%rbp), %xmm3, %xmm1 ## 4-byte Folded Reload
	vaddss	%xmm1, %xmm7, %xmm1
	vmovsldup	%xmm2, %xmm7    ## xmm7 = xmm2[0,0,2,2]
	vmulps	-320(%rbp), %xmm7, %xmm6 ## 16-byte Folded Reload
	vaddps	%xmm0, %xmm6, %xmm8
	vmulss	-100(%rbp), %xmm2, %xmm0 ## 4-byte Folded Reload
	vaddss	%xmm1, %xmm0, %xmm9
	vmovss	%xmm5, (%rax,%r15,4)
	movq	(%r14), %rax
	vmovaps	LCPI18_4(%rip), %xmm0   ## xmm0 = <1.0E+0,1.0E+0,u,u>
	vmovaps	%xmm0, %xmm15
	vmovaps	%xmm13, %xmm0
	testq	%rax, %rax
	je	LBB18_14
## %bb.13:                              ##   in Loop: Header=BB18_8 Depth=4
	vmulss	-288(%rbp), %xmm4, %xmm0 ## 16-byte Folded Reload
	vmulss	-240(%rbp), %xmm4, %xmm1 ## 16-byte Folded Reload
	vmulss	-272(%rbp), %xmm3, %xmm5 ## 16-byte Folded Reload
	vaddss	%xmm5, %xmm0, %xmm0
	vmulss	-224(%rbp), %xmm3, %xmm5 ## 16-byte Folded Reload
	vaddss	%xmm5, %xmm1, %xmm1
	vmulss	-256(%rbp), %xmm2, %xmm5 ## 16-byte Folded Reload
	vaddss	%xmm0, %xmm5, %xmm0
	vmulss	-208(%rbp), %xmm2, %xmm5 ## 16-byte Folded Reload
	vaddss	%xmm1, %xmm5, %xmm1
	vroundss	$9, %xmm0, %xmm0, %xmm5
	vsubss	%xmm5, %xmm0, %xmm0
	vroundss	$9, %xmm1, %xmm1, %xmm5
	vsubss	%xmm5, %xmm1, %xmm1
	movl	(%rax), %ecx
	movl	4(%rax), %edx
	vcvtsi2ssl	%ecx, %xmm12, %xmm5
	vmulss	%xmm5, %xmm0, %xmm0
	vcvtsi2ssl	%edx, %xmm12, %xmm5
	vmulss	%xmm5, %xmm1, %xmm1
	vcvttss2si	%xmm0, %esi
	vcvttss2si	%xmm1, %edi
	movl	%ebx, %r8d
	leal	-1(%rcx), %ebx
	cmpl	%esi, %ecx
	cmovgl	%esi, %ebx
	leal	-1(%rdx), %esi
	cmpl	%edi, %edx
	cmovgl	%edi, %esi
	testl	%ebx, %ebx
	movl	$0, %edx
	cmovsl	%edx, %ebx
	testl	%esi, %esi
	cmovsl	%edx, %esi
	imull	%ecx, %esi
	movslq	%esi, %rcx
	shlq	$2, %rcx
	addq	16(%rax), %rcx
	movl	(%rcx,%rbx,4), %eax
	movl	%r8d, %ebx
	movl	%eax, %ecx
	movl	%eax, %edx
	shrl	$24, %edx
	vcvtsi2ssl	%edx, %xmm12, %xmm0
	shrl	$16, %ecx
	movzbl	%cl, %ecx
	vcvtsi2ssl	%ecx, %xmm12, %xmm1
	movzbl	%ah, %eax
	vcvtsi2ssl	%eax, %xmm12, %xmm5
	vmovss	LCPI18_5(%rip), %xmm6   ## xmm6 = mem[0],zero,zero,zero
	vmulss	%xmm6, %xmm0, %xmm0
	vmulss	%xmm6, %xmm1, %xmm1
	vinsertps	$16, %xmm1, %xmm0, %xmm15 ## xmm15 = xmm0[0],xmm1[0],xmm0[2,3]
	vmulss	%xmm6, %xmm5, %xmm0
LBB18_14:                               ##   in Loop: Header=BB18_8 Depth=4
	vmovss	%xmm0, -128(%rbp)       ## 4-byte Spill
	vmulps	-384(%rbp), %xmm10, %xmm0 ## 16-byte Folded Reload
	vmulss	-112(%rbp), %xmm4, %xmm1 ## 4-byte Folded Reload
	vmulps	-368(%rbp), %xmm11, %xmm4 ## 16-byte Folded Reload
	vaddps	%xmm4, %xmm0, %xmm0
	vmulss	-108(%rbp), %xmm3, %xmm3 ## 4-byte Folded Reload
	vaddss	%xmm3, %xmm1, %xmm1
	vmulps	-336(%rbp), %xmm7, %xmm3 ## 16-byte Folded Reload
	vaddps	%xmm0, %xmm3, %xmm4
	vmulss	-96(%rbp), %xmm2, %xmm0 ## 4-byte Folded Reload
	vaddss	%xmm1, %xmm0, %xmm5
	vmovaps	-304(%rbp), %xmm0       ## 16-byte Reload
	vsubps	%xmm8, %xmm0, %xmm6
	vmovss	-80(%rbp), %xmm0        ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vsubss	%xmm9, %xmm0, %xmm7
	vmulps	%xmm6, %xmm6, %xmm0
	vmovshdup	%xmm0, %xmm1    ## xmm1 = xmm0[1,1,3,3]
	vaddss	%xmm1, %xmm0, %xmm0
	vmulss	%xmm7, %xmm7, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm0
	vxorps	%xmm11, %xmm11, %xmm11
	vxorps	%xmm10, %xmm10, %xmm10
	vucomiss	%xmm0, %xmm14
	vxorps	%xmm2, %xmm2, %xmm2
	vxorps	%xmm1, %xmm1, %xmm1
	jae	LBB18_16
## %bb.15:                              ##   in Loop: Header=BB18_8 Depth=4
	vdivss	%xmm0, %xmm13, %xmm1
	vmovsldup	%xmm1, %xmm2    ## xmm2 = xmm1[0,0,2,2]
	vmulps	%xmm2, %xmm6, %xmm2
	vmulss	%xmm1, %xmm7, %xmm1
LBB18_16:                               ##   in Loop: Header=BB18_8 Depth=4
	vmulps	%xmm2, %xmm4, %xmm2
	vmovshdup	%xmm2, %xmm3    ## xmm3 = xmm2[1,1,3,3]
	vaddss	%xmm3, %xmm2, %xmm2
	vmulss	%xmm1, %xmm5, %xmm1
	vaddss	%xmm2, %xmm1, %xmm1
	vmaxss	%xmm1, %xmm11, %xmm1
	vmulss	%xmm0, %xmm0, %xmm0
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmovsd	LCPI18_2(%rip), %xmm2   ## xmm2 = mem[0],zero
	vdivsd	%xmm0, %xmm2, %xmm0
	vmulsd	LCPI18_7(%rip), %xmm0, %xmm0
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm1, %xmm0, %xmm0
	vmulps	%xmm6, %xmm4, %xmm1
	vmovshdup	%xmm1, %xmm2    ## xmm2 = xmm1[1,1,3,3]
	vaddss	%xmm2, %xmm1, %xmm1
	vmulss	%xmm7, %xmm5, %xmm2
	vaddss	%xmm1, %xmm2, %xmm1
	vaddss	%xmm1, %xmm1, %xmm1
	vmovsldup	%xmm1, %xmm2    ## xmm2 = xmm1[0,0,2,2]
	vmulps	%xmm2, %xmm4, %xmm2
	vmulss	%xmm1, %xmm5, %xmm1
	vsubps	%xmm2, %xmm6, %xmm4
	vsubss	%xmm1, %xmm7, %xmm5
	vmulps	%xmm4, %xmm4, %xmm1
	vmovshdup	%xmm1, %xmm2    ## xmm2 = xmm1[1,1,3,3]
	vaddss	%xmm2, %xmm1, %xmm1
	vmulss	%xmm5, %xmm5, %xmm2
	vaddss	%xmm1, %xmm2, %xmm1
	vsqrtss	%xmm1, %xmm1, %xmm1
	vucomiss	%xmm1, %xmm14
	jae	LBB18_18
## %bb.17:                              ##   in Loop: Header=BB18_8 Depth=4
	vdivss	%xmm1, %xmm13, %xmm1
	vmovsldup	%xmm1, %xmm2    ## xmm2 = xmm1[0,0,2,2]
	vmulps	%xmm2, %xmm4, %xmm10
	vmulss	%xmm1, %xmm5, %xmm11
LBB18_18:                               ##   in Loop: Header=BB18_8 Depth=4
	vcvtsd2ss	%xmm0, %xmm0, %xmm3
	vmulps	%xmm8, %xmm8, %xmm0
	vmovshdup	%xmm0, %xmm1    ## xmm1 = xmm0[1,1,3,3]
	vaddss	%xmm1, %xmm0, %xmm0
	vmulss	%xmm9, %xmm9, %xmm1
	vaddss	%xmm0, %xmm1, %xmm0
	vsqrtss	%xmm0, %xmm0, %xmm2
	vucomiss	%xmm2, %xmm14
	vmovaps	%xmm15, -448(%rbp)      ## 16-byte Spill
	vmovss	%xmm3, -124(%rbp)       ## 4-byte Spill
	vmovss	%xmm2, -120(%rbp)       ## 4-byte Spill
	jae	LBB18_19
## %bb.31:                              ##   in Loop: Header=BB18_8 Depth=4
	vdivss	%xmm2, %xmm13, %xmm1
	vmovsldup	%xmm1, %xmm0    ## xmm0 = xmm1[0,0,2,2]
	vmulps	%xmm0, %xmm8, %xmm0
	vmulss	%xmm1, %xmm9, %xmm1
	jmp	LBB18_32
LBB18_19:                               ##   in Loop: Header=BB18_8 Depth=4
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
LBB18_32:                               ##   in Loop: Header=BB18_8 Depth=4
	vmulss	%xmm1, %xmm11, %xmm1
	vmulps	%xmm0, %xmm10, %xmm0
	vmovshdup	%xmm0, %xmm2    ## xmm2 = xmm0[1,1,3,3]
	vaddss	%xmm2, %xmm0, %xmm0
	vaddss	%xmm0, %xmm1, %xmm0
	vmaxss	%xmm0, %xmm12, %xmm0
	vmovss	LCPI18_8(%rip), %xmm1   ## xmm1 = mem[0],zero,zero,zero
	callq	_powf
	vmovss	-124(%rbp), %xmm1       ## 4-byte Reload
                                        ## xmm1 = mem[0],zero,zero,zero
	vmulss	LCPI18_9(%rip), %xmm1, %xmm1
	vmovsldup	%xmm1, %xmm2    ## xmm2 = xmm1[0,0,2,2]
	vaddps	LCPI18_10(%rip), %xmm2, %xmm3
	vaddss	LCPI18_11(%rip), %xmm1, %xmm2
	vmovsldup	%xmm0, %xmm1    ## xmm1 = xmm0[0,0,2,2]
	vaddps	%xmm1, %xmm3, %xmm1
	vmovss	-120(%rbp), %xmm4       ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	vucomiss	LCPI18_12(%rip), %xmm4
	vmovss	LCPI18_3(%rip), %xmm13  ## xmm13 = mem[0],zero,zero,zero
	vmovaps	%xmm13, %xmm3
	jbe	LBB18_34
## %bb.33:                              ##   in Loop: Header=BB18_8 Depth=4
	vaddss	LCPI18_13(%rip), %xmm4, %xmm3
	vdivss	LCPI18_14(%rip), %xmm3, %xmm3
	vaddss	%xmm13, %xmm3, %xmm3
	vxorps	%xmm4, %xmm4, %xmm4
	vmaxss	%xmm3, %xmm4, %xmm3
LBB18_34:                               ##   in Loop: Header=BB18_8 Depth=4
	vaddss	%xmm0, %xmm2, %xmm2
	vmovsd	8(%r14), %xmm0          ## xmm0 = mem[0],zero
	vmulps	-448(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	vmovss	-128(%rbp), %xmm4       ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	vmulss	16(%r14), %xmm4, %xmm4
	vmovsldup	%xmm3, %xmm5    ## xmm5 = xmm3[0,0,2,2]
	vmulps	%xmm0, %xmm5, %xmm0
	vmulps	%xmm0, %xmm1, %xmm0
	vmulss	%xmm4, %xmm3, %xmm1
	vucomiss	%xmm13, %xmm0
	vmovaps	-432(%rbp), %xmm10      ## 16-byte Reload
	vmovaps	-416(%rbp), %xmm11      ## 16-byte Reload
	vmovaps	-192(%rbp), %xmm7       ## 16-byte Reload
	vmovss	-92(%rbp), %xmm8        ## 4-byte Reload
                                        ## xmm8 = mem[0],zero,zero,zero
	vmovss	-88(%rbp), %xmm9        ## 4-byte Reload
                                        ## xmm9 = mem[0],zero,zero,zero
	vmovss	-84(%rbp), %xmm15       ## 4-byte Reload
                                        ## xmm15 = mem[0],zero,zero,zero
	vmovsd	-168(%rbp), %xmm6       ## 8-byte Reload
                                        ## xmm6 = mem[0],zero
	movq	-176(%rbp), %rsi        ## 8-byte Reload
	jbe	LBB18_36
## %bb.35:                              ##   in Loop: Header=BB18_8 Depth=4
	vblendps	$1, %xmm13, %xmm0, %xmm0 ## xmm0 = xmm13[0],xmm0[1,2,3]
LBB18_36:                               ##   in Loop: Header=BB18_8 Depth=4
	vxorps	%xmm12, %xmm12, %xmm12
	vmovss	LCPI18_6(%rip), %xmm14  ## xmm14 = mem[0],zero,zero,zero
	vmulss	%xmm1, %xmm2, %xmm1
	vmovshdup	%xmm0, %xmm2    ## xmm2 = xmm0[1,1,3,3]
	vucomiss	%xmm13, %xmm2
	jbe	LBB18_38
## %bb.37:                              ##   in Loop: Header=BB18_8 Depth=4
	vinsertps	$16, %xmm13, %xmm0, %xmm0 ## xmm0 = xmm0[0],xmm13[0],xmm0[2,3]
LBB18_38:                               ##   in Loop: Header=BB18_8 Depth=4
	vminss	%xmm1, %xmm13, %xmm1
	vmovss	LCPI18_15(%rip), %xmm2  ## xmm2 = mem[0],zero,zero,zero
	vmovaps	%xmm2, %xmm3
	vmulss	%xmm2, %xmm0, %xmm2
	vmovss	LCPI18_16(%rip), %xmm4  ## xmm4 = mem[0],zero,zero,zero
	vaddss	%xmm4, %xmm2, %xmm2
	vcvttss2si	%xmm2, %rax
	shll	$24, %eax
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vmulss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vcvttss2si	%xmm0, %rcx
	shll	$16, %ecx
	vmulss	%xmm3, %xmm1, %xmm0
	vaddss	%xmm4, %xmm0, %xmm0
	vcvttss2si	%xmm0, %rdx
	shll	$8, %edx
	orl	%eax, %edx
	orl	%ecx, %edx
	movq	40(%r12), %rax
	movl	%edx, (%rax,%r15,4)
LBB18_39:                               ##   in Loop: Header=BB18_8 Depth=4
	incq	%r13
	cmpq	$4, %r13
	jne	LBB18_8
## %bb.27:                              ##   in Loop: Header=BB18_7 Depth=3
	movl	-76(%rbp), %eax         ## 4-byte Reload
	incl	%eax
	addq	$4, %rsi
	cmpl	-64(%rbp), %eax         ## 4-byte Folded Reload
	jl	LBB18_7
LBB18_28:                               ##   in Loop: Header=BB18_5 Depth=2
	incl	%ebx
	cmpl	-60(%rbp), %ebx         ## 4-byte Folded Reload
	jl	LBB18_5
LBB18_29:                               ##   in Loop: Header=BB18_2 Depth=1
	movq	-152(%rbp), %rdx        ## 8-byte Reload
	incq	%rdx
	movq	-144(%rbp), %rcx        ## 8-byte Reload
	movslq	712(%r12,%rcx,4), %rax
	cmpq	%rax, %rdx
	jl	LBB18_30
LBB18_20:
	movl	-56(%rbp), %r13d        ## 4-byte Reload
	cmpl	-52(%rbp), %r13d        ## 4-byte Folded Reload
	jge	LBB18_26
## %bb.21:
	movl	-44(%rbp), %eax         ## 4-byte Reload
	cmpl	%eax, -48(%rbp)         ## 4-byte Folded Reload
	jge	LBB18_26
## %bb.22:
	movl	-48(%rbp), %ecx         ## 4-byte Reload
	movslq	%ecx, %r8
	movq	16(%r12), %r10
	movq	40(%r12), %rax
	movslq	-44(%rbp), %r11         ## 4-byte Folded Reload
	shll	$2, %ecx
	movslq	%ecx, %rcx
	leaq	8(%rax,%rcx,4), %r9
	vmovss	LCPI18_5(%rip), %xmm12  ## xmm12 = mem[0],zero,zero,zero
	vxorps	%xmm8, %xmm8, %xmm8
	vmovss	LCPI18_17(%rip), %xmm9  ## xmm9 = mem[0],zero,zero,zero
	vmovss	LCPI18_15(%rip), %xmm10 ## xmm10 = mem[0],zero,zero,zero
	vmovss	LCPI18_16(%rip), %xmm11 ## xmm11 = mem[0],zero,zero,zero
	.p2align	4, 0x90
LBB18_23:                               ## =>This Loop Header: Depth=1
                                        ##     Child Loop BB18_24 Depth 2
	movq	%r9, %rdi
	movq	%r8, %r14
	.p2align	4, 0x90
LBB18_24:                               ##   Parent Loop BB18_23 Depth=1
                                        ## =>  This Inner Loop Header: Depth=2
	movl	24(%r12), %eax
	imull	%r13d, %eax
	movslq	%eax, %r15
	movl	-8(%rdi,%r15,4), %eax
	movl	-4(%rdi,%r15,4), %ecx
	movl	%eax, %edx
	movzbl	%ah, %ebx
	shrl	$24, %eax
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%eax, %xmm15, %xmm5
	shrl	$16, %edx
	movl	%ecx, %eax
	movzbl	%ch, %esi
	shrl	$24, %ecx
	movzbl	%dl, %edx
	shrl	$16, %eax
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%ebx, %xmm15, %xmm6
	movzbl	%al, %ebx
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%esi, %xmm15, %xmm13
	movl	(%rdi,%r15,4), %eax
	movl	%eax, %esi
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%edx, %xmm15, %xmm1
	movzbl	%ah, %edx
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%ecx, %xmm15, %xmm2
	shrl	$24, %eax
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%ebx, %xmm15, %xmm3
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%eax, %xmm15, %xmm4
	vmulss	%xmm12, %xmm5, %xmm5
	vmulss	%xmm12, %xmm6, %xmm6
	shrl	$16, %esi
	movzbl	%sil, %eax
	vmulss	%xmm12, %xmm2, %xmm2
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%eax, %xmm15, %xmm14
	vmulss	%xmm12, %xmm1, %xmm1
	vxorps	%xmm15, %xmm15, %xmm15
	vcvtsi2ssl	%edx, %xmm15, %xmm7
	vaddss	%xmm8, %xmm5, %xmm5
	vmulss	%xmm12, %xmm3, %xmm15
	vmulss	%xmm12, %xmm13, %xmm0
	vmulss	%xmm12, %xmm4, %xmm4
	vaddss	%xmm8, %xmm6, %xmm6
	movl	4(%rdi,%r15,4), %eax
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
	movl	(%r12), %esi
	orl	%eax, %edx
	imull	%r13d, %esi
	addl	%r14d, %esi
	movslq	%esi, %rax
	orl	%ecx, %edx
	movl	%edx, (%r10,%rax,4)
	incq	%r14
	addq	$16, %rdi
	cmpq	%r14, %r11
	jne	LBB18_24
## %bb.25:                              ##   in Loop: Header=BB18_23 Depth=1
	incl	%r13d
	cmpl	-52(%rbp), %r13d        ## 4-byte Folded Reload
	jne	LBB18_23
LBB18_26:
	addq	$456, %rsp              ## imm = 0x1C8
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
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
	xorl	%esi, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$1, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$2, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$3, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$4, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$5, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$6, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$7, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$8, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$9, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$10, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$11, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$12, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$13, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$14, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$15, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$16, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$17, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$18, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$19, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$20, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$21, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$22, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$23, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$24, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$25, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$26, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$27, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$28, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$29, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$30, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$31, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$32, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$33, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$34, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$35, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$36, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$37, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$38, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$39, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$40, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$41, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$42, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$43, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$44, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$45, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$46, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$47, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$48, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$49, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$50, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$51, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$52, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$53, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$54, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$55, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$56, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$57, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$58, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$59, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$60, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$61, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$62, %esi
	callq	__Z11render_tileP14Render_Contexti
	movq	%rbx, %rdi
	movl	$63, %esi
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	jmp	__Z11render_tileP14Render_Contexti ## TAILCALL
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
	jne	LBB20_3
## %bb.1:
	addq	$4, %rbx
	.p2align	4, 0x90
LBB20_2:                                ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rsi
	movl	$10, %edx
	callq	_strtol
	movl	%eax, (%rbx)
	movq	(%r14), %rax
	addq	$4, %rbx
	cmpb	$47, (%rax)
	leaq	1(%rax), %rdi
	movq	%rdi, (%r14)
	je	LBB20_2
LBB20_3:
	popq	%rbx
	popq	%r14
	popq	%rbp
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2               ## -- Begin function _Z9load_meshPKcP7Texture
LCPI21_0:
	.long	8388608                 ## float 1.17549435E-38
LCPI21_1:
	.long	925353388               ## float 9.99999974E-6
LCPI21_2:
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
	vmovss	LCPI21_0(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vmovaps	%xmm0, -192(%rbp)       ## 16-byte Spill
	xorl	%r13d, %r13d
	leaq	-96(%rbp), %r14
	movl	$0, -108(%rbp)          ## 4-byte Folded Spill
	movl	$0, -104(%rbp)          ## 4-byte Folded Spill
	movl	$0, -100(%rbp)          ## 4-byte Folded Spill
	movb	(%r12), %al
	cmpb	$102, %al
	jne	LBB21_2
	jmp	LBB21_16
	.p2align	4, 0x90
LBB21_5:
	movb	1(%r12), %al
	cmpb	$116, %al
	je	LBB21_12
## %bb.6:
	cmpb	$110, %al
	je	LBB21_10
## %bb.7:
	cmpb	$32, %al
	jne	LBB21_4
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
	jge	LBB21_58
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
	jmp	LBB21_4
LBB21_10:
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
	vmovss	LCPI21_1(%rip), %xmm4   ## xmm4 = mem[0],zero,zero,zero
	vucomiss	%xmm3, %xmm4
	jae	LBB21_14
## %bb.11:
	vmovss	LCPI21_2(%rip), %xmm4   ## xmm4 = mem[0],zero,zero,zero
	vdivss	%xmm3, %xmm4, %xmm3
	vmulss	%xmm3, %xmm1, %xmm1
	vmulss	%xmm3, %xmm2, %xmm2
	vinsertps	$16, %xmm2, %xmm1, %xmm1 ## xmm1 = xmm1[0],xmm2[0],xmm1[2,3]
	vmulss	%xmm3, %xmm0, %xmm0
	jmp	LBB21_15
LBB21_12:
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
	jmp	LBB21_4
LBB21_14:
	vxorps	%xmm0, %xmm0, %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
LBB21_15:
	movq	-160(%rbp), %rax        ## 8-byte Reload
	incl	-108(%rbp)              ## 4-byte Folded Spill
	movq	-120(%rbp), %rcx        ## 8-byte Reload
	vmovlps	%xmm1, (%rcx)
	vmovss	%xmm0, 8(%rcx)
	movl	%eax, %r9d
	movq	-96(%rbp), %r12
	movb	(%r12), %cl
	testb	%cl, %cl
	jne	LBB21_46
	jmp	LBB21_1
	.p2align	4, 0x90
LBB21_16:
	cmpb	$32, 1(%r12)
	jne	LBB21_4
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
	jne	LBB21_20
## %bb.18:
	leaq	-56(%rbp), %rbx
	.p2align	4, 0x90
LBB21_19:                               ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rsi
	movl	$10, %edx
	callq	_strtol
	movl	%eax, (%rbx)
	movq	-96(%rbp), %rax
	addq	$4, %rbx
	cmpb	$47, (%rax)
	leaq	1(%rax), %rdi
	movq	%rdi, -96(%rbp)
	je	LBB21_19
LBB21_20:
	movq	%r14, %rsi
	movl	$10, %edx
	callq	_strtol
	movl	%eax, -72(%rbp)
	movq	-96(%rbp), %rax
	cmpb	$47, (%rax)
	leaq	1(%rax), %rdi
	movq	%rdi, -96(%rbp)
	jne	LBB21_23
## %bb.21:
	leaq	-68(%rbp), %rbx
	.p2align	4, 0x90
LBB21_22:                               ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rsi
	movl	$10, %edx
	callq	_strtol
	movl	%eax, (%rbx)
	movq	-96(%rbp), %rax
	addq	$4, %rbx
	cmpb	$47, (%rax)
	leaq	1(%rax), %rdi
	movq	%rdi, -96(%rbp)
	je	LBB21_22
LBB21_23:
	movq	%r14, %rsi
	movl	$10, %edx
	callq	_strtol
	movl	%eax, -88(%rbp)
	movq	-96(%rbp), %rax
	leaq	1(%rax), %rdi
	cmpb	$47, (%rax)
	movq	%rdi, -96(%rbp)
	jne	LBB21_26
## %bb.24:
	leaq	-84(%rbp), %rbx
	.p2align	4, 0x90
LBB21_25:                               ## =>This Inner Loop Header: Depth=1
	movq	%r14, %rsi
	movl	$10, %edx
	callq	_strtol
	movl	%eax, (%rbx)
	movq	-96(%rbp), %rax
	leaq	1(%rax), %rdi
	addq	$4, %rbx
	cmpb	$47, (%rax)
	movq	%rdi, -96(%rbp)
	je	LBB21_25
LBB21_26:
	movq	%rax, -96(%rbp)
	movq	%r13, %rax
	cmpl	$1048576, %eax          ## imm = 0x100000
	jge	LBB21_57
## %bb.27:
	leal	1(%rax), %r9d
	movq	-168(%rbp), %rax        ## 8-byte Reload
	movl	%r9d, 8(%rax)
	movslq	-60(%rbp), %rsi
	testq	%rsi, %rsi
	jle	LBB21_54
## %bb.28:
	movslq	-72(%rbp), %rdi
	testq	%rdi, %rdi
	jle	LBB21_54
## %bb.29:
	movslq	-88(%rbp), %rbx
	testq	%rbx, %rbx
	jle	LBB21_54
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
	je	LBB21_35
## %bb.31:
	testl	%esi, %esi
	jle	LBB21_55
## %bb.32:
	movslq	-68(%rbp), %rdi
	testq	%rdi, %rdi
	jle	LBB21_55
## %bb.33:
	movslq	-84(%rbp), %rbx
	testq	%rbx, %rbx
	jle	LBB21_55
## %bb.34:
	movq	-136(%rbp), %rax        ## 8-byte Reload
	movq	-8(%rax,%rsi,8), %rdx
	movq	%rdx, 72(%r15,%rcx)
	movq	-8(%rax,%rdi,8), %rdx
	movq	%rdx, 80(%r15,%rcx)
	movq	-8(%rax,%rbx,8), %rdx
	movq	%rdx, 88(%r15,%rcx)
LBB21_35:
	movslq	-52(%rbp), %rsi
	testq	%rsi, %rsi
	je	LBB21_41
## %bb.36:
	testl	%esi, %esi
	jle	LBB21_56
## %bb.37:
	movslq	-64(%rbp), %rdx
	testq	%rdx, %rdx
	jle	LBB21_56
## %bb.38:
	movslq	-80(%rbp), %rdi
	testq	%rdi, %rdi
	jle	LBB21_56
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
	jne	LBB21_46
	jmp	LBB21_1
	.p2align	4, 0x90
LBB21_4:
	movl	%r13d, %r9d
	movq	-96(%rbp), %r12
	movb	(%r12), %cl
	testb	%cl, %cl
	je	LBB21_1
	.p2align	4, 0x90
LBB21_46:                               ## =>This Inner Loop Header: Depth=1
	incq	%r12
	cmpb	$10, %cl
	je	LBB21_47
## %bb.45:                              ##   in Loop: Header=BB21_46 Depth=1
	movq	%r12, -96(%rbp)
	movzbl	(%r12), %ecx
	testb	%cl, %cl
	jne	LBB21_46
LBB21_1:
	movl	%r9d, %r13d
	movb	(%r12), %al
	cmpb	$102, %al
	jne	LBB21_2
	jmp	LBB21_16
	.p2align	4, 0x90
LBB21_47:
	movq	%r12, -96(%rbp)
	movl	%r9d, %r13d
	movb	(%r12), %al
	cmpb	$102, %al
	jne	LBB21_2
	jmp	LBB21_16
LBB21_41:
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
	vmovss	LCPI21_1(%rip), %xmm3   ## xmm3 = mem[0],zero,zero,zero
	vucomiss	%xmm2, %xmm3
	jae	LBB21_43
## %bb.42:
	vmovss	LCPI21_2(%rip), %xmm3   ## xmm3 = mem[0],zero,zero,zero
	vdivss	%xmm2, %xmm3, %xmm3
	vmovshdup	%xmm1, %xmm2    ## xmm2 = xmm1[1,1,3,3]
	vmulss	%xmm3, %xmm2, %xmm2
	vmulss	%xmm3, %xmm0, %xmm0
	vinsertps	$16, %xmm0, %xmm2, %xmm2 ## xmm2 = xmm2[0],xmm0[0],xmm2[2,3]
	vmulss	%xmm3, %xmm1, %xmm0
	jmp	LBB21_44
LBB21_43:
	vxorps	%xmm0, %xmm0, %xmm0
	vxorps	%xmm2, %xmm2, %xmm2
LBB21_44:
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
	jne	LBB21_46
	jmp	LBB21_1
	.p2align	4, 0x90
LBB21_2:
	cmpb	$118, %al
	je	LBB21_5
## %bb.3:
	testb	%al, %al
	jne	LBB21_4
## %bb.48:
	leaq	L_.str.15(%rip), %rdi
	movl	%r13d, %esi
	xorl	%eax, %eax
	callq	_printf
	testl	%r13d, %r13d
	jle	LBB21_51
## %bb.49:
	vmovss	LCPI21_2(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vdivss	-192(%rbp), %xmm0, %xmm0 ## 16-byte Folded Reload
	movl	%r13d, %eax
	vmovsldup	%xmm0, %xmm1    ## xmm1 = xmm0[0,0,2,2]
	addq	$32, %r15
	.p2align	4, 0x90
LBB21_50:                               ## =>This Inner Loop Header: Depth=1
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
	jne	LBB21_50
LBB21_51:
	movq	-144(%rbp), %rdi        ## 8-byte Reload
	callq	_free
	movq	-128(%rbp), %rdi        ## 8-byte Reload
	callq	_free
	movq	-136(%rbp), %rdi        ## 8-byte Reload
	callq	_free
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB21_53
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
LBB21_53:
	callq	___stack_chk_fail
LBB21_54:
	leaq	L___func__._Z9load_meshPKcP7Texture(%rip), %rdi
	leaq	L_.str.9(%rip), %rsi
	leaq	L_.str.12(%rip), %rcx
	movl	$81, %edx
	callq	___assert_rtn
LBB21_55:
	leaq	L___func__._Z9load_meshPKcP7Texture(%rip), %rdi
	leaq	L_.str.9(%rip), %rsi
	leaq	L_.str.13(%rip), %rcx
	movl	$89, %edx
	callq	___assert_rtn
LBB21_56:
	leaq	L___func__._Z9load_meshPKcP7Texture(%rip), %rdi
	leaq	L_.str.9(%rip), %rsi
	leaq	L_.str.14(%rip), %rcx
	movl	$96, %edx
	callq	___assert_rtn
LBB21_57:
	leaq	L___func__._Z9load_meshPKcP7Texture(%rip), %rdi
	leaq	L_.str.9(%rip), %rsi
	leaq	L_.str.11(%rip), %rcx
	movl	$78, %edx
	callq	___assert_rtn
LBB21_58:
	leaq	L___func__._Z9load_meshPKcP7Texture(%rip), %rdi
	leaq	L_.str.9(%rip), %rsi
	leaq	L_.str.10(%rip), %rcx
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
	xorl	%eax, %eax
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
	jle	LBB23_3
## %bb.1:
	movq	%rsi, %rbx
	movq	%rdi, %r15
	movl	%edx, %r14d
	leaq	-112(%rbp), %r13
	xorl	%r12d, %r12d
	.p2align	4, 0x90
LBB23_2:                                ## =>This Inner Loop Header: Depth=1
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
	jne	LBB23_2
LBB23_3:
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	-48(%rbp), %rax
	jne	LBB23_5
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
LBB23_5:
	vzeroupper
	callq	___stack_chk_fail
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__literal16,16byte_literals
	.p2align	4               ## -- Begin function game_update_and_render
LCPI24_0:
	.long	1101004800              ## float 20
	.long	1101004800              ## float 20
	.space	4
	.space	4
LCPI24_5:
	.long	1015580809              ## float 0.0166666675
	.long	1015580809              ## float 0.0166666675
	.space	4
	.space	4
LCPI24_11:
	.space	4
	.long	1077936128              ## float 3
	.space	4
	.space	4
LCPI24_12:
	.long	3296329728              ## float -1000
	.long	3212836864              ## float -1
	.space	4
	.space	4
LCPI24_13:
	.long	1148846080              ## float 1000
	.long	3212836864              ## float -1
	.space	4
	.space	4
LCPI24_14:
	.long	1148846080              ## float 1000
	.long	1148846080              ## float 1000
	.space	4
	.space	4
LCPI24_15:
	.long	1058642330              ## float 0.600000024
	.long	1058642330              ## float 0.600000024
	.space	4
	.space	4
LCPI24_16:
	.long	2147483648              ## float -0
	.long	1065353216              ## float 1
	.space	4
	.space	4
LCPI24_17:
	.long	0                       ## float 0
	.long	1148846080              ## float 1000
	.space	4
	.space	4
LCPI24_19:
	.long	3212836864              ## float -1
	.long	1065353216              ## float 1
	.space	4
	.space	4
LCPI24_20:
	.long	1065353216              ## float 1
	.long	1065353216              ## float 1
	.space	4
	.space	4
LCPI24_21:
	.long	1056964608              ## float 0.5
	.long	1061997773              ## float 0.800000011
	.space	4
	.space	4
LCPI24_25:
	.long	1065353216              ## float 1
	.long	1069547520              ## float 1.5
	.space	4
	.space	4
LCPI24_27:
	.long	0                       ## float 0
	.long	3204448256              ## float -0.5
	.space	4
	.space	4
LCPI24_28:
	.long	3221225472              ## float -2
	.long	1065353216              ## float 1
	.space	4
	.space	4
LCPI24_29:
	.long	1036831949              ## float 0.100000001
	.long	1036831949              ## float 0.100000001
	.space	4
	.space	4
LCPI24_33:
	.space	16
	.section	__TEXT,__literal4,4byte_literals
	.p2align	2
LCPI24_1:
	.long	805306368               ## float 4.65661287E-10
LCPI24_2:
	.long	1028443341              ## float 0.0500000007
LCPI24_3:
	.long	1148846080              ## float 1000
LCPI24_4:
	.long	1114636288              ## float 60
LCPI24_6:
	.long	1015580809              ## float 0.0166666675
LCPI24_7:
	.long	2147483648              ## float -0
LCPI24_22:
	.long	3225419776              ## float -3
LCPI24_23:
	.long	1065353216              ## float 1
LCPI24_24:
	.long	1045220557              ## float 0.200000003
LCPI24_26:
	.long	3231711232              ## float -5
LCPI24_30:
	.long	3212836864              ## float -1
	.section	__TEXT,__literal8,8byte_literals
	.p2align	3
LCPI24_8:
	.quad	4609434218613702656     ## double 1.5
LCPI24_9:
	.quad	4613937818241073152     ## double 3
LCPI24_10:
	.quad	-4607182418800017408    ## double -4
LCPI24_18:
	.quad	4575657221408423936     ## double 0.0078125
LCPI24_31:
	.quad	4652007308841189376     ## double 1000
LCPI24_32:
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
	subq	$1312, %rsp             ## imm = 0x520
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	movq	%rdi, %rbx
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 1288(%rsp)
	leaq	144(%rsp), %rsi
	movl	$6, %edi
	callq	_clock_gettime
	cmpl	$0, 188(%rbx)
	jne	LBB24_5
## %bb.1:
	leaq	L_.str.20(%rip), %rsi
	leaq	192(%rsp), %rdi
	callq	__Z12load_texturePKc
	leaq	272(%rbx), %r14
	movq	208(%rsp), %rax
	movq	%rax, 288(%rbx)
	vmovups	192(%rsp), %xmm0
	vmovups	%xmm0, 272(%rbx)
	leaq	L_.str.21(%rip), %rsi
	leaq	192(%rsp), %rdi
	callq	__Z12load_texturePKc
	movq	208(%rsp), %rax
	movq	%rax, 240(%rbx)
	vmovups	192(%rsp), %xmm0
	vmovups	%xmm0, 224(%rbx)
	leaq	L_.str.22(%rip), %rsi
	leaq	192(%rsp), %rdi
	callq	__Z12load_texturePKc
	movq	208(%rsp), %rax
	movq	%rax, 264(%rbx)
	vmovups	192(%rsp), %xmm0
	vmovups	%xmm0, 248(%rbx)
	leaq	L_.str.23(%rip), %rsi
	leaq	192(%rsp), %rdi
	callq	__Z12load_texturePKc
	movq	208(%rsp), %rax
	movq	%rax, 336(%rbx)
	vmovups	192(%rsp), %xmm0
	vmovups	%xmm0, 320(%rbx)
	leaq	L_.str.24(%rip), %rsi
	leaq	192(%rsp), %rdi
	callq	__Z12load_texturePKc
	leaq	344(%rbx), %r12
	movq	208(%rsp), %rax
	movq	%rax, 360(%rbx)
	vmovups	192(%rsp), %xmm0
	vmovups	%xmm0, 344(%rbx)
	leaq	296(%rbx), %r15
	movl	$2, 304(%rbx)
	movabsq	$8589934594, %rax       ## imm = 0x200000002
	movq	%rax, 296(%rbx)
	movl	$4, %edi
	movl	$4, %esi
	callq	_calloc
	movq	%rax, 312(%rbx)
	movl	$-1, 12(%rax)
	movl	$-1, (%rax)
	leaq	L_.str.25(%rip), %rsi
	leaq	192(%rsp), %rdi
	movq	%r14, %rdx
	callq	__Z9load_meshPKcP7Texture
	vmovups	192(%rsp), %ymm0
	vmovups	208(%rsp), %ymm1
	vmovups	%ymm1, 480(%rbx)
	vmovups	%ymm0, 464(%rbx)
	leaq	L_.str.26(%rip), %rsi
	leaq	192(%rsp), %rdi
	movq	%r12, %rdx
	vzeroupper
	callq	__Z9load_meshPKcP7Texture
	vmovups	192(%rsp), %ymm0
	vmovups	208(%rsp), %ymm1
	vmovups	%ymm1, 528(%rbx)
	vmovups	%ymm0, 512(%rbx)
	leaq	L_.str.27(%rip), %rsi
	leaq	192(%rsp), %rdi
	movq	%r15, %rdx
	vzeroupper
	callq	__Z9load_meshPKcP7Texture
	vmovups	192(%rsp), %ymm0
	vmovups	208(%rsp), %ymm1
	vmovups	%ymm1, 384(%rbx)
	vmovups	%ymm0, 368(%rbx)
	cmpl	$0, 376(%rbx)
	jle	LBB24_4
## %bb.2:
	xorl	%eax, %eax
	vmovaps	LCPI24_0(%rip), %xmm0   ## xmm0 = <2.0E+1,2.0E+1,u,u>
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB24_3:                                ## =>This Inner Loop Header: Depth=1
	movq	368(%rbx), %rdx
	vmovsd	72(%rdx,%rax), %xmm1    ## xmm1 = mem[0],zero
	vmulps	%xmm0, %xmm1, %xmm1
	vmovlps	%xmm1, 72(%rdx,%rax)
	movq	368(%rbx), %rdx
	vmovsd	80(%rdx,%rax), %xmm1    ## xmm1 = mem[0],zero
	vmulps	%xmm0, %xmm1, %xmm1
	vmovlps	%xmm1, 80(%rdx,%rax)
	movq	368(%rbx), %rdx
	vmovsd	88(%rdx,%rax), %xmm1    ## xmm1 = mem[0],zero
	vmulps	%xmm0, %xmm1, %xmm1
	vmovlps	%xmm1, 88(%rdx,%rax)
	incq	%rcx
	movslq	376(%rbx), %rdx
	addq	$168, %rax
	cmpq	%rdx, %rcx
	jl	LBB24_3
LBB24_4:
	leaq	L_.str.28(%rip), %rsi
	leaq	192(%rsp), %rdi
	xorl	%edx, %edx
	vzeroupper
	callq	__Z9load_meshPKcP7Texture
	vmovups	192(%rsp), %ymm0
	vmovups	208(%rsp), %ymm1
	vmovups	%ymm1, 432(%rbx)
	vmovups	%ymm0, 416(%rbx)
	leaq	L_.str.29(%rip), %rsi
	leaq	192(%rsp), %rdi
	vzeroupper
	callq	__Z12load_texturePKc
	leaq	656(%rbx), %rdx
	movq	208(%rsp), %rax
	movq	%rax, 672(%rbx)
	vmovups	192(%rsp), %xmm0
	vmovups	%xmm0, 656(%rbx)
	leaq	L_.str.30(%rip), %rsi
	leaq	192(%rsp), %rdi
	callq	__Z9load_meshPKcP7Texture
	vmovups	192(%rsp), %ymm0
	vmovups	208(%rsp), %ymm1
	vmovups	%ymm1, 576(%rbx)
	vmovups	%ymm0, 560(%rbx)
	movq	$0, 44(%rbx)
	movl	$0, 52(%rbx)
	xorl	%edi, %edi
	vzeroupper
	callq	_time
	movl	%eax, %edi
	callq	_srand
	callq	_rand
	vcvtsi2ssl	%eax, %xmm2, %xmm0
	vmulss	LCPI24_1(%rip), %xmm0, %xmm0
	vmovss	%xmm0, 192(%rbx)
	subq	$32, %rsp
	movq	16(%rbx), %rax
	movq	%rax, 16(%rsp)
	vmovups	(%rbx), %xmm0
	vmovups	%xmm0, (%rsp)
	leaq	224(%rsp), %r14
	vmovss	LCPI24_2(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vmovss	LCPI24_3(%rip), %xmm1   ## xmm1 = mem[0],zero,zero,zero
	vmovss	LCPI24_4(%rip), %xmm2   ## xmm2 = mem[0],zero,zero,zero
	movq	%r14, %rdi
	movl	$100000, %esi           ## imm = 0x186A0
	callq	__Z18new_render_context7Texturefffi
	addq	$32, %rsp
	leaq	6256(%rbx), %rdi
	movl	$1096, %edx             ## imm = 0x448
	movq	%r14, %rsi
	callq	_memcpy
	movl	$1, 188(%rbx)
LBB24_5:
	vmovsd	104(%rbx), %xmm0        ## xmm0 = mem[0],zero
	vmovss	112(%rbx), %xmm1        ## xmm1 = mem[0],zero,zero,zero
	vmulps	LCPI24_5(%rip), %xmm0, %xmm0
	vmulss	LCPI24_6(%rip), %xmm1, %xmm1
	vmovsd	44(%rbx), %xmm2         ## xmm2 = mem[0],zero
	vaddss	52(%rbx), %xmm1, %xmm1
	vaddps	%xmm2, %xmm0, %xmm0
	vmovaps	%xmm0, 176(%rsp)        ## 16-byte Spill
	vmovlps	%xmm0, 44(%rbx)
	vmovss	%xmm1, 52(%rbx)
	vmovss	56(%rbx), %xmm0         ## xmm0 = mem[0],zero,zero,zero
	callq	___sincosf_stret
	vmovaps	%xmm0, 128(%rsp)        ## 16-byte Spill
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vmovaps	%xmm0, 160(%rsp)        ## 16-byte Spill
	vmovss	60(%rbx), %xmm0         ## xmm0 = mem[0],zero,zero,zero
	callq	___sincosf_stret
	vmovaps	%xmm0, 112(%rsp)        ## 16-byte Spill
	vmovshdup	%xmm0, %xmm0    ## xmm0 = xmm0[1,1,3,3]
	vmovaps	%xmm0, 64(%rsp)         ## 16-byte Spill
	vmovss	64(%rbx), %xmm0         ## xmm0 = mem[0],zero,zero,zero
	callq	___sincosf_stret
	vmovaps	%xmm0, %xmm8
	vmovshdup	%xmm0, %xmm15   ## xmm15 = xmm0[1,1,3,3]
	vmovaps	64(%rsp), %xmm2         ## 16-byte Reload
	vmulss	%xmm15, %xmm2, %xmm3
	vxorps	%xmm1, %xmm1, %xmm1
	vaddss	%xmm1, %xmm3, %xmm3
	vmovss	LCPI24_7(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vmulss	%xmm0, %xmm8, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vmovaps	112(%rsp), %xmm7        ## 16-byte Reload
	vmulss	%xmm0, %xmm7, %xmm5
	vaddss	%xmm3, %xmm5, %xmm13
	vmulss	%xmm8, %xmm2, %xmm3
	vaddss	%xmm1, %xmm3, %xmm3
	vmulss	%xmm1, %xmm15, %xmm0
	vaddss	%xmm3, %xmm0, %xmm3
	vaddss	%xmm3, %xmm5, %xmm11
	vmulss	%xmm1, %xmm2, %xmm6
	vmovaps	%xmm2, %xmm12
	vaddss	%xmm1, %xmm0, %xmm3
	vmovss	%xmm0, 28(%rsp)         ## 4-byte Spill
	vsubss	%xmm8, %xmm3, %xmm3
	vaddss	%xmm1, %xmm3, %xmm2
	vmovss	%xmm2, 36(%rsp)         ## 4-byte Spill
	vmulss	%xmm15, %xmm7, %xmm5
	vmovaps	%xmm7, %xmm3
	vaddss	%xmm1, %xmm5, %xmm5
	vaddss	%xmm5, %xmm4, %xmm4
	vaddss	%xmm4, %xmm6, %xmm9
	vaddss	%xmm1, %xmm13, %xmm4
	vmulss	%xmm1, %xmm2, %xmm7
	vaddss	%xmm7, %xmm4, %xmm4
	vmulss	%xmm1, %xmm9, %xmm7
	vmovss	%xmm9, 32(%rsp)         ## 4-byte Spill
	vaddss	%xmm4, %xmm7, %xmm2
	vmovss	%xmm2, 16(%rsp)         ## 4-byte Spill
	vmulss	%xmm1, %xmm8, %xmm2
	vmovss	%xmm2, 24(%rsp)         ## 4-byte Spill
	vaddss	%xmm1, %xmm2, %xmm4
	vaddss	%xmm4, %xmm15, %xmm4
	vaddss	%xmm1, %xmm4, %xmm5
	vaddss	%xmm1, %xmm11, %xmm4
	vmulss	%xmm1, %xmm5, %xmm7
	vaddss	%xmm7, %xmm4, %xmm4
	vmulss	%xmm8, %xmm3, %xmm7
	vaddss	%xmm1, %xmm7, %xmm7
	vaddss	%xmm7, %xmm0, %xmm7
	vaddss	%xmm7, %xmm6, %xmm10
	vmovss	%xmm6, 20(%rsp)         ## 4-byte Spill
	vmulss	%xmm1, %xmm10, %xmm7
	vaddss	%xmm4, %xmm7, %xmm0
	vmovss	%xmm0, 52(%rsp)         ## 4-byte Spill
	vmulss	%xmm1, %xmm3, %xmm0
	vmovss	%xmm0, 60(%rsp)         ## 4-byte Spill
	vaddss	%xmm1, %xmm0, %xmm4
	vaddss	%xmm4, %xmm12, %xmm12
	vaddss	%xmm1, %xmm6, %xmm0
	vmovss	%xmm0, 56(%rsp)         ## 4-byte Spill
	vsubss	%xmm3, %xmm0, %xmm0
	vaddss	%xmm1, %xmm0, %xmm2
	vmulss	%xmm1, %xmm12, %xmm14
	vaddss	%xmm14, %xmm2, %xmm2
	vmovss	%xmm2, 48(%rsp)         ## 4-byte Spill
	vmulss	%xmm1, %xmm13, %xmm2
	vaddss	%xmm1, %xmm2, %xmm13
	vmovaps	160(%rsp), %xmm14       ## 16-byte Reload
	vmovss	36(%rsp), %xmm3         ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	vmulss	%xmm3, %xmm14, %xmm7
	vaddss	%xmm13, %xmm7, %xmm7
	vmovaps	128(%rsp), %xmm4        ## 16-byte Reload
	vmulss	%xmm9, %xmm4, %xmm2
	vaddss	%xmm7, %xmm2, %xmm2
	vmovss	%xmm2, 44(%rsp)         ## 4-byte Spill
	vmulss	%xmm1, %xmm11, %xmm7
	vaddss	%xmm1, %xmm7, %xmm11
	vmulss	%xmm5, %xmm14, %xmm2
	vaddss	%xmm11, %xmm2, %xmm2
	vmovaps	%xmm4, %xmm7
	vmulss	%xmm10, %xmm4, %xmm4
	vaddss	%xmm2, %xmm4, %xmm2
	vmovss	%xmm2, 40(%rsp)         ## 4-byte Spill
	vmulss	%xmm1, %xmm0, %xmm0
	vaddss	%xmm1, %xmm0, %xmm6
	vmulss	%xmm1, %xmm14, %xmm9
	vmovaps	%xmm14, %xmm4
	vaddss	%xmm6, %xmm9, %xmm2
	vmulss	%xmm12, %xmm7, %xmm14
	vaddss	%xmm2, %xmm14, %xmm14
	vmulss	%xmm7, %xmm3, %xmm2
	vmovaps	%xmm7, %xmm0
	vsubss	%xmm2, %xmm13, %xmm2
	vmulss	32(%rsp), %xmm4, %xmm7  ## 4-byte Folded Reload
	vaddss	%xmm2, %xmm7, %xmm2
	vmulss	%xmm0, %xmm5, %xmm5
	vsubss	%xmm5, %xmm11, %xmm5
	vmulss	%xmm10, %xmm4, %xmm3
	vaddss	%xmm5, %xmm3, %xmm3
	vmulss	%xmm1, %xmm0, %xmm5
	vsubss	%xmm5, %xmm6, %xmm6
	vmulss	%xmm12, %xmm4, %xmm7
	vaddss	%xmm6, %xmm7, %xmm6
	vmovss	16(%rsp), %xmm7         ## 4-byte Reload
                                        ## xmm7 = mem[0],zero,zero,zero
	vmovss	%xmm7, 116(%rbx)
	vmovss	52(%rsp), %xmm7         ## 4-byte Reload
                                        ## xmm7 = mem[0],zero,zero,zero
	vmovss	%xmm7, 120(%rbx)
	vmovss	48(%rsp), %xmm7         ## 4-byte Reload
                                        ## xmm7 = mem[0],zero,zero,zero
	vmovss	%xmm7, 124(%rbx)
	vmovss	44(%rsp), %xmm7         ## 4-byte Reload
                                        ## xmm7 = mem[0],zero,zero,zero
	vmovss	%xmm7, 128(%rbx)
	vmovss	40(%rsp), %xmm7         ## 4-byte Reload
                                        ## xmm7 = mem[0],zero,zero,zero
	vmovss	%xmm7, 132(%rbx)
	vmovss	%xmm14, 136(%rbx)
	vmovss	%xmm2, 140(%rbx)
	vmovss	%xmm3, 144(%rbx)
	vmovss	%xmm6, 148(%rbx)
	vmovss	56(%rsp), %xmm7         ## 4-byte Reload
                                        ## xmm7 = mem[0],zero,zero,zero
	vaddss	%xmm7, %xmm9, %xmm2
	vmovaps	112(%rsp), %xmm6        ## 16-byte Reload
	vmulss	%xmm6, %xmm0, %xmm3
	vaddss	%xmm2, %xmm3, %xmm14
	vmulss	LCPI24_7(%rip), %xmm0, %xmm10
	vaddss	%xmm7, %xmm10, %xmm3
	vmovaps	%xmm4, %xmm7
	vmulss	%xmm6, %xmm4, %xmm4
	vmovaps	%xmm6, %xmm2
	vaddss	%xmm3, %xmm4, %xmm3
	vmovss	%xmm3, 16(%rsp)         ## 4-byte Spill
	vaddss	%xmm1, %xmm7, %xmm3
	vmovaps	%xmm7, %xmm6
	vaddss	%xmm5, %xmm3, %xmm13
	vsubss	%xmm2, %xmm1, %xmm3
	vaddss	20(%rsp), %xmm3, %xmm2  ## 4-byte Folded Reload
	vmovss	%xmm2, 20(%rsp)         ## 4-byte Spill
	vmovaps	64(%rsp), %xmm2         ## 16-byte Reload
	vaddss	%xmm1, %xmm2, %xmm3
	vmovss	60(%rsp), %xmm4         ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	vaddss	%xmm4, %xmm3, %xmm11
	vsubss	%xmm0, %xmm1, %xmm5
	vaddss	%xmm9, %xmm5, %xmm12
	vsubss	%xmm4, %xmm1, %xmm7
	vaddss	%xmm7, %xmm9, %xmm5
	vmulss	%xmm2, %xmm0, %xmm4
	vaddss	%xmm5, %xmm4, %xmm5
	vaddss	%xmm7, %xmm10, %xmm0
	vmulss	%xmm2, %xmm6, %xmm2
	vaddss	%xmm0, %xmm2, %xmm0
	vmovss	%xmm0, 112(%rsp)        ## 4-byte Spill
	vmulss	%xmm11, %xmm15, %xmm0
	vaddss	%xmm1, %xmm0, %xmm0
	vsubss	24(%rsp), %xmm0, %xmm9  ## 4-byte Folded Reload
	vmovaps	%xmm14, %xmm6
	vmulss	%xmm14, %xmm15, %xmm2
	vaddss	%xmm1, %xmm2, %xmm2
	vmulss	%xmm8, %xmm13, %xmm7
	vsubss	%xmm7, %xmm2, %xmm14
	vmovss	16(%rsp), %xmm3         ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	vmulss	%xmm3, %xmm15, %xmm7
	vaddss	%xmm1, %xmm7, %xmm7
	vmulss	%xmm8, %xmm12, %xmm4
	vsubss	%xmm4, %xmm7, %xmm10
	vmulss	%xmm11, %xmm8, %xmm7
	vaddss	%xmm1, %xmm7, %xmm7
	vaddss	28(%rsp), %xmm7, %xmm0  ## 4-byte Folded Reload
	vmovss	20(%rsp), %xmm4         ## 4-byte Reload
                                        ## xmm4 = mem[0],zero,zero,zero
	vmulss	%xmm1, %xmm4, %xmm2
	vaddss	%xmm9, %xmm2, %xmm7
	vmovss	%xmm7, 24(%rsp)         ## 4-byte Spill
	vaddss	%xmm0, %xmm2, %xmm0
	vmovss	%xmm0, 28(%rsp)         ## 4-byte Spill
	vmulss	%xmm6, %xmm8, %xmm0
	vmovaps	%xmm6, %xmm9
	vaddss	%xmm1, %xmm0, %xmm0
	vmulss	%xmm13, %xmm15, %xmm2
	vaddss	%xmm0, %xmm2, %xmm0
	vmulss	%xmm1, %xmm5, %xmm2
	vaddss	%xmm14, %xmm2, %xmm6
	vmovss	%xmm6, 64(%rsp)         ## 4-byte Spill
	vaddss	%xmm0, %xmm2, %xmm0
	vmovss	%xmm0, 128(%rsp)        ## 4-byte Spill
	vmulss	%xmm3, %xmm8, %xmm0
	vmovaps	%xmm3, %xmm7
	vaddss	%xmm1, %xmm0, %xmm0
	vmulss	%xmm12, %xmm15, %xmm2
	vaddss	%xmm0, %xmm2, %xmm0
	vmovss	112(%rsp), %xmm8        ## 4-byte Reload
                                        ## xmm8 = mem[0],zero,zero,zero
	vmulss	%xmm1, %xmm8, %xmm2
	vaddss	%xmm10, %xmm2, %xmm6
	vaddss	%xmm0, %xmm2, %xmm10
	vmulss	%xmm1, %xmm11, %xmm0
	vaddss	%xmm1, %xmm0, %xmm0
	vaddss	%xmm0, %xmm4, %xmm14
	vmulss	%xmm1, %xmm9, %xmm3
	vaddss	%xmm1, %xmm3, %xmm3
	vmulss	%xmm1, %xmm13, %xmm4
	vaddss	%xmm3, %xmm4, %xmm3
	vaddss	%xmm3, %xmm5, %xmm13
	vmulss	%xmm1, %xmm7, %xmm4
	vaddss	%xmm1, %xmm4, %xmm4
	vmulss	%xmm1, %xmm12, %xmm5
	vaddss	%xmm4, %xmm5, %xmm4
	vaddss	%xmm4, %xmm8, %xmm4
	vmovss	24(%rsp), %xmm3         ## 4-byte Reload
                                        ## xmm3 = mem[0],zero,zero,zero
	vmovss	%xmm3, 152(%rbx)
	vmovss	64(%rsp), %xmm0         ## 4-byte Reload
                                        ## xmm0 = mem[0],zero,zero,zero
	vmovss	%xmm0, 156(%rbx)
	vmovss	%xmm6, 160(%rbx)
	vmovss	28(%rsp), %xmm12        ## 4-byte Reload
                                        ## xmm12 = mem[0],zero,zero,zero
	vmovss	%xmm12, 164(%rbx)
	vmovss	128(%rsp), %xmm8        ## 4-byte Reload
                                        ## xmm8 = mem[0],zero,zero,zero
	vmovss	%xmm8, 168(%rbx)
	vmovss	%xmm10, 172(%rbx)
	vmovss	%xmm14, 176(%rbx)
	vmovss	%xmm13, 180(%rbx)
	vmovss	%xmm4, 184(%rbx)
	vmulss	%xmm1, %xmm3, %xmm5
	vmovaps	%xmm3, %xmm9
	vaddss	%xmm1, %xmm5, %xmm11
	vmulss	%xmm1, %xmm0, %xmm3
	vaddss	%xmm3, %xmm11, %xmm7
	vsubss	%xmm6, %xmm7, %xmm7
	vmulss	%xmm1, %xmm12, %xmm5
	vaddss	%xmm1, %xmm5, %xmm15
	vmulss	%xmm1, %xmm8, %xmm0
	vaddss	%xmm0, %xmm15, %xmm2
	vsubss	%xmm10, %xmm2, %xmm2
	vinsertps	$16, %xmm2, %xmm7, %xmm2 ## xmm2 = xmm7[0],xmm2[0],xmm7[2,3]
	vmulss	%xmm1, %xmm14, %xmm7
	vaddss	%xmm1, %xmm7, %xmm7
	vmovlps	%xmm2, 92(%rbx)
	vmulss	%xmm1, %xmm13, %xmm2
	vaddss	%xmm2, %xmm7, %xmm5
	vsubss	%xmm4, %xmm5, %xmm5
	vmovss	%xmm5, 100(%rbx)
	vaddss	%xmm1, %xmm9, %xmm5
	vaddss	%xmm3, %xmm5, %xmm3
	vaddss	%xmm1, %xmm12, %xmm5
	vaddss	%xmm0, %xmm5, %xmm0
	vmulss	%xmm1, %xmm6, %xmm5
	vaddss	%xmm3, %xmm5, %xmm3
	vmulss	%xmm1, %xmm10, %xmm6
	vaddss	%xmm0, %xmm6, %xmm0
	vinsertps	$16, %xmm0, %xmm3, %xmm0 ## xmm0 = xmm3[0],xmm0[0],xmm3[2,3]
	vaddss	%xmm1, %xmm14, %xmm3
	vaddss	%xmm2, %xmm3, %xmm2
	vmulss	%xmm1, %xmm4, %xmm1
	vmovlps	%xmm0, 68(%rbx)
	vaddss	%xmm2, %xmm1, %xmm0
	vmovss	%xmm0, 76(%rbx)
	vaddss	64(%rsp), %xmm11, %xmm0 ## 4-byte Folded Reload
	vaddss	%xmm5, %xmm0, %xmm0
	vaddss	%xmm8, %xmm15, %xmm2
	vaddss	%xmm6, %xmm2, %xmm2
	vinsertps	$16, %xmm2, %xmm0, %xmm0 ## xmm0 = xmm0[0],xmm2[0],xmm0[2,3]
	vaddss	%xmm13, %xmm7, %xmm2
	vaddss	%xmm1, %xmm2, %xmm1
	vmovlps	%xmm0, 80(%rbx)
	vmovss	%xmm1, 88(%rbx)
	vmovss	196(%rbx), %xmm0        ## xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	vmulsd	LCPI24_8(%rip), %xmm0, %xmm0
	callq	___sincos_stret
	vmovsd	LCPI24_9(%rip), %xmm2   ## xmm2 = mem[0],zero
	vmulsd	%xmm2, %xmm1, %xmm1
	vcvtsd2ss	%xmm1, %xmm1, %xmm1
	vmulsd	%xmm2, %xmm0, %xmm0
	vaddsd	LCPI24_10(%rip), %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vblendps	$14, LCPI24_11(%rip), %xmm1, %xmm1 ## xmm1 = xmm1[0],mem[1,2,3]
	movl	52(%rbx), %r8d
	movl	184(%rbx), %eax
	movl	%eax, 224(%rsp)
	vmovups	152(%rbx), %ymm2
	vmovups	%ymm2, 192(%rsp)
	movslq	6280(%rbx), %rax
	movslq	6284(%rbx), %r9
	imulq	%rax, %r9
	testl	%r9d, %r9d
	jle	LBB24_20
## %bb.6:
	leaq	6316(%rbx), %rdx
	movq	6304(%rbx), %rsi
	cmpl	$32, %r9d
	jb	LBB24_7
## %bb.8:
	leaq	6317(%rbx), %rax
	cmpq	%rsi, %rax
	jbe	LBB24_11
## %bb.9:
	leaq	(%rsi,%r9,4), %rax
	cmpq	%rax, %rdx
	jae	LBB24_11
LBB24_7:
	xorl	%edi, %edi
LBB24_14:
	movq	%rdi, %r10
	notq	%r10
	addq	%r9, %r10
	movq	%r9, %rax
	andq	$7, %rax
	je	LBB24_17
## %bb.15:
	negq	%rax
	.p2align	4, 0x90
LBB24_16:                               ## =>This Inner Loop Header: Depth=1
	movl	(%rdx), %ecx
	movl	%ecx, (%rsi,%rdi,4)
	incq	%rdi
	incq	%rax
	jne	LBB24_16
LBB24_17:
	cmpq	$7, %r10
	jb	LBB24_20
## %bb.18:
	movq	%r9, %rcx
	subq	%rdi, %rcx
	leaq	28(%rsi,%rdi,4), %rsi
	xorl	%edi, %edi
	.p2align	4, 0x90
LBB24_19:                               ## =>This Inner Loop Header: Depth=1
	movl	(%rdx), %eax
	movl	%eax, -28(%rsi,%rdi,4)
	movl	(%rdx), %eax
	movl	%eax, -24(%rsi,%rdi,4)
	movl	(%rdx), %eax
	movl	%eax, -20(%rsi,%rdi,4)
	movl	(%rdx), %eax
	movl	%eax, -16(%rsi,%rdi,4)
	movl	(%rdx), %eax
	movl	%eax, -12(%rsi,%rdi,4)
	movl	(%rdx), %eax
	movl	%eax, -8(%rsi,%rdi,4)
	movl	(%rdx), %eax
	movl	%eax, -4(%rsi,%rdi,4)
	movl	(%rdx), %eax
	movl	%eax, (%rsi,%rdi,4)
	addq	$8, %rdi
	cmpq	%rdi, %rcx
	jne	LBB24_19
	jmp	LBB24_20
LBB24_11:
	movq	%r9, %rdi
	andq	$-32, %rdi
	vbroadcastss	(%rdx), %ymm2
	xorl	%eax, %eax
	.p2align	4, 0x90
LBB24_12:                               ## =>This Inner Loop Header: Depth=1
	vmovups	%ymm2, (%rsi,%rax,4)
	vmovups	%ymm2, 32(%rsi,%rax,4)
	vmovups	%ymm2, 64(%rsi,%rax,4)
	vmovups	%ymm2, 96(%rsi,%rax,4)
	addq	$32, %rax
	cmpq	%rax, %rdi
	jne	LBB24_12
## %bb.13:
	cmpq	%r9, %rdi
	jne	LBB24_14
LBB24_20:
	leaq	6256(%rbx), %r14
	movl	$0, 6448(%rbx)
	vxorps	%xmm4, %xmm4, %xmm4
	vmovups	%ymm4, 7192(%rbx)
	vmovups	%ymm4, 7160(%rbx)
	vmovups	%ymm4, 7128(%rbx)
	vmovups	%ymm4, 7096(%rbx)
	vmovups	%ymm4, 7064(%rbx)
	vmovups	%ymm4, 7032(%rbx)
	vmovups	%ymm4, 7000(%rbx)
	vmovups	%ymm4, 6968(%rbx)
	vmovaps	176(%rsp), %xmm2        ## 16-byte Reload
	vmovlps	%xmm2, 6320(%rbx)
	movl	%r8d, 6328(%rbx)
	vmovups	192(%rsp), %ymm2
	vmovups	%ymm2, 6332(%rbx)
	movl	224(%rsp), %eax
	movl	%eax, 6364(%rbx)
	vmovups	6332(%rbx), %ymm2
	vperm2f128	$1, %ymm0, %ymm2, %ymm3 ## ymm3 = ymm2[2,3,0,1]
	vshufps	$18, %ymm2, %ymm3, %ymm3 ## ymm3 = ymm3[2,0],ymm2[1,0],ymm3[6,4],ymm2[5,4]
	vshufps	$140, %ymm3, %ymm2, %ymm2 ## ymm2 = ymm2[0,3],ymm3[0,2],ymm2[4,7],ymm3[4,6]
	vmovups	%ymm2, 6368(%rbx)
	movl	%eax, 6400(%rbx)
	vmovlps	%xmm1, 7256(%rbx)
	vmovss	%xmm0, 7264(%rbx)
	testl	%r9d, %r9d
	jle	LBB24_23
## %bb.21:
	movq	6296(%rbx), %rax
	xorl	%ecx, %ecx
	.p2align	4, 0x90
LBB24_22:                               ## =>This Inner Loop Header: Depth=1
	movl	$-2050169344, (%rax,%rcx,4) ## imm = 0x85CCE600
	incq	%rcx
	movslq	6280(%rbx), %rdx
	movslq	6284(%rbx), %rsi
	imulq	%rdx, %rsi
	cmpq	%rsi, %rcx
	jl	LBB24_22
LBB24_23:
	vmovaps	%ymm4, 192(%rsp)
	vmovaps	%ymm4, 224(%rsp)
	vmovaps	%ymm4, 256(%rsp)
	vmovaps	%ymm4, 288(%rsp)
	vmovaps	%ymm4, 320(%rsp)
	movq	$0, 352(%rsp)
	vmovsd	LCPI24_12(%rip), %xmm0  ## xmm0 = mem[0],zero
	vmovsd	%xmm0, 192(%rsp)
	movl	$1148846080, 200(%rsp)  ## imm = 0x447A0000
	vmovsd	LCPI24_13(%rip), %xmm0  ## xmm0 = mem[0],zero
	vmovsd	%xmm0, 204(%rsp)
	movl	$1148846080, 212(%rsp)  ## imm = 0x447A0000
	vmovsd	%xmm0, 216(%rsp)
	movl	$-998637568, 224(%rsp)  ## imm = 0xC47A0000
	vmovss	LCPI24_3(%rip), %xmm0   ## xmm0 = mem[0],zero,zero,zero
	vxorps	%xmm1, %xmm1, %xmm1
	vmovlhps	%xmm0, %xmm1, %xmm0 ## xmm0 = xmm1[0],xmm0[0]
	vmovups	%xmm0, 264(%rsp)
	vmovaps	LCPI24_14(%rip), %xmm0  ## xmm0 = <1.0E+3,1.0E+3,u,u>
	vmovlps	%xmm0, 280(%rsp)
	vmovsd	LCPI24_15(%rip), %xmm0  ## xmm0 = mem[0],zero
	vmovsd	%xmm0, 296(%rsp)
	movl	$1058642330, 304(%rsp)  ## imm = 0x3F19999A
	vmovsd	LCPI24_16(%rip), %xmm0  ## xmm0 = mem[0],zero
	vmovsd	%xmm0, 252(%rsp)
	movl	$0, 260(%rsp)
	movl	260(%rsp), %eax
	movl	%eax, 248(%rsp)
	movq	252(%rsp), %rcx
	movq	%rcx, 240(%rsp)
	movl	%eax, 236(%rsp)
	movq	%rcx, 228(%rsp)
	leaq	296(%rbx), %r15
	movq	%r15, 288(%rsp)
	leaq	192(%rsp), %rsi
	movq	%r14, %rdi
	vzeroupper
	callq	__Z13push_triangleP14Render_ContextP8Triangle
	vxorps	%xmm0, %xmm0, %xmm0
	vmovaps	%ymm0, 192(%rsp)
	vmovaps	%ymm0, 224(%rsp)
	vmovaps	%ymm0, 256(%rsp)
	vmovaps	%ymm0, 288(%rsp)
	vmovaps	%ymm0, 320(%rsp)
	movq	$0, 352(%rsp)
	vmovsd	LCPI24_12(%rip), %xmm0  ## xmm0 = mem[0],zero
	vmovsd	%xmm0, 192(%rsp)
	movl	$1148846080, 200(%rsp)  ## imm = 0x447A0000
	vmovsd	LCPI24_13(%rip), %xmm1  ## xmm1 = mem[0],zero
	vmovsd	%xmm1, 204(%rsp)
	movl	$-998637568, 212(%rsp)  ## imm = 0xC47A0000
	vmovsd	%xmm0, 216(%rsp)
	movl	$-998637568, 224(%rsp)  ## imm = 0xC47A0000
	vxorps	%xmm0, %xmm0, %xmm0
	vunpcklpd	LCPI24_14(%rip), %xmm0, %xmm0 ## xmm0 = xmm0[0],mem[0]
	vmovups	%xmm0, 264(%rsp)
	vmovsd	LCPI24_17(%rip), %xmm0  ## xmm0 = mem[0],zero
	vmovsd	%xmm0, 280(%rsp)
	vmovsd	LCPI24_15(%rip), %xmm0  ## xmm0 = mem[0],zero
	vmovsd	%xmm0, 296(%rsp)
	movl	$1058642330, 304(%rsp)  ## imm = 0x3F19999A
	vmovsd	LCPI24_18(%rip), %xmm0  ## xmm0 = mem[0],zero
	vmovsd	%xmm0, 252(%rsp)
	movl	$0, 260(%rsp)
	movl	260(%rsp), %eax
	movl	%eax, 248(%rsp)
	movq	252(%rsp), %rcx
	movq	%rcx, 240(%rsp)
	movl	%eax, 236(%rsp)
	movq	%rcx, 228(%rsp)
	movq	%r15, 288(%rsp)
	leaq	192(%rsp), %rsi
	movq	%r14, %rdi
	vzeroupper
	callq	__Z13push_triangleP14Render_ContextP8Triangle
	leaq	416(%rbx), %rsi
	vmovss	196(%rbx), %xmm0        ## xmm0 = mem[0],zero,zero,zero
	vaddss	%xmm0, %xmm0, %xmm0
	vblendps	$14, LCPI24_33(%rip), %xmm0, %xmm4 ## xmm4 = xmm0[0],mem[1,2,3]
	vmovaps	LCPI24_19(%rip), %xmm0  ## xmm0 = <-1.0E+0,1.0E+0,u,u>
	vmovaps	LCPI24_20(%rip), %xmm2  ## xmm2 = <1.0E+0,1.0E+0,u,u>
	vmovaps	LCPI24_21(%rip), %xmm6  ## xmm6 = <5.0E-1,8.00000011E-1,u,u>
	vmovss	LCPI24_22(%rip), %xmm1  ## xmm1 = mem[0],zero,zero,zero
	vmovss	LCPI24_23(%rip), %xmm3  ## xmm3 = mem[0],zero,zero,zero
	vmovss	LCPI24_24(%rip), %xmm7  ## xmm7 = mem[0],zero,zero,zero
	vxorps	%xmm5, %xmm5, %xmm5
	movq	%r14, %rdi
	callq	__Z9push_meshP14Render_ContextP4Mesh2v3S3_S3_S3_
	leaq	368(%rbx), %rsi
	vmovss	196(%rbx), %xmm5        ## xmm5 = mem[0],zero,zero,zero
	vpermilps	$0, %xmm5, %xmm4 ## xmm4 = xmm5[0,0,0,0]
	vmovaps	LCPI24_25(%rip), %xmm0  ## xmm0 = <1.0E+0,1.5E+0,u,u>
	vmovss	LCPI24_26(%rip), %xmm1  ## xmm1 = mem[0],zero,zero,zero
	movq	%r14, %rdi
	vmovaps	LCPI24_20(%rip), %xmm2  ## xmm2 = <1.0E+0,1.0E+0,u,u>
	vmovss	LCPI24_23(%rip), %xmm3  ## xmm3 = mem[0],zero,zero,zero
	vmovaps	%xmm2, %xmm6
	vmovaps	%xmm3, %xmm7
	callq	__Z9push_meshP14Render_ContextP4Mesh2v3S3_S3_S3_
	leaq	464(%rbx), %rsi
	vmovaps	LCPI24_27(%rip), %xmm0  ## xmm0 = <0.0E+0,-5.0E-1,u,u>
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	movq	%r14, %rdi
	vmovss	LCPI24_26(%rip), %xmm1  ## xmm1 = mem[0],zero,zero,zero
	vmovaps	LCPI24_20(%rip), %xmm2  ## xmm2 = <1.0E+0,1.0E+0,u,u>
	vmovss	LCPI24_23(%rip), %xmm3  ## xmm3 = mem[0],zero,zero,zero
	vmovaps	%xmm2, %xmm6
	vmovaps	%xmm3, %xmm7
	callq	__Z9push_meshP14Render_ContextP4Mesh2v3S3_S3_S3_
	leaq	560(%rbx), %rsi
	vmovaps	LCPI24_28(%rip), %xmm0  ## xmm0 = <-2.0E+0,1.0E+0,u,u>
	vxorps	%xmm4, %xmm4, %xmm4
	vxorps	%xmm5, %xmm5, %xmm5
	movq	%r14, %rdi
	vmovss	LCPI24_26(%rip), %xmm1  ## xmm1 = mem[0],zero,zero,zero
	vmovaps	LCPI24_20(%rip), %xmm2  ## xmm2 = <1.0E+0,1.0E+0,u,u>
	vmovss	LCPI24_23(%rip), %xmm3  ## xmm3 = mem[0],zero,zero,zero
	vmovaps	%xmm2, %xmm6
	vmovaps	%xmm3, %xmm7
	callq	__Z9push_meshP14Render_ContextP4Mesh2v3S3_S3_S3_
	vmovsd	7256(%rbx), %xmm0       ## xmm0 = mem[0],zero
	vmovss	7264(%rbx), %xmm1       ## xmm1 = mem[0],zero,zero,zero
	vmovsd	LCPI24_29(%rip), %xmm2  ## xmm2 = mem[0],zero
	vmovsd	%xmm2, 96(%rsp)
	movl	$1036831949, 104(%rsp)  ## imm = 0x3DCCCCCD
	vmovaps	LCPI24_20(%rip), %xmm2  ## xmm2 = <1.0E+0,1.0E+0,u,u>
	vmovlps	%xmm2, 80(%rsp)
	movl	$1065353216, 88(%rsp)   ## imm = 0x3F800000
	movl	88(%rsp), %eax
	movq	80(%rsp), %rcx
	movl	104(%rsp), %r8d
	movq	96(%rsp), %r9
	vmovsd	LCPI24_18(%rip), %xmm2  ## xmm2 = mem[0],zero
	vmovddup	%xmm2, %xmm4    ## xmm4 = xmm2[0,0]
	vmovss	LCPI24_30(%rip), %xmm7  ## xmm7 = mem[0],zero,zero,zero
	vxorps	%xmm3, %xmm3, %xmm3
	vxorps	%xmm5, %xmm5, %xmm5
	vxorps	%xmm6, %xmm6, %xmm6
	movq	%r14, %rdi
	vmovss	LCPI24_23(%rip), %xmm2  ## xmm2 = mem[0],zero,zero,zero
	movl	$0, %esi
	movl	$0, %edx
	pushq	%rax
	pushq	%rcx
	pushq	%r8
	pushq	%r9
	callq	__Z9push_cubeP14Render_Context2v3S1_S1_S1_S1_S1_P7TextureS3_
	addq	$32, %rsp
	movq	%r14, %rdi
	callq	__Z10end_renderP14Render_Context
	leaq	192(%rsp), %rsi
	movl	$6, %edi
	callq	_clock_gettime
	movq	192(%rsp), %rax
	movq	200(%rsp), %rcx
	subq	144(%rsp), %rax
	vcvtsi2sdq	%rax, %xmm8, %xmm0
	vmulsd	LCPI24_31(%rip), %xmm0, %xmm0
	subq	152(%rsp), %rcx
	vcvtsi2sdq	%rcx, %xmm8, %xmm1
	vdivsd	LCPI24_32(%rip), %xmm1, %xmm1
	vaddsd	%xmm1, %xmm0, %xmm0
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, 40(%rbx)
	movl	204(%rbx), %eax
	testl	%eax, %eax
	je	LBB24_25
## %bb.24:
	vaddss	200(%rbx), %xmm0, %xmm0
	vmovss	%xmm0, 200(%rbx)
LBB24_25:
	vmovss	196(%rbx), %xmm0        ## xmm0 = mem[0],zero,zero,zero
	vaddss	LCPI24_6(%rip), %xmm0, %xmm0
	vmovss	%xmm0, 196(%rbx)
	incl	%eax
	movl	%eax, 204(%rbx)
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	cmpq	1288(%rsp), %rax
	jne	LBB24_27
## %bb.26:
	leaq	-32(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r14
	popq	%r15
	popq	%rbp
	retq
LBB24_27:
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

L___func__._Z18new_render_context7Texturefffi: ## @__func__._Z18new_render_context7Texturefffi
	.asciz	"new_render_context"

L_.str.5:                               ## @.str.5
	.asciz	"./renderer.cpp"

L_.str.7:                               ## @.str.7
	.asciz	"r.buffer_aa.pixels && r.triangles"

L___func__._Z13push_triangleP14Render_ContextP8Triangle: ## @__func__._Z13push_triangleP14Render_ContextP8Triangle
	.asciz	"push_triangle"

L_.str.8:                               ## @.str.8
	.asciz	"r->triangle_count < r->max_triangle_count"

L___func__._Z9load_meshPKcP7Texture:    ## @__func__._Z9load_meshPKcP7Texture
	.asciz	"load_mesh"

L_.str.9:                               ## @.str.9
	.asciz	"game.cpp"

L_.str.10:                              ## @.str.10
	.asciz	"vertex_count < max_vertices_count"

L_.str.11:                              ## @.str.11
	.asciz	"mesh.triangle_count < max_triangle_count"

L_.str.12:                              ## @.str.12
	.asciz	"f0[0] > 0 && f1[0] > 0 && f2[0] > 0"

L_.str.13:                              ## @.str.13
	.asciz	"f0[1] > 0 && f1[1] > 0 && f2[1] > 0"

L_.str.14:                              ## @.str.14
	.asciz	"f0[2] > 0 && f1[2] > 0 && f2[2] > 0"

L_.str.15:                              ## @.str.15
	.asciz	"loaded %d triangles\n"

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
