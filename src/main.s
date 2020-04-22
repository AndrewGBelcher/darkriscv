	.file	"main.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 4
	.text
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"+MT"
	.align	2
.LC1:
	.string	""
	.align	2
.LC2:
	.string	"+MAC"
	.align	2
.LC3:
	.string	"board: %s (id=%d)\n"
	.align	2
.LC4:
	.string	"Mon, 20 Apr 2020 12:43:23 +0100"
	.align	2
.LC5:
	.string	"build: darkriscv fw build %s\n"
	.align	2
.LC6:
	.string	"rv32i"
	.align	2
.LC7:
	.string	"core0: darkriscv@%d.%dMHz with %s%s%s\n"
	.align	2
.LC8:
	.string	"uart0: 115200 bps (div=%d)\n"
	.globl	__mulsi3
	.globl	__udivsi3
	.align	2
.LC9:
	.string	"timr0: periodic timer=%dHz (io.timer=%d)\n"
	.align	2
.LC10:
	.string	"endian-test (little-endian):"
	.align	2
.LC11:
	.string	"ip:port=%d.%d.%d.%d:%d\n"
	.align	2
.LC12:
	.string	"data.ref  = %x %x %x %x = %x\n"
	.align	2
.LC13:
	.string	"data.ip   = %x %x %x %x = %x\n"
	.align	2
.LC14:
	.string	"data.port = %x %x = %x/%d\n"
	.align	2
.LC15:
	.string	"data.opts = %x %x = %x %x\n"
	.align	2
.LC16:
	.string	"Welcome to DarkRISCV!"
	.align	2
.LC17:
	.string	"> "
	.align	2
.LC18:
	.string	" "
	.align	2
.LC19:
	.string	"clear"
	.align	2
.LC20:
	.string	"\033[H\033[2J"
	.align	2
.LC21:
	.string	"atros"
	.align	2
.LC22:
	.string	"wow! hello atros! o/"
	.align	2
.LC23:
	.string	"dump"
	.align	2
.LC24:
	.string	"%x: "
	.align	2
.LC25:
	.string	"%x "
	.align	2
.LC26:
	.string	"rd"
	.align	2
.LC27:
	.string	"wr"
	.align	2
.LC28:
	.string	"led"
	.align	2
.LC29:
	.string	"led = %x\n"
	.align	2
.LC30:
	.string	"timer"
	.align	2
.LC31:
	.string	"timer = %d\n"
	.align	2
.LC32:
	.string	"gpio"
	.align	2
.LC33:
	.string	"gpio = %x\n"
	.align	2
.LC34:
	.string	"mul"
	.align	2
.LC35:
	.string	"mul = %d\n"
	.align	2
.LC36:
	.string	"div"
	.globl	__modsi3
	.globl	__divsi3
	.align	2
.LC37:
	.string	"div = %d, mod = %d\n"
	.align	2
.LC38:
	.string	"mac"
	.align	2
.LC39:
	.string	"mac = %d\n"
	.align	2
.LC40:
	.string	"command: [%s] not found.\nvalid commands: clear, dump <hex>, led <hex>, timer <dec>, gpio <hex>\n                mul <dec> <dec>, div <dec> <dec>, mac <dec> <dec> <dec>\n                rd[m][bwl] <hex> [<hex> when m], wr[m][bwl] <hex> <hex> [<hex> when m]\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	ssst
	addi	sp,sp,-136
	sw	s1,124(sp)
	lui	s1,%hi(io)
	sw	ra,132(sp)
	sw	s0,128(sp)
	call	banner
	addi	s0,s1,%lo(io)
	lbu	a4,0(s0)
	lui	a5,%hi(board_name)
	addi	a5,a5,%lo(board_name)
	andi	a4,a4,0xff
	slli	a4,a4,2
	add	a5,a5,a4
	lbu	a2,0(s0)
	lw	a1,0(a5)
	lui	a0,%hi(.LC3)
	andi	a2,a2,0xff
	addi	a0,a0,%lo(.LC3)
	call	printf
	lui	a1,%hi(.LC4)
	lui	a0,%hi(.LC5)
	addi	a1,a1,%lo(.LC4)
	addi	a0,a0,%lo(.LC5)
	call	printf
	lbu	a6,1(s0)
	lbu	a7,2(s0)
	lui	s0,%hi(threads)
	lw	a4,%lo(threads)(s0)
	li	a5,1
	andi	a6,a6,0xff
	andi	a7,a7,0xff
	addi	s1,s1,%lo(io)
	bgt	a4,a5,.L39
	lui	a4,%hi(.LC1)
	addi	a4,a4,%lo(.LC1)
