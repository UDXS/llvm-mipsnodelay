	.set noat
    .text
	.align	2
	.globl	__start
    .extern begin
	.set	nomips16
	.set	nomicromips
	.ent	__start
__start:
 	li	$zero,0
 	li	$at,0
 	li	$v0,0
 	li	$v1,0
 	li	$a0,0
 	li	$a1,0
 	li	$a2,0
 	li	$a3,0
 	li	$t0,0
 	li	$t1,0
 	li	$t2,0
 	li	$t3,0
 	li	$t4,0
 	li	$t5,0
 	li	$t6,0
 	li	$t7,0
 	li	$s0,0
 	li	$s1,0
 	li	$s2,0
 	li	$s3,0
 	li	$s4,0
 	li	$s5,0
 	li	$s6,0
 	li	$s7,0
 	li	$t8,0
 	li	$t9,0
 	li	$k0,0
 	li	$k1,0
 	li	$gp,0
 	li	$sp,0
 	li	$s8,0
 	li	$ra,0
 	li	$sp,0x100000 # Giving a stack size of 1 MB
 	jal	begin
 	move	$gp,$gp
 	mtc0	$gp,$23
 	nop
 	mtc0	$gp,$25
$loop:
 	j	$loop
 	nop
 	nop
	.end	__start
