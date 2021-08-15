.data 0x10008000
    .word 5,9,32
 string1: .asciiz  "Select temperature c or f \n"
 string2: .asciiz "Type the desired number=? \n"
 string3: .asciiz "Temperature: "
 messagec: .asciiz " c"
 messagef: .asciiz " f"
 number:  .float 0.0   #mallon peritto
 zeroo:   .float 0.0

.text
  main:
      lui $gp,0x1000
      ori $gp,$gp,0x8000 
      lwc1 $f2,zeroo       #epitrepetai na valw f2? 
      lwc1 $f16,0($gp)     #5
      cvt.s.w $f16,$f16
      lwc1 $f18,4($gp)     #9
      cvt.s.w $f18,$f18
      div.s $f20,$f16,$f18    #5/9
      div.s $f22,$f18,$f16    #9/5
      lwc1 $f14,8($gp)        #32
      cvt.s.w $f14,$f14
      li $v0,4
      la $a0,string1  #dialego tin thermokrasia proeleysis
      syscall  #EKTIPOSI PROTOU STRING
      li $v0,12
      syscall
      beq $v0,99,c2f 
	  #99 is ascii for c
     
  f2c:  li $v0,4
        la $a0,string2
        syscall
        li $v0,6
        syscall #diavasma thermokrasias
 
        
        
        sub.s $f10,$f0,$f14
        mul.s $f10,$f10,$f20
        li $v0,4
        la $a0,string3
        syscall
        # ÁÕÔÏ ÐÏÕ ÂÑÇÊÁ ÓÅ ÐÑÁÃÌÁÔÉÊÏ ÁÑÉÈÌÏ
        li $v0,2
        add.s $f12,$f10,$f2 #ÓÕÌÖÙÍÁ ÌÅ ÔÏÍ ÐÉÍÁÊÁ
        syscall
        li $v0,4
        la $a0,messagec
        syscall
        li $v0,10
        syscall 
        

  c2f: 
     li $v0,4
     la $a0,string2
     syscall
     li $v0,6
     syscall  #diavasma thermokrasias
     mul.s $f10,$f0,$f22
     add.s $f10,$f10,$f14
     li $v0,4
     la $a0,string3
     syscall 
     li $v0,2
     add.s $f12,$f10,$f2 
     syscall
     li $v0,4
     la $a0,messagef
     syscall
     li $v0,10
     syscall
     
