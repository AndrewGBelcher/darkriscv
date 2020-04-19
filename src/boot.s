	.file	"boot.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.align	2
	.globl	boot
	.type	boot, @function
boot:
	ssst
	lui	a5,%hi(threads)
	addi	sp,sp,-12
	sw	s0,4(sp)
	lw	s0,%lo(threads)(a5)
	sw	ra,8(sp)
	addi	a4,s0,1
	andi	s0,s0,1
	addi	a0,s0,48
	sw	a4,%lo(threads)(a5)
	call	putchar
	lui	a5,%hi(io)
	addi	a5,a5,%lo(io)
	bne	s0,zero,.L2
	li	a4,49
	sw	a4,0(sp)
	li	a4,1
	sw	a4,12(a5)
.L3:
	call	main
	j	.L3
.L2:
	lw	a4,0(sp)
	li	a3,625
	sw	a4,12(a5)
.L4:
	mv	a4,a3
 #APP
# 44 "boot.c" 1
	1: nop             
   nop             
   nop             
   nop             
   addi a4, a4, -1 
   bnez a4, 1b     

# 0 "" 2
 #NO_APP
	lhu	a4,8(a5)
	slli	a4,a4,16
	srli	a4,a4,16
	xori	a4,a4,1
	sh	a4,8(a5)
	lhu	a4,10(a5)
	slli	a4,a4,16
	srli	a4,a4,16
	xori	a4,a4,1
	sh	a4,10(a5)
	sb	zero,3(a5)
	j	.L4
	.size	boot, .-boot
	.ident	"GCC: (GNU) 9.2.0"
