	.file	"stdio.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.align	2
	.globl	getchar
	.type	getchar, @function
getchar:
	ssst
	lui	a5,%hi(io)
	addi	a5,a5,%lo(io)
.L2:
	lbu	a4,4(a5)
	andi	a4,a4,2
	beq	a4,zero,.L2
	lbu	a0,5(a5)
	andi	a0,a0,0xff
	ssld
	ret
	.size	getchar, .-getchar
	.align	2
	.globl	putchar
	.type	putchar, @function
putchar:
	ssst
	lui	a5,%hi(io)
	li	a4,10
	addi	a5,a5,%lo(io)
	bne	a0,a4,.L9
.L8:
	lbu	a4,4(a5)
	andi	a4,a4,1
	bne	a4,zero,.L8
	li	a4,13
	sb	a4,5(a5)
.L9:
	lbu	a4,4(a5)
	andi	a4,a4,1
	bne	a4,zero,.L9
	andi	a4,a0,0xff
	mv	a0,a4
	sb	a4,5(a5)
	ssld
	ret
	.size	putchar, .-putchar
	.align	2
	.globl	gets
	.type	gets, @function
gets:
	ssst
	addi	sp,sp,-24
	sw	s0,16(sp)
	sw	s1,12(sp)
	sw	ra,20(sp)
	mv	s1,a0
	mv	s0,a0
.L14:
	addi	a4,a1,-1
	beq	a4,zero,.L18
	sw	a1,4(sp)
	sw	a4,0(sp)
	call	getchar
	li	a3,10
	lw	a4,0(sp)
	lw	a1,4(sp)
	bne	a0,a3,.L15
.L18:
	li	a0,10
	call	putchar
	sb	zero,0(s0)
	bne	s0,s1,.L16
	li	s1,0
.L16:
	lw	s0,16(sp)
	lw	ra,20(sp)
	mv	a0,s1
	lw	s1,12(sp)
	addi	sp,sp,24
	ssld
	jr	ra
.L15:
	sw	a1,8(sp)
	sw	a4,4(sp)
	li	a3,13
	sw	a0,0(sp)
	beq	a0,a3,.L18
	call	putchar
	lw	a5,0(sp)
	li	a3,8
	lw	a4,4(sp)
	lw	a1,8(sp)
	bne	a5,a3,.L19
	beq	s0,s1,.L20
	sb	zero,-1(s0)
	mv	a4,a1
	addi	s0,s0,-1
.L20:
	mv	a1,a4
	j	.L14
.L19:
	sb	a5,0(s0)
	addi	s0,s0,1
	j	.L20
	.size	gets, .-gets
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC2:
	.string	"(NULL)"
	.text
	.align	2
	.globl	putstr
	.type	putstr, @function
putstr:
	ssst
	addi	sp,sp,-8
	sw	s0,0(sp)
	sw	ra,4(sp)
	mv	s0,a0
	bne	a0,zero,.L26
	lui	s0,%hi(.LC2)
	addi	s0,s0,%lo(.LC2)
.L26:
	lbu	a0,0(s0)
	bne	a0,zero,.L28
	lw	s0,0(sp)
	lw	ra,4(sp)
	addi	sp,sp,8
	ssld
	jr	ra
.L28:
	addi	s0,s0,1
	call	putchar
	j	.L26
	.size	putstr, .-putstr
	.align	2
	.globl	puts
	.type	puts, @function
puts:
	ssst
	addi	sp,sp,-4
	sw	ra,0(sp)
	call	putstr
	lw	ra,0(sp)
	li	a0,10
	addi	sp,sp,4
	tail	putchar
	.size	puts, .-puts
	.section	.rodata.str1.4
	.align	2
.LC3:
	.string	"0123456789abcdef"
	.globl	__udivsi3
	.globl	__umodsi3
	.text
	.align	2
	.globl	putdx
	.type	putdx, @function
putdx:
	ssst
	addi	sp,sp,-84
	sw	a1,0(sp)
	lui	a1,%hi(.LANCHOR0)
	sw	s0,76(sp)
	sw	s1,72(sp)
	li	a2,44
	addi	s1,a1,%lo(.LANCHOR0)
	mv	s0,a0
	addi	a1,a1,%lo(.LANCHOR0)
	addi	a0,sp,28
	sw	ra,80(sp)
	call	memcpy
	li	a2,20
	addi	a1,s1,44
	addi	a0,sp,8
	call	memcpy
	lw	a4,0(sp)
	addi	a5,sp,8
	beq	a4,zero,.L34
	addi	a5,sp,28
