	.data
	.align 2
num: .word 7, 5, 2, 1, 1, 3, 4
	.text
	.globl main
main:
	li $t0, 6
	li $t1, 0
	la $t3, num
loop1:
	beq $t1, $t0, endloop1
	move $t2, $t0
loop2:
	beq $t2, $t1, endloop2
	sll $t5, $t2, 2
	add $t5, $t3, $t5
	lw $t4, 0($t5)
	lw $t6, -4($t5)
	ble $t6, $t4, ifend
	sw $t6, 0($t5)
	sw $t4, -4($t5)
ifend:
	addi $t2, $t2, -1
	j loop2
endloop2:
	addi $t1, $t1, 1
	j loop1
endloop1:
	sll $t0, $t0, 2
	add $t0, $t3, $t0
loop3:
	bgt $t3, $t0, endloop3
	lw $t2, 0($t3)
	move $a0, $t2
	li $v0, 1
	syscall
	addi $t3, $t3, 4
	j loop3
endloop3:
	li $v0, 10
	syscall
	