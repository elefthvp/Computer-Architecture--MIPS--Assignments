.data 0x10008000
.word 5,9,32
 string1:  .asciiz  "Select temperature c or f \n"
 string2:  .asciiz "Type the desired number=? \n"
 string3:  .asciiz "Temperature: "
 messagec: .asciiz " C"
 messagef: .asciiz " F"
 number:   .float 0.0 
 zeroo:    .float 0.0

.text
  main:
      	lui $gp,0x1000
      	ori $gp,$gp,0x8000 
	
	
      	lwc1 $f2,zeroo       	
      	lwc1 $f16,0($gp)     	#load the number that can be found 0 bytes from the global pointer (i.e. that can be found at the start of the global pointer) and is equal to 5
      	cvt.s.w $f16,$f16       #convert it to float 
	
      	lwc1 $f18,4($gp)     	#load the number that is 4 bytes from the global pointer, that is equal to 9 as defined at the beginning of the code
      	cvt.s.w $f18,$f18
	
	lwc1 $f14,8($gp)        ##load the number that is 8 bytes from the global pointer, that is equal to 32 as defined at the beginning of the code
	cvt.s.w $f14,$f14
	
	#create 5/9 and its reverse, used in the Fahrenheit to Celsius and Celsius to Fahrenheit formulas
      	div.s $f20,$f16,$f18    #5/9
      	div.s $f22,$f18,$f16    #9/5
      	
      	#print message asking for f or c insertion
      	li $v0,4
      	la $a0,string1 
      	syscall  
	
	#read a single character 
      	li $v0,12
      	syscall
	
	#compare read character to 99 which is ASCII for c and jump to Celsius to Fahrenheit if equal, otherwise continue to Fahrenheit to Celsius
      	beq $v0,99,c2f
     
  f2c:  
        #print message asking for temperature input
	li $v0,4
        la $a0,string2
        syscall
	
	#read temperature 
        li $v0,6
        syscall 
 
        
        #Fahrenheit to Celsius calculation
        sub.s $f10,$f0,$f14 #subtract 32
        mul.s $f10,$f10,$f20 #multiply 5/9
	
	
	#print results 
        li $v0,4
        la $a0,string3
        syscall
	
        li $v0,2
	add.s $f12,$f10,$f2 #store the float to print in the compatibe float register 
	syscall
        
	li $v0,4
        la $a0,messagec
        syscall
        
	#exit
        li $v0,10
        syscall 
        

  c2f: 
  	#print message asking for temperature input
	li $v0,4
        la $a0,string2
        syscall
	
	#read temperature 
        li $v0,6
        syscall 
 	
	
	#Celsius to Fahrenheit calculation
     	mul.s $f10,$f0,$f22
     	add.s $f10,$f10,$f14
	
	
        li $v0,2
	add.s $f12,$f10,$f2 #store the float to print in the compatibe float register 
	syscall
        
	li $v0,4
        la $a0,messagef
        syscall
	
	
	#exit
        li $v0,10
        syscall 
     