.L2:
	li	a2,16
	li	a1,16
	li	a0,1000
	sw	a4,8(sp)
	sw	a7,4(sp)
	sw	a6,0(sp)
	call	mac
	li	a5,1256
	lw	a6,0(sp)
	lw	a7,4(sp)
	lw	a4,8(sp)
	beq	a0,a5,.L40
	lui	a5,%hi(.LC1)
	addi	a5,a5,%lo(.LC1)
.L3:
	lui	a3,%hi(.LC6)
	lui	a0,%hi(.LC7)
	mv	a2,a7
	mv	a1,a6
	addi	a3,a3,%lo(.LC6)
	addi	a0,a0,%lo(.LC7)
	call	printf
	lhu	a1,6(s1)
	lui	a0,%hi(.LC8)
	addi	a0,a0,%lo(.LC8)
	slli	a1,a1,16
	srli	a1,a1,16
	sw	zero,%lo(threads)(s0)
	call	printf
	lbu	a0,1(s1)
	lbu	a5,2(s1)
	lw	a4,12(s1)
	lw	a2,12(s1)
	li	a1,999424
	addi	a1,a1,576
	andi	a0,a0,0xff
	andi	s0,a5,0xff
	sw	a2,0(sp)
	sw	a4,4(sp)
	call	__mulsi3
	slli	a5,s0,5
	sub	a5,a5,s0
	lw	a4,4(sp)
	slli	a5,a5,2
	add	a5,a5,s0
	slli	a5,a5,3
	addi	a1,a4,1
	add	a0,a0,a5
	call	__udivsi3
	lw	a2,0(sp)
	mv	a1,a0
	lui	a0,%hi(.LC9)
	addi	a0,a0,%lo(.LC9)
	call	printf
	li	a0,10
	call	putchar
	lui	a0,%hi(.LC10)
	addi	a0,a0,%lo(.LC10)
	call	puts
	lui	a5,%hi(ip)
	lw	s0,%lo(ip)(a5)
	lui	a5,%hi(port)
	lhu	t1,%lo(port)(a5)
	srli	a6,s0,8
	srli	a7,s0,16
	andi	t3,s0,255
	andi	a6,a6,0xff
	andi	a7,a7,0xff
	srli	t4,s0,24
	lui	a0,%hi(.LC11)
	mv	a5,t1
	mv	a4,t4
	mv	a3,a7
	mv	a2,a6
	mv	a1,t3
	addi	a0,a0,%lo(.LC11)
	sw	t1,16(sp)
	sw	t4,12(sp)
	sw	a7,8(sp)
	sw	a6,4(sp)
	sw	t3,0(sp)
	call	printf
	li	a5,305418240
	lui	a0,%hi(.LC12)
	addi	a5,a5,1656
	li	a4,18
	li	a3,52
	li	a2,86
	li	a1,120
	addi	a0,a0,%lo(.LC12)
	call	printf
	lw	t4,12(sp)
	lw	a7,8(sp)
	lw	a6,4(sp)
	lw	t3,0(sp)
	lui	a0,%hi(.LC13)
	mv	a4,t4
	mv	a3,a7
	mv	a2,a6
	mv	a1,t3
	mv	a5,s0
	addi	a0,a0,%lo(.LC13)
	call	printf
	lw	t1,16(sp)
	lui	a0,%hi(.LC14)
	addi	a0,a0,%lo(.LC14)
	mv	a4,t1
	mv	a3,t1
	srli	a2,t1,8
	andi	a1,t1,0xff
	call	printf
	lui	a0,%hi(.LC15)
	li	a4,11
	li	a3,10
	li	a2,11
	li	a1,10
	addi	a0,a0,%lo(.LC15)
	call	printf
	li	a0,10
	call	putchar
	lui	a0,%hi(.LC16)
	addi	a0,a0,%lo(.LC16)
