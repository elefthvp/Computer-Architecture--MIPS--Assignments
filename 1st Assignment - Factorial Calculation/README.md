# Problem Statement
<p align=justify> The topic of this assignment was the calculation of the factorial of an integer number input to the system by the user.<br> </p>

# Operation Principle
## Inputs 
<p align=justify> At the beginning of the implemented code, the user is asked to input an integer value using the keyboard and press <ENTER> for the programme to continue its execution. <br> </p>

## Outputs
<p align=justify> The code ouputs the results of the factorial calculation as well as certain fixed string messages that enable the communication with the user. <br> </p>

## Factorial Calculation
<p align=justify> The factorial of the desired number is calculated using a recursive methodology. More specifically, the input undergoes a subtraction by 1, recursively. In the main body of the recursive algorithm, a condition is checked everytime to decide whether the value used to call the function is finally equal to 1. If yes, the recursion finally returns bottom-up, multiplying the so-far result with its upper integer for each time, thus calculating the factorial. <br></p>

# Key Commands
<p align=justify> The MIPS scheme falls withn the RISC Architecture Category, meaning the set of available instructions is highly limited. As a result, blocks of basic commands are employed to carry out essential functions that would otherwise (i.e. in a high-level programming language) be easy to implement with just one simple command. <br></p>
<p align=justify> Some fundamental MIPS Assembly commands used in this software can be seen below: <br></p>

- `syscall` : used for a set of system services like input, output and exit. The desired system service is defined prior to using the `syscall` command by loading a certain integer in the register `$v0` using the load immediate command `li`.
- `addi`  `destination,source,immediate` : add the number in `immediate` to `source` and store the result in `destination` register.
-  `li`,`lw`,`la`  `destination,source`: load immediate, word or addres from `source` to `destination`. In the case of immediate, source is an integer. 
-  `jal code_block`: jump to `code_block`, a part of code with a unique name defined by the user somewhere in the programme.
-  `jr register`: jump to a register.
-   `slti destination,source,immediate`: check if the content of source is less than immediate and store result in source.
-   `beq r1,r2,code_block` : check if content of r1 is equal to r2 and if true, jump to a part of code with a unique name defined by the user somewhere in the programme.
