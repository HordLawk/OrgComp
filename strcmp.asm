	.data
str1:	.space 30
str2:	.space 30
	.text
	.globl main
main:
	la $s0, str1
	move $a0, $s0
	li $a1, 30
	li $v0, 8
	syscall
	la $s1, str2
	move $a0, $s1
	syscall
loop:
	lb $t1, 0($s0)
	lb $t2, 0($s1)
	bne $t1, $t2, differ
	beqz $t1, equal
	addi $s0, $s0, 1
	addi $s1, $s1, 1
	j loop
differ:
	sub $a0, $t1, $t2
	li $v0, 1
	syscall
	j end
equal:
	move $a0, $zero
	li $v0, 1
	syscall
end:
	li $v0, 10
	syscall
	