.L67:
	call	puts
.L38:
	lui	a5,%hi(.LC17)
	addi	a0,a5,%lo(.LC17)
	call	printf
	li	a2,64
	li	a1,0
	addi	a0,sp,60
	call	memset
	li	a1,64
	addi	a0,sp,60
	call	gets
	li	s0,0
	addi	a0,sp,60
	lui	a4,%hi(.LC18)
.L4:
	addi	a1,a4,%lo(.LC18)
	call	strtok
	addi	a4,sp,124
	slli	a5,s0,2
	add	a5,a4,a5
	sw	a0,-96(a5)
	lui	a4,%hi(.LC18)
	beq	a0,zero,.L5
	addi	s0,s0,1
	li	a5,8
	li	a0,0
	bne	s0,a5,.L4
.L5:
	lw	s0,28(sp)
	beq	s0,zero,.L38
	lui	a1,%hi(.LC19)
	addi	a1,a1,%lo(.LC19)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L9
	lui	a0,%hi(.LC20)
	addi	a0,a0,%lo(.LC20)
	call	printf
	j	.L38
.L39:
	lui	a4,%hi(.LC0)
	addi	a4,a4,%lo(.LC0)
	j	.L2
.L40:
	lui	a5,%hi(.LC2)
	addi	a5,a5,%lo(.LC2)
	j	.L3
.L9:
	lui	a1,%hi(.LC21)
	addi	a1,a1,%lo(.LC21)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L10
	call	banner
	lui	a0,%hi(.LC22)
	addi	a0,a0,%lo(.LC22)
	j	.L67
.L10:
	lui	a1,%hi(.LC23)
	addi	a1,a1,%lo(.LC23)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L11
	lw	s0,32(sp)
	beq	s0,zero,.L12
	mv	a0,s0
	call	xtoi
	mv	s0,a0
.L12:
	addi	a5,s0,256
	sw	a5,0(sp)
.L16:
	lui	a5,%hi(.LC24)
	mv	a1,s0
	addi	a0,a5,%lo(.LC24)
	call	printf
	li	a4,0
	lui	a2,%hi(.LC25)
.L13:
	add	a3,s0,a4
	lbu	a1,0(a3)
	addi	a0,a2,%lo(.LC25)
	sw	a4,4(sp)
	call	printf
	lw	a4,4(sp)
	li	a3,16
	lui	a2,%hi(.LC25)
	addi	a4,a4,1
	bne	a4,a3,.L13
	li	a4,0
.L15:
	add	a3,s0,a4
	lbu	a0,0(a3)
	li	a2,94
	addi	a3,a0,-32
	andi	a3,a3,0xff
	bleu	a3,a2,.L14
	li	a0,46
.L14:
	sw	a4,4(sp)
	call	putchar
	lw	a4,4(sp)
	li	a3,16
	addi	a4,a4,1
	bne	a4,a3,.L15
	li	a0,10
	call	putchar
	lw	a5,0(sp)
	addi	s0,s0,16
	bne	a5,s0,.L16
	j	.L38
