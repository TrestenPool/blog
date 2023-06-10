---
author: Tresten Pool
layout: post
title: 'Microcontroller Embedded C Programming: Absolute Beginners'
date: 2023-06-04 10:25 -0500
categories: [Programming]
tags: [c, microcontroller, programming] 
image:
  path: /2023-06-04-microcontroller-embedded-c-programming-absolute-beginners/microcontroller_udemy.png
---

<!------------------------------------------------------->
<!------------ C COMPILATION & EXECUTION ---------------->
<!------------------------------------------------------->
## Index of Topics
---
> [Overview]()
>> + [Hardware used for this course](#1.1)
>> + [Asked chatgpt to write me curriculium for embedded systems](#1.2)

> [Basic Usage]()
>> + [How printf works on the microcontroller](#2.1)


<!------------------------------------------------------->
<!------------ HARDWARE USED FOR THE COURSE ------------->
<!------------------------------------------------------->
<br><br><br>
### Hardware used for this course <a id='1.1'></a>
---
- Board Name: 
  - STM32F4DISCOVERY
  - <https://www.st.com/en/evaluation-tools/stm32f4discovery.html>
  
- Features
  - STM32F407VGT6 microcontroller featuring 32-bit Arm® Cortex®-M4 with FPU core, 1-Mbyte Flash memory and 192-Kbyte RAM in an LQFP100 package
  - USB OTG FS
  - ST MEMS 3-axis accelerometer
  - ST-MEMS audio sensor omni-directional digital microphone
  - Audio DAC with integrated class D speaker driver
  - User and reset push-buttons
  - USB with Micro-AB
  - Stereo headphone output jack
  - 2.54 mm pitch extension header for all LQFP100 I/Os for quick connection to prototyping board and easy probing
  - Flexible power-supply options: ST-LINK, USB VBUS, or external sources
  - External application power supply: 3 V and 5 V
  - Comprehensive free software including a variety of examples, part of STM32CubeF4 MCU Package, or STSW-STM32068 for using legacy standard libraries
  - On-board ST-LINK/V2-A debugger/programmer with USB re-enumeration capability: mass storage, Virtual COM port, and debug port
  - Support of a wide choice of Integrated Development Environments (IDEs) including IAR Embedded Workbench®, MDK-ARM, and STM32CubeIDE



<!------------------------------------------------------->
<!----------------- CHAT GPT CURRICULUM ---------------->
<!------------------------------------------------------->
<br><br><br>
### I asked ChatGPT to write me a curriculium to learn embedded systems. <a id='1.2'></a>
---

1. Basics of Embedded Systems:
- Understand the fundamentals of embedded systems, including hardware-software interaction, real-time constraints, and resource limitations.Study microcontroller architecture, digital logic, and basic electronics.


2. C Programming Language:
- Refresh your knowledge of the C programming language, as it is widely used in embedded systems development. Focus on low-level programming concepts, memory management, bitwise operations, and working with registers and pointers.

3. Embedded Systems Development Tools:
- Familiarize yourself with the tools commonly used in embedded systems development, such as IDEs, compilers, debuggers, and emulators. Learn to set up and configure development boards and microcontrollers for programming.

4. Microcontroller Architecture:
- Deep dive into microcontroller architectures, such as ARM Cortex-M series or PIC, and understand their features, peripherals, and memory organization. Study the datasheets and reference manuals provided by the microcontroller manufacturers.

5. Embedded Systems Programming:
- Explore topics like digital I/O, timers, interrupts, analog-to-digital conversion, and serial communication protocols (UART, SPI, I2C). Learn how to interface with sensors, actuators, and other external devices.

6. RTOS and Real-Time Programming:
- Gain an understanding of real-time operating systems (RTOS) and their concepts like task scheduling, synchronization, and inter-process communication. Learn to develop multi-threaded applications for embedded systems.

7. Embedded Systems Software Design:
- Study software design principles for embedded systems, including modular programming, code reuse, and software architectures. Explore design patterns specific to embedded systems.

8. Embedded Systems Testing and Debugging:
- Learn various testing and debugging techniques specific to embedded systems, such as using in-circuit emulators, logic analyzers, and oscilloscopes. Understand how to troubleshoot hardware and software issues.

9. Low-Level Hardware Interfacing:
- Dive into low-level hardware interfacing techniques, including direct register access, device drivers, and peripheral programming. Explore topics like DMA (Direct Memory Access) and interrupt handling.

10. Embedded Systems Projects:
- Undertake hands-on projects to apply your knowledge and gain practical experience. Develop projects that involve sensor interfacing, motor control, communication protocols, or any specific area of interest within embedded systems.

11. Industry Standards and Best Practices:
- Stay updated on industry standards, protocols, and best practices related to embedded systems development. Follow blogs, forums, and relevant publications to stay abreast of the latest advancements in the field.


<!------------------------------------------------------->
<!------ How printf works on the microcontroller -------->
<!------------------------------------------------------->
<br><br><br>
### How printf works on the microcontroller <a id='2.1'></a>
---

- Only applicable to MCU's based on **ARM Cortex (M3, M4, M7)** or higher processors
- Works over **SWO pin (Serial Wire Output)** of SWD interface
  - ![swo logic](/2023-06-04-microcontroller-embedded-c-programming-absolute-beginners/swo_logic.png){: height="100"}
    - The processor communicates on the *swo pin* to send data to the *debug circuit* on the board
