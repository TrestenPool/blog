---
author: Tresten Pool
layout: post
date: 2023-05-30 20:10 -0500
categories: [Programming]
tags: [c, gdb, programming] 
image:
  path: /2023-06-02-gdb-refresher/Screenshot from 2023-06-02 12-33-33.png
---

# GDB Refresher
![image](/2023-06-02-gdb-refresher/1.png)

## Compiling a c program and running it
```bash
gcc -g program.c -o program
```
- To call run the debugger on the program now all you need to do is `gdb program`

## Layouts
- show layout of the code

## Focus
![image](/2023-06-02-gdb-refresher/2.png)

- You can change the focus of different parts of the gdb interface
  - show the registers
    - `layout reg`
  - show the assembly
    - `layout asm`
  - show the actual code
    - `layout src`

## Printing