.L11:
	lui	a1,%hi(.LC26)
	li	a2,2
	addi	a1,a1,%lo(.LC26)
	mv	a0,s0
	call	strncmp
	beq	a0,zero,.L18
	lui	a1,%hi(.LC27)
	li	a2,2
	addi	a1,a1,%lo(.LC27)
	mv	a0,s0
	call	strncmp
	bne	a0,zero,.L19
.L18:
	lbu	a4,2(s0)
	li	a5,109
	bne	a4,a5,.L42
	lw	a0,32(sp)
	call	xtoi
	sw	a0,20(sp)
	li	a5,2
	li	a4,3
.L68:
	sw	a4,16(sp)
	addi	a4,a5,1
	sw	a4,12(sp)
	slli	a5,a5,2
	addi	a4,sp,124
	add	a5,a4,a5
	lw	a0,-96(a5)
	call	xtoi
	sw	a0,4(sp)
	mv	a1,a0
	lui	a0,%hi(.LC24)
	addi	a0,a0,%lo(.LC24)
	call	printf
	sw	zero,0(sp)
.L21:
	lw	a5,20(sp)
	lw	a4,0(sp)
	bne	a5,a4,.L28
	li	a0,10
	call	putchar
	j	.L38
.L42:
	li	a4,1
	sw	a4,20(sp)
	li	a5,1
	li	a4,2
	j	.L68
.L28:
	lw	a5,16(sp)
	lbu	a4,0(s0)
	add	a5,s0,a5
	sw	a5,8(sp)
	li	a5,114
	bne	a4,a5,.L22
	lw	a5,8(sp)
	lbu	a4,0(a5)
	li	a5,98
	bne	a4,a5,.L23
	lw	a5,4(sp)
	lw	a4,0(sp)
	add	a5,a5,a4
	lbu	a1,0(a5)
	lui	a5,%hi(.LC25)
	addi	a0,a5,%lo(.LC25)
	call	printf
.L23:
	lw	a5,8(sp)
	lbu	a4,0(a5)
	li	a5,119
	bne	a4,a5,.L24
	lw	a5,0(sp)
	lw	a4,4(sp)
	slli	a5,a5,1
	add	a5,a5,a4
	lh	a1,0(a5)
	lui	a5,%hi(.LC25)
	addi	a0,a5,%lo(.LC25)
	call	printf
.L24:
	lw	a5,8(sp)
	lbu	a4,0(a5)
	li	a5,108
	bne	a4,a5,.L25
	lw	a5,0(sp)
	lw	a4,4(sp)
	slli	a5,a5,2
	add	a5,a5,a4
	lw	a1,0(a5)
.L69:
	lui	a5,%hi(.LC25)
	addi	a0,a5,%lo(.LC25)
	call	printf
.L25:
	lw	a5,0(sp)
	addi	a5,a5,1
	sw	a5,0(sp)
	j	.L21
.L22:
	lw	a5,12(sp)
	addi	a4,sp,124
	addi	a5,a5,1
	sw	a5,24(sp)
	lw	a5,12(sp)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a0,-96(a5)
	call	xtoi
	lw	a4,8(sp)
	mv	a5,a0
	lbu	a3,0(a4)
	li	a4,98
	bne	a3,a4,.L26
	lw	a4,4(sp)
	lw	a3,0(sp)
	lui	a5,%hi(.LC25)
	andi	a1,a0,0xff
	add	a4,a4,a3
	sb	a0,0(a4)
	sw	a0,12(sp)
	addi	a0,a5,%lo(.LC25)
	call	printf
	lw	a5,12(sp)
.L26:
	lw	a4,8(sp)
	lbu	a3,0(a4)
	li	a4,119
	bne	a3,a4,.L27
	slli	a1,a5,16
	sw	a5,12(sp)
	lw	a5,0(sp)
	srai	a1,a1,16
	slli	a4,a5,1
	lw	a5,4(sp)
	add	a4,a4,a5
	lui	a5,%hi(.LC25)
	addi	a0,a5,%lo(.LC25)
	sh	a1,0(a4)
	call	printf
	lw	a5,12(sp)
