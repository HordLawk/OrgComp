	.data
title:	.asciiz "Input a number: "
	.text
	.globl main
main:
	la $a0, title
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	li $t1, 1
	addi $t3, $t2, -1
loop:
	ble $t3, $t1, end
	mul $t2, $t2, $t3
	addi $t3, $t3, -1
	j loop
end:
	move $a0, $t2
	li $v0, 1
	syscall
	li $v0, 10
	syscall
