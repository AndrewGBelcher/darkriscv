	.file	"banner.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"  char rle_logo[] = {"
	.align	2
.LC1:
	.ascii	"              vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv\n            "
	.ascii	"      vvvvvvvvvvvvvvvvvvvvvvvvvvvv\nrrrrrrrrrrrrr       vvvv"
	.ascii	"vvvvvvvvvvvvvvvvvvvvvv\nrrrrrrrrrrrrrrrr      vvvvvvvvvvvvvv"
	.ascii	"vvvvvvvvvv\nrrrrrrrrrrrrrrrrrr    vvvvvvvvvvvvvvvvvvvvvvvv\n"
	.ascii	"rrrrrrrrrrrrrrrrrr    vvvvvvvvvvvvvvvvvvvvvvvv\nrrrrrrrrrrrr"
	.ascii	"rrrrrr    vvvvvvvvvvvvvvvvvvvvvvvv\nrrrrrrrrrrrrrrrr      vv"
	.ascii	"vvvvvvvvvvvvvvvvvvvv  \nrrrrrrrrrrrrr       vvvvvvvvvvvvvvvv"
	.ascii	"vvvvvv    \nrr                vvvvvvvvvvvvvvvvvvvvvv      \n"
	.ascii	"rr            vvvvvvvvvvvvvvvvvvvvvvvv      rr\nrrrr      vv"
	.ascii	"vvvvvvvvvvvvvvvvvvvvvvvv      rrrr\nrrrrrr      vvvvvvvvvvvv"
	.ascii	"vvvvvvvvvv      rrrrrr\nrrrrrrrr      vvvvvvvvvvvvvvvvvv    "
	.ascii	"  rrrrrrrr\nrrrrrrrrrr      vvvvvvvvvvvvvv      rrrrrrrrrr\n"
	.ascii	"rrrrrrrrrrrr      vvvvvvvvvv      rrrrrrrrrrrr\nrrrrrrrrrrrr"
	.ascii	"rr      v"
	.string	"vvvvv      rrrrrrrrrrrrrr\nrrrrrrrrrrrrrrrr      vv      rrrrrrrrrrrrrrrr\nrrrrrrrrrrrrrrrrrr          rrrrrrrrrrrrrrrrrr\nrrrrrrrrrrrrrrrrrrrr      rrrrrrrrrrrrrrrrrrrr\nrrrrrrrrrrrrrrrrrrrrrr  rrrrrrrrrrrrrrrrrrrrrr\n\n       INSTRUCTION SETS WANT TO BE FREE\n\n"
	.align	2
.LC2:
	.string	"0x%x, 0x%x, "
	.align	2
.LC3:
	.string	"0x00 };"
	.text
	.align	2
	.globl	banner
	.type	banner, @function
banner:
	ssst
	lui	a0,%hi(.LC0)
	addi	sp,sp,-12
	addi	a0,a0,%lo(.LC0)
	sw	s0,4(sp)
	sw	ra,8(sp)
	sw	s1,0(sp)
	lui	s0,%hi(.LC1)
	call	puts
	addi	s0,s0,%lo(.LC1)
	li	a2,0
	li	a1,0
	lui	a5,%hi(.LC2)
.L6:
	lbu	s1,0(s0)
	beq	s1,a1,.L2
	beq	a1,zero,.L3
	addi	a0,a5,%lo(.LC2)
	call	printf
	lui	a5,%hi(.LC2)
.L3:
	beq	s1,zero,.L4
	li	a2,1
.L5:
	addi	s0,s0,1
	mv	a1,s1
	j	.L6
.L2:
	addi	a2,a2,1
	mv	s1,a1
	j	.L5
.L4:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	lui	a0,%hi(.LC3)
	addi	a0,a0,%lo(.LC3)
	addi	sp,sp,12
	tail	puts
	.size	banner, .-banner
	.ident	"GCC: (GNU) 9.2.0"