.L27:
	lw	a4,8(sp)
	lw	a2,24(sp)
	lbu	a3,0(a4)
	sw	a2,12(sp)
	li	a4,108
	bne	a3,a4,.L25
	lw	a4,0(sp)
	lw	a3,4(sp)
	mv	a1,a5
	slli	a4,a4,2
	add	a4,a4,a3
	sw	a5,0(a4)
	j	.L69
.L19:
	lui	a1,%hi(.LC28)
	addi	a1,a1,%lo(.LC28)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L29
	lw	a0,32(sp)
	beq	a0,zero,.L30
	call	xtoi
	slli	a0,a0,16
	srli	a0,a0,16
	sh	a0,8(s1)
.L30:
	lhu	a1,8(s1)
	lui	a0,%hi(.LC29)
	addi	a0,a0,%lo(.LC29)
	slli	a1,a1,16
	srli	a1,a1,16
.L66:
	call	printf
	j	.L38
.L29:
	lui	a1,%hi(.LC30)
	addi	a1,a1,%lo(.LC30)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L31
	lw	a0,32(sp)
	beq	a0,zero,.L32
	call	atoi
	sw	a0,12(s1)
.L32:
	lui	a0,%hi(.LC31)
	lw	a1,12(s1)
	addi	a0,a0,%lo(.LC31)
	j	.L66
.L31:
	lui	a1,%hi(.LC32)
	addi	a1,a1,%lo(.LC32)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L33
	lw	a0,32(sp)
	beq	a0,zero,.L34
	call	xtoi
	slli	a0,a0,16
	srli	a0,a0,16
	sh	a0,10(s1)
.L34:
	lhu	a1,10(s1)
	lui	a0,%hi(.LC33)
	addi	a0,a0,%lo(.LC33)
	slli	a1,a1,16
	srli	a1,a1,16
	j	.L66
.L33:
	lui	a1,%hi(.LC34)
	addi	a1,a1,%lo(.LC34)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L35
	lw	a0,32(sp)
	call	atoi
	mv	s0,a0
	lw	a0,36(sp)
	call	atoi
	mv	a1,a0
	mv	a0,s0
	call	__mulsi3
	mv	a1,a0
	lui	a0,%hi(.LC35)
	addi	a0,a0,%lo(.LC35)
	j	.L66
.L35:
	lui	a1,%hi(.LC36)
	addi	a1,a1,%lo(.LC36)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L36
	lw	a0,32(sp)
	call	atoi
	mv	s0,a0
	lw	a0,36(sp)
	call	atoi
	mv	a1,a0
	sw	a0,4(sp)
	mv	a0,s0
	call	__modsi3
	lw	a1,4(sp)
	sw	a0,0(sp)
	mv	a0,s0
	call	__divsi3
	lw	a2,0(sp)
	mv	a1,a0
	lui	a0,%hi(.LC37)
	addi	a0,a0,%lo(.LC37)
	call	printf
	j	.L38
.L36:
	lui	a1,%hi(.LC38)
	addi	a1,a1,%lo(.LC38)
	mv	a0,s0
	call	strcmp
	bne	a0,zero,.L37
	lw	a0,32(sp)
	call	atoi
	mv	s0,a0
	lw	a0,36(sp)
	call	atoi
	sw	a0,0(sp)
	lw	a0,40(sp)
	call	atoi
	lw	a1,0(sp)
	slli	a2,a0,16
	srai	a2,a2,16
	slli	a1,a1,16
	srai	a1,a1,16
	mv	a0,s0
	call	mac
	mv	a1,a0
	lui	a0,%hi(.LC39)
	addi	a0,a0,%lo(.LC39)
	j	.L66
.L37:
	lbu	a5,0(s0)
	beq	a5,zero,.L38
	lui	a0,%hi(.LC40)
	mv	a1,s0
	addi	a0,a0,%lo(.LC40)
	j	.L66
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
