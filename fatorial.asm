	.data
str1:	.asciiz "Digite um numero: "
str2:	.asciiz "Fatorial: "
	
	.text
	.globl main
	
main:
	#print str1
	li $v0, 4
	la $a0, str1
	syscall
	#lê um intiero
	li $v0, 5
	syscall
	move $s1, $v0
	#aloca o valor 1 em t1
	li $t1, 1
	
	begin:
		#compara se t1 == 0
		beq $s1, $zero, end
		#multiplica e acumula	
		mul $t1, $t1, $s1
		#decrementa t1
		subi $s1, $s1, 1
		j begin
	end:
	#print str2
	li $v0, 4
	la $a0, str2
	syscall
	#print int t1
	li $v0, 1
	add $a0, $t1, $zero
	syscall
	