.L34:
	li	s1,24
.L35:
	lw	a1,0(a5)
	bne	a1,zero,.L39
	lw	s0,76(sp)
	lw	ra,80(sp)
	lw	s1,72(sp)
	addi	sp,sp,84
	ssld
	jr	ra
.L39:
	li	a4,1
	beq	a1,a4,.L36
	bgtu	a1,s0,.L37
.L36:
	lw	a3,0(sp)
	lui	a4,%hi(.LC3)
	sw	a5,4(sp)
	addi	a4,a4,%lo(.LC3)
	beq	a3,zero,.L38
	mv	a0,s0
	call	__udivsi3
	li	a1,10
	call	__umodsi3
.L43:
	lui	a5,%hi(.LC3)
	addi	a4,a5,%lo(.LC3)
	add	a4,a4,a0
	lbu	a0,0(a4)
	call	putchar
	lw	a5,4(sp)
.L37:
	addi	s1,s1,-8
	addi	a5,a5,4
	j	.L35
.L38:
	addi	a3,s1,4
	srl	a3,s0,a3
	andi	a3,a3,15
	add	a3,a4,a3
	lbu	a0,0(a3)
	call	putchar
	srl	a0,s0,s1
	andi	a0,a0,15
	j	.L43
	.size	putdx, .-putdx
	.align	2
	.globl	putx
	.type	putx, @function
putx:
	ssst
	li	a1,0
	tail	putdx
	.size	putx, .-putx
	.align	2
	.globl	putd
	.type	putd, @function
putd:
	ssst
	li	a1,1
	tail	putdx
	.size	putd, .-putd
	.align	2
	.globl	printf
	.type	printf, @function
printf:
	ssst
	addi	sp,sp,-36
	sw	a5,32(sp)
	addi	a5,sp,16
	sw	s0,8(sp)
	sw	ra,12(sp)
	sw	s1,4(sp)
	mv	s0,a0
	sw	a1,16(sp)
	sw	a2,20(sp)
	sw	a3,24(sp)
	sw	a4,28(sp)
	sw	a5,0(sp)
.L49:
	lbu	a0,0(s0)
	bne	a0,zero,.L55
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	addi	sp,sp,36
	ssld
	jr	ra
.L55:
	li	a5,37
	addi	s1,s0,1
	bne	a0,a5,.L50
	lbu	a0,1(s0)
	li	a5,115
	bne	a0,a5,.L51
	lw	a5,0(sp)
	lw	a0,0(a5)
	addi	a4,a5,4
	sw	a4,0(sp)
	call	putstr
.L52:
	addi	s0,s1,1
	j	.L49
.L51:
	li	a5,120
	bne	a0,a5,.L53
	lw	a5,0(sp)
	lw	a0,0(a5)
	addi	a4,a5,4
	sw	a4,0(sp)
	call	putx
	j	.L52
.L53:
	li	a5,100
	bne	a0,a5,.L54
	lw	a5,0(sp)
	lw	a0,0(a5)
	addi	a4,a5,4
	sw	a4,0(sp)
	call	putd
	j	.L52
.L54:
	call	putchar
	j	.L52
.L50:
	call	putchar
	mv	s1,s0
	j	.L52
	.size	printf, .-printf
	.align	2
	.globl	strncmp
	.type	strncmp, @function
strncmp:
	ssst
	addi	a2,a2,-1
	li	a5,0
.L59:
	add	a4,a0,a5
	lbu	a3,0(a4)
	add	a4,a1,a5
	lbu	a4,0(a4)
	beq	a5,a2,.L58
	beq	a3,zero,.L58
	beq	a4,zero,.L58
	addi	a5,a5,1
	beq	a3,a4,.L59
.L58:
	sub	a0,a3,a4
	ssld
	ret
	.size	strncmp, .-strncmp
	.align	2
	.globl	strcmp
	.type	strcmp, @function
strcmp:
	ssst
	li	a2,-1
	tail	strncmp
	.size	strcmp, .-strcmp
	.align	2
	.globl	strlen
	.type	strlen, @function
strlen:
	ssst
	mv	a5,a0
	li	a0,0
.L71:
	add	a4,a5,a0
	lbu	a4,0(a4)
	bne	a4,zero,.L72
	ssld
	ret
