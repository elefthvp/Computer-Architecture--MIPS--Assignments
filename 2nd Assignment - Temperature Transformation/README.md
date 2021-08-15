# Problem Statement
<p align=justify> The topic of this assignment is the transformation of temperature in Celsius to Fahrenheit or the reverse, according to the user's choice.<br> </p>

# Operation Principle
## Inputs 
<p align=justify> At the beginning of the implemented code, the user is asked to input a character 'c' or 'f' using the keyboard and press ENTER for the programme to continue its execution.
Inserting 'c' means that the temperature value to be input will be in Celsius and a Fahrenheit result is expected, while 'f' means the opposite.<br> </p>

## Outputs
<p align=justify> The code ouputs the result of the transformation and the correct temperature unit symbol as well as certain fixed string messages that enable the communication with the user. <br> </p>

## Temperature Transformation
<p align=justify> The employed transformation formulas are: <br></p>

-  F = <span>9/5</span> C + 32
-  C = <span>5/9</span> (F - 32)

# Key Commands
<p align=justify> The MIPS scheme falls within the RISC Architecture Category, meaning the set of available instructions is highly limited. As a result, blocks of basic commands are employed to carry out essential functions that would otherwise (i.e. in a high-level programming language) be easy to implement with just one simple command. <br></p>
<p align=justify> Some fundamental MIPS Assembly commands used in this software can be seen below: <br></p>

- `syscall` : used for a set of system services like input, output and exit. The desired system service is defined prior to using the `syscall` command by loading a certain integer in the register `$v0` using the load immediate command `li`.
- `add.s` `destination,src1,src2` : sum of the floating float doubles in src1,src2 is calculated and put in destination.
- `sub.s` `destination,src1,src2` :  subtraction of the floating float doubles in src1,src2 is calculated and put in destination.
- `mul.s` `destination,src1,src2` : multiplication of the floating float doubles in src1,src2 is calculated and put in destination.
-  `div.s`  `destination,src1,src2` : division of the floating float doubles in src1,src2 is calculated and put in destination.
-  `li`,`lw`,`la`  `destination,source`: load immediate, word or addres from `source` to `destination`. In the case of immediate, source is an integer. 
-  `jal code_block`: jump to `code_block`, a part of code with a unique name defined by the user somewhere in the programme.
-   `beq r1,r2,code_block` : check if content of r1 is equal to r2 and if true, jump to a part of code with a unique name defined by the user somewhere in the programme.
-   `cvt.s.w destination,source` : convert the single precision floating point number or integer in source to a double precision number and put it in the destination register.
-   `lui` : load upper immediate
-   `lwc1` `destination,offset($gp)` : load a word from memory to a coprocessor general register.
