# Assembly

A repo containing some assembly code I wrote during a learning phase. All
examples will be in Netwide Assembly (NASM).

## Prerequisites for Linux

- GCC: GNU project C and C++ compiler
- GDB: GNU Debugger
- MAKE: GNU make utility
- NASM: Netwide Assembler

You can install the required prerequisites using the following command.

```sh
sudo apt install build-essential gcc gdb make nasm
```

## Recommended books

- [Beginning x64 Assembly Programming - Jo Van Hoey](https://www.amazon.com/Beginning-x64-Assembly-Programming-Professional/dp/1484250753)

## Binary and hexadecimal numbers, key points

- Signed integers have the leftmost bit set to 1 if negative and 0 if positive.
- You obtain the binary representation of a negative number by taking the
  complement of the absolute value and adding 1 to the right most bit.
- Hexadecimal numbers are normally preceded with 0x in order to distinguish them from decimal numbers.
- Floating-point numbers are written in binary or hexadecimal according to the
  IEEE-754 standard. You can learn more about floating point numbers [Here](http://mathcenter.oxford.emory.edu/site/cs170/ieee754/).

## Registers

### Types of registers

The below list only exposes some of the many registers.

- **General purpose**
  - There are 16 general-purpose registers, and each register can be used as a
	64-bit, 32-bit, 16-bit, or 8-bit register.
  - Registers are a sort of scratchpad for the processor to store temporary information.
  - The CPU can access registers much faster than it can access memory.
  - A 32-bit register is the set of the 32 lower (rightmost) bits of a 64-bit
    register. Similarly, a 16-bit register and an 8-bit register consist of the
    lowest 16 and lowest 8 bits, respectively, of the 64-bit register.

- **Instruction pointer register (rip)**
  - The processor keeps track of the next instruction to be executed by storing
    the address of the next instruction in rip.

- **Flag Register**
  - After executing an instruction, a program can check whether a certain flag
    is set (e.g., ZF=1) and then act accordingly.

- **xmm and ymm Registers**
  - These registers are used for floating-point calculations and SIMD (Single
    Instruction/Multiple Data).

## GDB debugging

You can debug your compiled assembly executable-file by running `gdp
./path/to/executable-file`. GDB will load the executable into memory and answer
with its own prompt, waiting for your instructions. Here some simple commands
you can use inside the GDB prompt:

- **help**
  - Can be used to get information about specific GDB commands, for example
    `help list`.

- **list**
  - List specified function or line. With no argument, lists ten more lines
    after or around previous listing.

- **run**
   - Start debugged the program.

- **set disassembly-flavor**
  - Changes the disassembly flavor. The valid values are "att" and "intel", and
    the default value is "att".

- **disassemble main**
  - Disassemble a specified section of memory.

- **x/s**
  - xamine memory: x/FMT ADDRESS. ADDRESS is an expression for the memory
    address to examine. FMT is a repeat count followed by a format letter and a
    size letter. You can also use the address of operator (`&`) followed by the
    variable name.

- **break**
  - Set breakpoint at specified location.

- **info registers**
  - List of integer registers and their contents, for selected stack frame.

You can also create an `.gdbinit` file in your home directory to set some custom
default `GDB` values.

## Reading disassembled assembly form GDB

The original assembly function source code, simple hello world.

```asm
main:
	mov    rax, 1       ; 1 = write
	mov    rdi, 1       ; 1 = stdout
	mov    rsi, msg     ; string to display in rsi
	mov    rdx, 12      ; length of the string, without 0
	syscall             ; display the string
	mov    rax, 60      ; 60 = exit
	mov    rdi, 0       ; 0 = success exit code
	syscall             ; quit
```

The dumped assembly from GDB.

```asm
Dump of assembler code for function main:
   0x0000000000401110 <+0>:	    mov    eax,0x1
   0x0000000000401115 <+5>:	    mov    edi,0x1
   0x000000000040111a <+10>:	movabs rsi,0x404028
   0x0000000000401124 <+20>:	mov    edx,0xc
   0x0000000000401129 <+25>:	syscall
   0x000000000040112b <+27>:	mov    eax,0x3c
   0x0000000000401130 <+32>:	mov    edi,0x0
   0x0000000000401135 <+37>:	syscall
End of assembler dump.
```

- The register `rax` has been changed to `eax` automatically because the
  assembler is smart enough to figure out that a 64-bit register is too big, so
  it was changed to a 32-bit register instead. The 64-bit assembler is an
  extension of the 32-bit assembler, and you will see that whenever possible the
  assembler will use 32-bit instructions.
- The 0x1 is the hexadecimal representation of the decimal number 1, 0xd is
  decimal 13, and 0x3c is decimal 60.
- The instruction `mov` `rsi`, `msg` got replaced by movabs `rsi`,`0x601030`. The `0x601030`
  is the memory address where msg is stored on our computer.