.L72:
	addi	a0,a0,1
	j	.L71
	.size	strlen, .-strlen
	.align	2
	.globl	memcpy
	.type	memcpy, @function
memcpy:
	ssst
	li	a5,0
.L75:
	bne	a5,a2,.L76
	ssld
	ret
.L76:
	add	a4,a1,a5
	lbu	a3,0(a4)
	add	a4,a0,a5
	addi	a5,a5,1
	sb	a3,0(a4)
	j	.L75
	.size	memcpy, .-memcpy
	.align	2
	.globl	memset
	.type	memset, @function
memset:
	ssst
	add	a2,a0,a2
	mv	a5,a0
.L79:
	bne	a5,a2,.L80
	ssld
	ret
.L80:
	addi	a5,a5,1
	sb	a1,-1(a5)
	j	.L79
	.size	memset, .-memset
	.align	2
	.globl	strtok
	.type	strtok, @function
strtok:
	ssst
	addi	sp,sp,-20
	sw	s0,12(sp)
	mv	s0,a0
	mv	a0,a1
	sw	a1,0(sp)
	sw	ra,16(sp)
	sw	s1,8(sp)
	call	strlen
	lw	a1,0(sp)
	mv	a2,a0
	bne	s0,zero,.L83
	lui	a5,%hi(nxt.1625)
	lw	s0,%lo(nxt.1625)(a5)
	beq	s0,zero,.L84
.L83:
	mv	s1,s0
.L85:
	lbu	a5,0(s1)
	bne	a5,zero,.L86
	lui	a5,%hi(nxt.1625)
	sw	zero,%lo(nxt.1625)(a5)
	j	.L84
.L86:
	mv	a0,s1
	sw	a2,4(sp)
	sw	a1,0(sp)
	call	strncmp
	lw	a1,0(sp)
	lw	a2,4(sp)
	addi	a5,s1,1
	bne	a0,zero,.L87
	lui	a4,%hi(nxt.1625)
	sb	zero,0(s1)
	sw	a5,%lo(nxt.1625)(a4)
.L84:
	mv	a0,s0
	lw	s0,12(sp)
	lw	ra,16(sp)
	lw	s1,8(sp)
	addi	sp,sp,20
	ssld
	jr	ra
.L87:
	mv	s1,a5
	j	.L85
	.size	strtok, .-strtok
	.align	2
	.globl	atoi
	.type	atoi, @function
atoi:
	ssst
	mv	a3,a0
	li	a2,0
	li	a0,0
	li	a1,45
.L93:
	bne	a3,zero,.L95
.L99:
	bne	a2,zero,.L96
.L92:
	ssld
	ret
.L100:
	li	a2,1
	j	.L94
.L95:
	lbu	a5,0(a3)
	beq	a5,zero,.L99
	beq	a5,a1,.L100
	addi	a5,a5,-48
	slli	a4,a0,3
	add	a4,a5,a4
	slli	a5,a0,1
	add	a0,a4,a5
.L94:
	addi	a3,a3,1
	j	.L93
.L96:
	neg	a0,a0
	j	.L92
	.size	atoi, .-atoi
	.align	2
	.globl	xtoi
	.type	xtoi, @function
xtoi:
	ssst
	mv	a4,a0
	li	a3,57
	li	a0,0
.L103:
	beq	a4,zero,.L102
	lbu	a5,0(a4)
	bne	a5,zero,.L107
.L102:
	ssld
	ret
.L107:
	slli	a0,a0,4
	bgtu	a5,a3,.L104
	addi	a5,a5,-48
.L112:
	add	a0,a5,a0
	addi	a4,a4,1
	j	.L103
.L104:
	andi	a5,a5,95
	addi	a5,a5,-55
	j	.L112
	.size	xtoi, .-xtoi
	.align	2
	.globl	mac
	.type	mac, @function
mac:
	ssst
 #APP
# 271 "stdio.c" 1
	.word 0x00c5857F
# 0 "" 2
 #NO_APP
	ssld
	ret
	.size	mac, .-mac
	.align	2
	.globl	__umulsi3
	.type	__umulsi3, @function
__umulsi3:
	ssst
	mv	a5,a0
	bltu	a0,a1,.L123
	li	a0,0
.L117:
	beq	a1,zero,.L115
	andi	a4,a1,1
	beq	a4,zero,.L121
	add	a0,a0,a5
.L121:
	slli	a5,a5,1
	srli	a1,a1,1
	j	.L117
.L119:
	andi	a4,a5,1
	beq	a4,zero,.L118
	add	a0,a0,a1
