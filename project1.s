.globl main
.data
prompt:
	.asciiz "Enter a series of comma separated integers:\n"
		#starts at 0 and ends at 44 
buffer:
	.space 100
		#starts at 45 and ends at 144
answer:
	.asciiz "The answer is:\n"
		#starts at 145 and ends at 160	
menu:
	.asciiz "Options: 1:Enter string of comma separated integers\n 2:Convert to array\n 3:Return mean of integers\n 4:Return median of integers\n 5:Display current string\n 6:Display current array\n"
		#starts at 161 and ends at 345

.text
main:
	addi $sp, $sp, -4
	sw $ra, ($sp)

	addi $v0, $0, 4			#print menu here	
	lui $a0, 0x1000			#load
	addi $a0, $a0, 161		#print string: menu
	syscall
	
					#read input(int) for menu
	addi $v0, $0, 5			#read int (user input)
	syscall				#v0 contains the number of the system call
	add $a0, $0, $v0		#put user's menu choice in a0

	beq $a0, 1, enter_string	#if user enters 1 in menu go to enter_string
	add $0, $0, $0			#NOP
#	beq $a0, 2, convert		#if user enters 2 in menu go to convert
#	beq $a0, 3, mean		#if user enters 3 in menu go to mean
#	beq $a0, 4, median		#if user enters 4 in menu go to median
	beq $a0, 5, display_string	#if user enters 5 in menu go to display_string
#	beq $a0, 6, display_array

	
	#if anything but 1 is entered first, print that the string is empty

	jr $ra				#go back to main menu
	add $0, $0, $0


enter_string:
	#sne $t0, $a0, 0		#if the string isn't empty, set t0 to 1
	#beq $t0, 0, somestringthatsaysstringisempty	#if t0=0(empty string) then go to some error string

	addi $v0, $0, 4		# print string: prompt
	lui  $a0, 0x1000	#load
	addi $a0, $a0, 0	#prompt starts at 0
	syscall

	addi $v0, $0, 8		#read string (user input)
	lui $a0, 0x1000		#load
	addi $v1, $0, 100	#read up to 100 characters
	syscall


#	jal main		#go back to main menu
#	jr $ra
	j main			#go back to main menu
	add $0, $0, $0


#######################
	#if you have already entered a string and you type 1 again, the old string prints out again
	#but then you can type a new one and thats set as the new string
#####################

print_answer_string:
	addi $v0, $0, 4		#print string: answer
	lui $a0, 0x1000
	addi $a0, $a0, 145	#prompt starts at 145
	syscall

#	jal main		#go back to main menu

display_string:			#prints what the user entered
	addi $v0, $0, 4		#print string of user input
	lui $a0, 0x1000
	addi $a0, $a0, 0	#user input starts at 0
	syscall

	j main			#go back to main menu
	add $0, $0, $0


convert:
	#lh rdest, address	#load the 16-bit quantity (halfword) at address into register rdest
	#sh rsrc, address	#store the low halfword from register rsrc at address
				#convert the null-terminated string of integers at address 0x10000100 to an array of
				#unique halfwords
				#all duplicates should be eliminated
				#the array should be stored in memory address 0x10000200
				#the first halfword stored in the array should be a count of the number of elements in the array
				#the number of elements eliminated from the original string should be displayed


mean:


display_array:
