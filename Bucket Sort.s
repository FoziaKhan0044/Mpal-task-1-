														#Bucket Sort

.data

	ARRAY: .byte  3, 6, 5, 1, 8, 4, 3, 1
	BUCKET: .byte  0, 0, 0, 0, 0, 0, 0, 0, 0, 0


	Message1: .asciiz "BEFORE SORTING \n\n"
	Message2: .asciiz "\n\nAFTER SORTING \n\n"

.text
.globl main
main:

	
	la $a0, Message1
		li $v0, 4
		syscall
	
	li $t0,0
	li $t1,8		#Size of the Array
	la $t2, ARRAY
	
	FOR1: 
		bge $t0, $t1, EXIT1
		
		lb $a0, ($t2)
			li $v0,1
			syscall
		
		add $t2, $t2,1
		add $t0,$t0,1
		j FOR1
		
	
	EXIT1:

			#Call Bucket Sort Function

	jal BUCKET_SORT





	la $a0, Message2
		li $v0, 4
		syscall
	
	
	
	li $t0,0
	li $t1,8
	la $t2, ARRAY
	FOR2: 
		bge $t0, $t1, EXIT2
		
		lb $a0, ($t2)
			li $v0,1
			syscall
		
		
		add $t2, $t2,1
		add $t0,$t0,1
		j FOR2
		
	EXIT2:




	li $v0, 10 												#exit code
		syscall
		
		
	BUCKET_SORT:
		la $s0,ARRAY
		
		li $s1,8
		li $t0, 1
		FOR3:
			bge $t0, $s1, EXIT3
			la $s2,BUCKET
			lb $t1,($s0)
			add $s2,$s2,$t1
			lb	$t2,($s2)
			add $t2,$t2,1
			sb  $t2,($s2)
			
			add $s0,$s0,1
			add $t0,$t0,1
			j FOR3

		EXIT3:

		li $t0,0
		la $s2,BUCKET
		FOR4: 
			bge $t0,8, EXIT4
			lb	$a0,($s2)
				li $v0,1
				syscall
			
			
			add $s2, $s2,1
			add $t0,$t0,1
			j FOR4
		
		EXIT4:

		jr $ra
	
	