.L118:
	srli	a5,a5,1
	slli	a1,a1,1
.L116:
	bne	a5,zero,.L119
.L115:
	ssld
	ret
.L123:
	li	a0,0
	j	.L116
	.size	__umulsi3, .-__umulsi3
	.align	2
	.globl	__mulsi3
	.type	__mulsi3, @function
__mulsi3:
	ssst
	addi	sp,sp,-12
	sw	s1,0(sp)
	sw	ra,8(sp)
	sw	s0,4(sp)
	li	s1,0
	bge	a0,zero,.L132
	neg	a0,a0
	li	s1,1
.L132:
	li	s0,0
	bge	a1,zero,.L133
	neg	a1,a1
	li	s0,1
.L133:
	call	__umulsi3
	beq	s1,s0,.L131
	neg	a0,a0
.L131:
	lw	s0,4(sp)
	lw	ra,8(sp)
	lw	s1,0(sp)
	addi	sp,sp,12
	ssld
	jr	ra
	.size	__mulsi3, .-__mulsi3
	.align	2
	.globl	__udiv_umod_si3
	.type	__udiv_umod_si3, @function
__udiv_umod_si3:
	ssst
	mv	a5,a0
	li	a4,1
	mv	a0,a1
	bne	a1,zero,.L142
.L141:
	ssld
	ret
.L143:
	slli	a4,a4,1
	slli	a0,a0,1
.L142:
	bgtu	a5,a0,.L143
	mv	a3,a0
	li	a0,0
.L144:
	beq	a5,zero,.L146
	bne	a4,zero,.L147
.L146:
	bne	a2,zero,.L141
	mv	a0,a5
	j	.L141
.L147:
	bltu	a5,a3,.L145
	sub	a5,a5,a3
	add	a0,a0,a4
.L145:
	srli	a4,a4,1
	srli	a3,a3,1
	j	.L144
	.size	__udiv_umod_si3, .-__udiv_umod_si3
	.align	2
	.globl	__udivsi3
	.type	__udivsi3, @function
__udivsi3:
	ssst
	li	a2,1
	tail	__udiv_umod_si3
	.size	__udivsi3, .-__udivsi3
	.align	2
	.globl	__umodsi3
	.type	__umodsi3, @function
__umodsi3:
	ssst
	li	a2,0
	tail	__udiv_umod_si3
	.size	__umodsi3, .-__umodsi3
	.align	2
	.globl	__div_mod_si3
	.type	__div_mod_si3, @function
__div_mod_si3:
	beq	a1,zero,.L173
	ssst
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	mv	s0,a2
	li	s1,0
	bge	a0,zero,.L161
	neg	a0,a0
	li	s1,1
.L161:
	li	a5,0
	bge	a1,zero,.L162
	neg	a1,a1
	li	a5,1
.L162:
	mv	a2,s0
	sw	a5,0(sp)
	call	__udiv_umod_si3
	mv	a1,a0
	beq	s0,zero,.L163
	lw	a5,0(sp)
	beq	s1,a5,.L160
	neg	a1,a0
.L160:
	lw	s0,8(sp)
	lw	ra,12(sp)
	lw	s1,4(sp)
	mv	a0,a1
	addi	sp,sp,16
	ssld
	jr	ra
.L163:
	beq	s1,zero,.L160
	neg	a1,a0
	j	.L160
.L173:
	mv	a0,a1
	ret
	.size	__div_mod_si3, .-__div_mod_si3
	.align	2
	.globl	__divsi3
	.type	__divsi3, @function
__divsi3:
	ssst
	li	a2,1
	tail	__div_mod_si3
	.size	__divsi3, .-__divsi3
	.align	2
	.globl	__modsi3
	.type	__modsi3, @function
__modsi3:
	ssst
	li	a2,0
	tail	__div_mod_si3
	.size	__modsi3, .-__modsi3
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
.LC0:
	.word	1000000000
	.word	100000000
	.word	10000000
	.word	1000000
	.word	100000
	.word	10000
	.word	1000
	.word	100
	.word	10
	.word	1
	.word	0
.LC1:
	.word	16777216
	.word	65536
	.word	256
	.word	1
	.word	0
	.section	.sbss,"aw",@nobits
	.align	2
	.type	nxt.1625, @object
	.size	nxt.1625, 4
nxt.1625:
	.zero	4
	.ident	"GCC: (GNU) 9.2.0"
