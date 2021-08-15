.data                  
string1: .asciiz "please insert an integer number:"
number:  .word 0
answer:  .word 0
string2: .asciiz "the factorial of  "
string3: .asciiz " is: "


.text
main:    #read number from the user

         #print message
         li $v0,4
         la $a0,string1
         syscall  
          
         #read value
         li $v0,5
         syscall             
         sw $v0,number
     
         #call the factorial process
         lw $a0,number
         jal fact
         sw $v0,answer

         #display results
         #print message
         li $v0,4
         la $a0,string2
         syscall
         
         #print message : "the factorial of  " (number) "is:"
         li $v0,1
         lw $a0,number
         syscall
         li $v0,4
         la $a0,string3
         syscall
         
         #print result
         li $v0,1
         addi $a0,$s0,0
         syscall
         
         #exit
         li $v0,10
         syscall                                          
         
fact:    
         #adjust stack for two more items: the return adress and the current value used to call the factorial process, 4 bytes each
         addi $sp,$sp,-8 
         sw $ra,4($sp)
         sw $a0,0($sp)
         
         #check if the value used to call the process is finally less than 1
         slti $t0,$a0,1
         #if not (=> the result of the previous comparison stored in $t0 will be zero), we jump to L1 and subtract 1 once more
         beq $t0,$zero,L1
      
         #if we have reached 1, we store it in $v0 and return to the two previous values of the stack (previous addres and value)
         addi $v0,$zero,1
         addi $sp,$sp,8
         
         #the two previous instructions run just once, after we've reached one
         jr $ra  
         
         
L1:      addi $a0,$a0,-1
         jal fact
calc:    lw $a0,0($sp)
         lw $ra,4($sp)
         addi $sp,$sp,8
         mul $v0,$a0,$v0
         
         #preserve this by saving it in the s0 register
         add $s0,$zero,$v0 
 
         jr $ra


      

  
         
         


      

  
         
         

 

  
         
