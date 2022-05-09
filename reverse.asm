	.text
	.globl main
main:
	li $v0, 5
	syscall
	move $t0, $v0
loop:
	rem $a0, $t0, 10
	li $v0, 1
	syscall
	divu $t0, $t0, 10
	bnez $t0, loop
	li $v0, 10
	syscall