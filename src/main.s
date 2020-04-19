	.file	"main.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.align	2
	.globl	test_call
	.type	test_call, @function
test_call:
	ssst
 #APP
# 43 "main.c" 1
	ssst
# 0 "" 2
# 45 "main.c" 1
	lui ra,44
# 0 "" 2
# 46 "main.c" 1
	ssld
# 0 "" 2
 #NO_APP
	ssld
	ret
	.size	test_call, .-test_call
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"\nDarkRiscv!\n\n"
	.align	2
.LC1:
	.string	" "
	.align	2
.LC2:
	.string	"clear"
	.align	2
.LC3:
	.string	"atros"
	.align	2
.LC4:
	.string	"dump"
	.align	2
.LC5:
	.string	"rd"
	.align	2
.LC6:
	.string	"wr"
	.align	2
.LC7:
	.string	"led"
	.align	2
.LC8:
	.string	"timer"
	.align	2
.LC9:
	.string	"gpio"
	.align	2
.LC10:
	.string	"mul"
	.align	2
.LC11:
	.string	"div"
	.align	2
.LC12:
	.string	"mac"
	.align	2
.LC13:
	.string	"sstest"
	.align	2
.LC14:
	.string	"call"
	.align	2
.LC15:
	.string	"\nrecovery worked!\n\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	ssst
	lui	a0,%hi(.LC0)
	addi	sp,sp,-116
	addi	a0,a0,%lo(.LC0)
	sw	s1,104(sp)
	sw	ra,112(sp)
	sw	s0,108(sp)
	call	putstr
	lui	a5,%hi(threads)
	sw	zero,%lo(threads)(a5)
	lui	s1,%hi(.LC1)
.L28:
	li	a2,64
	li	a1,0
	addi	a0,sp,40
	call	memset
	li	a1,64
	addi	a0,sp,40
	call	gets
	li	s0,0
	addi	a0,sp,40
.L4:
	addi	a1,s1,%lo(.LC1)
	call	strtok
	slli	a5,s0,2
	addi	a4,sp,104
	add	a5,a4,a5
	sw	a0,-96(a5)
	beq	a0,zero,.L5
	addi	s0,s0,1
	li	a5,8
	li	a0,0
	bne	s0,a5,.L4
.L5:
	lw	s0,8(sp)
	beq	s0,zero,.L28
	lui	a1,%hi(.LC2)
	addi	a1,a1,%lo(.LC2)
	mv	a0,s0
	call	strcmp
	beq	a0,zero,.L28
	lui	a1,%hi(.LC3)
	addi	a1,a1,%lo(.LC3)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L10
	call	banner
	j	.L28
.L10:
	lui	a1,%hi(.LC4)
	addi	a1,a1,%lo(.LC4)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L11
	lw	s0,12(sp)
	beq	s0,zero,.L12
	mv	a0,s0
	call	xtoi
	mv	s0,a0
.L12:
	addi	a5,s0,256
	sw	a5,0(sp)
	j	.L15
.L14:
	add	a3,s0,a4
	lbu	a0,0(a3)
	li	a2,94
	addi	a3,a0,-32
	andi	a3,a3,0xff
	bleu	a3,a2,.L13
	li	a0,46
.L13:
	sw	a4,4(sp)
	call	putchar
	lw	a4,4(sp)
	li	a3,16
	addi	a4,a4,1
	bne	a4,a3,.L14
	li	a0,10
	call	putchar
	lw	a5,0(sp)
	addi	s0,s0,16
	beq	a5,s0,.L28
.L15:
	li	a4,0
	j	.L14
.L11:
	lui	a1,%hi(.LC5)
	li	a2,2
	addi	a1,a1,%lo(.LC5)
	mv	a0,s0
	call	strncmp
	beq	a0,zero,.L16
	lui	a1,%hi(.LC6)
	li	a2,2
	addi	a1,a1,%lo(.LC6)
	mv	a0,s0
	call	strncmp
	bne	a0,zero,.L17
.L16:
	lbu	a4,2(s0)
	li	a5,109
	bne	a4,a5,.L30
	lw	a0,12(sp)
	call	xtoi
	mv	a4,a0
	li	a5,2
.L19:
	addi	a4,a4,-1
	li	a3,-1
	beq	a4,a3,.L28
	lbu	a2,0(s0)
	li	a3,114
	beq	a2,a3,.L19
	addi	a3,a5,1
	sw	a4,4(sp)
	slli	a5,a5,2
	addi	a4,sp,104
	add	a5,a4,a5
	lw	a0,-96(a5)
	sw	a3,0(sp)
	call	xtoi
	lw	a3,0(sp)
	lw	a4,4(sp)
	mv	a5,a3
	j	.L19
.L30:
	li	a5,1
	li	a4,1
	j	.L19
.L17:
	lui	a1,%hi(.LC7)
	addi	a1,a1,%lo(.LC7)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L22
	lw	a0,12(sp)
	beq	a0,zero,.L28
	call	xtoi
	slli	a0,a0,16
	lui	a5,%hi(io)
	srli	a0,a0,16
	addi	a5,a5,%lo(io)
	sh	a0,8(a5)
	j	.L28
.L22:
	lui	a1,%hi(.LC8)
	addi	a1,a1,%lo(.LC8)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L23
	lw	a0,12(sp)
	beq	a0,zero,.L28
	call	atoi
	lui	a5,%hi(io)
	addi	a5,a5,%lo(io)
	sw	a0,12(a5)
	j	.L28
.L23:
	lui	a1,%hi(.LC9)
	addi	a1,a1,%lo(.LC9)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L24
	lw	a0,12(sp)
	beq	a0,zero,.L28
	call	xtoi
	slli	a0,a0,16
	lui	a5,%hi(io)
	srli	a0,a0,16
	addi	a5,a5,%lo(io)
	sh	a0,10(a5)
	j	.L28
.L24:
	lui	a1,%hi(.LC10)
	addi	a1,a1,%lo(.LC10)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L25
.L26:
	lw	a0,12(sp)
	call	atoi
	lw	a0,16(sp)
.L55:
	call	atoi
	j	.L28
.L25:
	lui	a1,%hi(.LC11)
	addi	a1,a1,%lo(.LC11)
	mv	a0,s0
	call	strcmp
	beq	a0,zero,.L26
	lui	a1,%hi(.LC12)
	addi	a1,a1,%lo(.LC12)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L27
	lw	a0,12(sp)
	call	atoi
	lw	a0,16(sp)
	call	atoi
	lw	a0,20(sp)
	j	.L55
.L27:
	lui	a1,%hi(.LC13)
	addi	a1,a1,%lo(.LC13)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L28
	lw	a0,12(sp)
	lui	a1,%hi(.LC14)
	addi	a1,a1,%lo(.LC14)
	call	strcmp
	bne	a0,zero,.L28
	call	test_call
	lui	a0,%hi(.LC15)
	addi	a0,a0,%lo(.LC15)
	call	putstr
	j	.L28
	.size	main, .-main
	.globl	opts
	.globl	port
	.globl	ip
	.globl	test
	.section	.sdata,"aw"
	.align	2
	.type	opts, @object
	.size	opts, 2
opts:
	.half	-21555
	.type	port, @object
	.size	port, 2
port:
	.half	3128
	.type	ip, @object
	.size	ip, 4
ip:
	.word	-1408237567
	.type	test, @object
	.size	test, 4
test:
	.word	305419896
	.ident	"GCC: (GNU) 9.2.0"
