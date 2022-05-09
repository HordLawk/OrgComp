	.data
str:	.space 30
result:	.space 60
	.text
	.globl main
main:
	la $a0, str
	li $a1, 30
	li $v0, 8
	syscall
	la $a1, result
	jal strcpy
	subi $t1, $a1, 1
	la $a0, str
	li $a1, 30
	li $v0, 8
	syscall
	move $a1, $t1
	jal strcpy
	la $a0, result
	li $v0, 4
	syscall
	li $v0, 10
	syscall
strcpy:
	lb $s0, 0($a0)
	sb $s0, 0($a1)
	beqz $s0, endstrcpy
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	j strcpy
endstrcpy:
	jr $ra
	