---
author: Tresten Pool
layout: post
title: C compilation and execution
date: 2023-06-04 14:50 -0500
categories: [Programming]
tags: [c ,programming, assembly, compilation] 
image:
  path: /2023-06-04-c-compilation-and-execution/book_of_c.jpeg
---

# C compilation and execution

![compilation steps](/2023-06-04-c-compilation-and-execution/Compilation-Process-in-C.png){: width="972" height="589" }

### Steps
1. Preprocessing:
  - The preprocessor (part of the compiler) processes the source code before actual compilation. 
  - It handles directives such as #include, #define, and #ifdef, expanding macros and including header files. 
  - Preprocessing eliminates comments and replaces macros with their respective definitions.

2. Compilation
  - The preprocessed code is passed to the compiler, which generates assembly code specific to the target architecture. 
  - The compiler performs syntax and semantic analysis, checking for errors and generating object code.
  - The output is an object file (often in a binary format like ELF) containing machine code and unresolved references to functions and variables.

3. Linking
  - The linker takes the object file generated during compilation and resolves the unresolved references. 
  - It resolves function calls and variable references by searching for their definitions in other object files or libraries. 
  - The linker generates an executable file, combining the object file with any necessary library code.
  - If there are unresolved references, it will result in a linker error.

4. Loading
  - The operating system's loader takes the generated executable file and prepares it for execution.
  - The loader allocates memory to hold the program's code, data, and stack.
  - It resolves external dependencies and performs necessary address relocations.
  - Finally, it transfers control to the program's entry point (typically the main function).

  5. Execution
  - The program's code is executed by the processor, following the instructions in the machine code.
  - Global variables are initialized, and the program begins executing statements within the main function.
  - The program may interact with input/output devices, perform computations, and call other functions as needed.
  - Once the main function completes or encounters a return statement, the program terminates, and control is returned to the operating system.
