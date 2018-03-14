	.data
str1:	.asciiz "numero 1: "
str2:	.asciiz "numero 2: "
str3:	.asciiz "Resultado: "

eline:  .asciiz "\n"
	.text
	.globl main

main:
 
	li $s0, 10 # constante 10
	li $s1, 0 # contador do laço i
	LOOP: #inico do loop
		beq $s1, $s0, end
		#Imprimir str1
		li $v0, 4
		la $a0, str1
		syscall
	
		#Imprimir o int 1
		li $v0, 5
		syscall
		move $t1, $v0
		
		#Imprimir str2
		li $v0, 4
		la $a0, str2
		syscall
		
		#Imprimir o int 2
		li $v0, 5
		syscall
		move $t2, $v0
	
		add $t3, $t1, $t2
		
		#Imprimir str3
		li $v0, 4
		la $a0, str3
		syscall
		
		#Imprimir o resultado
		li $v0, 1
		add $a0, $t3, $zero
		syscall
		
		#Imprimir /n
		li $v0, 4
		la $a0, eline
		syscall
		
		addi $s1,$s1,1 #incrementa o i 
		j LOOP  #pula pro inicio
	end: