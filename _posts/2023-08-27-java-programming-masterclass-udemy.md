---
layout: post
title: Java Programming Masterclass Udemy
date: 2023-08-27 22:15 -0500
author: Tresten Pool
categories: [Udemy, Java]
tags: [Java, Programming, Udemy] 
image: 
  path: /2023-08-27-java-programming-masterclass-udemy
---

<!-- no toc -->
# Table of contents
- [Table of contents](#table-of-contents)
- [About this blog entry](#about-this-blog-entry)
- [Cheat Sheet](#cheat-sheet)
- [Java Blog](#java-blog)
  - [Jshell](#jshell)
  - [Data types](#data-types)
    - [Primitive Data types vs Wrapper Classes](#primitive-data-types-vs-wrapper-classes)
    - [Converting string value to the different primitive data types with **Parse**](#converting-string-value-to-the-different-primitive-data-types-with-parse)
    - [Casting](#casting)
    - [Max and min value of any datatype](#max-and-min-value-of-any-datatype)
    - [Unicode](#unicode)
    - [Doubles and floats](#doubles-and-floats)
      - [Specifiying long numbers with \_underscores not commas](#specifiying-long-numbers-with-_underscores-not-commas)
      - [Java Datatype variable specifie suffixes](#java-datatype-variable-specifie-suffixes)
      - [Why double is a better choice in most circumstances](#why-double-is-a-better-choice-in-most-circumstances)
      - [BigDecimal](#bigdecimal)
    - [Compound Assignment](#compound-assignment)
    - [Get the datatype of a primitive data type](#get-the-datatype-of-a-primitive-data-type)
    - [Get the datatype of a wrapper classs or object](#get-the-datatype-of-a-wrapper-classs-or-object)
    - [Scientific Notation](#scientific-notation)
    - [Booleans](#booleans)
    - [Strings](#strings)
      - [Accesing characters in strings](#accesing-characters-in-strings)
      - [Getting the lenght of a string](#getting-the-lenght-of-a-string)
      - [String Formatting](#string-formatting)
      - [StringBuilder](#stringbuilder)
    - [Getting input](#getting-input)
  - [Access Modifers](#access-modifers)
  - [Intellij Shortcuts / Live templates](#intellij-shortcuts--live-templates)
  - [Methods](#methods)
    - [Default Parameters](#default-parameters)
  - [Exceptions](#exceptions)
    - [Try, Catch](#try-catch)
    - [Checked vs Un-Checked](#checked-vs-un-checked)
  - [How a java program is ran](#how-a-java-program-is-ran)
    - [Compile time](#compile-time)
    - [Run time](#run-time)
    - [Java Path](#java-path)
  - [Serialization](#serialization)
    - [What is Serialization](#what-is-serialization)
    - [How it is implementated](#how-it-is-implementated)

# About this blog entry 
  - profecient in java and coded in java all throughout college. But haven't finished the udemy class and would like to.
  - I also forget some of the syntax and would like to include things like that in this blog entry


<!------------------------------------------------------------------------->
<!------------------------------ CHEAT SHEET ------------------------------>
<!------------------------------------------------------------------------->
# Cheat Sheet
  - [Cheat sheet java programming language](https://introcs.cs.princeton.edu/java/11cheatsheet/)

# Java Blog

<!------------------------------------------------------------------------->
<!------------------------------ JSHELL ----------------------------------->
<!------------------------------------------------------------------------->
## Jshell
  - REPL for java terminal





<!------------------------------------------------------------------------->
<!-------------------------------- DATATYPES ------------------------------>
<!------------------------------------------------------------------------->
## Data types

### Primitive Data types vs Wrapper Classes
  - explain

### Converting string value to the different primitive data types with **Parse**
  - Convert String value to an integer
    - `Integer.parseInt(mystringvar);`

  - Convert String value to an double
    - `Double.parseDouble(mystringvar);`

  - Convert String value to a long
    - `Long.parseLong(mystringvar);`

### Casting
  - `int x = (int) ( 10.5 / 2)`

### Max and min value of any datatype
  - Getting the max
    - `Integer.MAX_VALUE`

  - Getting min value
    - `Integer.MIN_VALUE`

  - It is the same for all primitives, just replace the datatype
    - `Double.MIN_VALUE`

### Unicode
  - Java uses unicode for characters. Ascii is a subset that is included in unicode 
  - `char mycharvar = '\u003F'`
    - Assigns the variable the question mark symbol

### Doubles and floats

#### Specifiying long numbers with _underscores not commas
  - `double dval = 2_000_000`
    - this will assign the variable 2 million, the _ are just there for visual help for us but don't actually do anything
  - `double dval = 2_0_0`
    - just to show you these underscores don't mean anything besides helping us view, here is us assigning the value 200 to the variable

#### Java Datatype variable specifie suffixes
  - The following allow for both lowercase and uppercase Letters but they have their own recoomendation like long **L**
  - any whole number is an integer by default
  - any real number is a double by default

  - Long
    - `long mylongval = 100000L`
    - it is important to specifiy the **L** at the end of the number
    - this tells the compiler to treat this number as a long variable, otherwise it will treat as an integer by default
    - Here is an example of the issue you could run into
    - ![long example error](/2023-08-27-java-programming-masterclass-udemy/long_example.png)
  
  - Float
    - `float myfloatval = 12.4f`

  - Double
    - `float myfloatval = 1123122.d`

#### Why double is a better choice in most circumstances
  - doubles are better most of the time over float
  - because modern computers process doubles more efficiently than floats most times because how computer memory and the ALU chip works. 
  - A lot of java libraries particular in math functions process doubles and not floats

#### BigDecimal  
  - float and double are good data types for general floating point operations
  - but neither shoudl be used when precise calculations are required
    - this is just a problem with how floating point numbers are stored, not just a java problem
  - Java has a class called **BigDecimal** that overcomes this

### Compound Assignment
  - ex. `myIntVariable += 1`
  - When we do compound assignments there is actually a cast that happens
    - `myIntVariable = (int) (myIntVariable + 1)`

### Get the datatype of a primitive data type
  - `((Object) myvar).getClass().getName()`

### Get the datatype of a wrapper classs or object
  - `myobjectvariable.getClass().getName()`

### Scientific Notation
  - `double dvalue = 2e5`
    - 2.0 * 10^5 = 200000.0

### Booleans
  - Wrapper class for boolean is **Boolean**

### Strings
  - immutable

#### Accesing characters in strings
  - Java does **not support bracket notation** to access index in arrays
  - ex. `mystring[2]` will throw an error
  - instead use `mystring.charAt(2)`. This will return the character at the 2nd index to you

#### Getting the lenght of a string
  - `mystring.length()`

#### String Formatting
  - `System.out.println("Hello " + namevariable + ", it is nice to meet you")`;
    - formatting a string to print

  - `String greeting = String.format("Hello %s, it is a pleasure to meet you", name);`
    - formatting a new string with other string variables
    - List of format specifiers
    - ![](/2023-08-27-java-programming-masterclass-udemy/string-formatting-table.png)
    
#### StringBuilder
  - Stringbuilder is a muttable string class
  - StringBuilder does NOT share the String's special features such as being able to assign a literal value or use the + operator on it


### Getting input 
  - 4 options
  - 1: System.in
    - ```java
    import java.io.BufferedReader;
    import java.io.IOException;
    import java.io.InputStreamReader;
    public class Test {
        public static void main(String[] args)
            throws IOException
        {
            // Enter data using BufferReader
            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

            // Reading data using readLine
            String name = reader.readLine();

            // Printing the read line
            System.out.println(name);
        }
    }
    ```
- The input is buffered for effecient reading
- Wrapping code is hard to remember

  - 2: System.console
    - ```java
    public class Main {
        public static void main(String[] args) {
            System.out.print("Enter your name: ");
            String name = System.console().readLine();

            System.out.println("Your name is " + name);
        }
    }
    ```
  - Doesn't require any libraries to include
  - Con: only works in interactive environments like a terminal. 
  - Con: will NOT work in an IDE

  - 3: Command line arguments
    - ```java
    public class Main {
        public static void main(String[] args) {
            if (args.length > 0) {
                System.out.println("The command line arguments are:");

                for (String val : args)
                    System.out.println(val);
            }
            else{
                System.out.println("No command line "+ "arguments found.");
            }
        }
    }
    ```
  - not interactive
    
  - 4: Scanner
    - ```java
    import java.util.Scanner;
    public class Main {
        public static void main(String[] args) {
            Scanner sc = new Scanner(System.in);
            System.out.print("Enter your name: ");
            String name = sc.nextLine();

            System.out.println("Nice to meet you " + name);
        }
    }
    ```

  - Recommended
  

<!------------------------------------------------------------------------->
<!---------------------------- ACCESS MODIFERS ---------------------------->
<!------------------------------------------------------------------------->
## Access Modifers
  - Here are the 4 types of access modifers
    - ![](/2023-08-27-java-programming-masterclass-udemy/access-modifers.png)
  



<!------------------------------------------------------------------------->
<!------------------------------- INTELLIJ -------------------------------->
<!------------------------------------------------------------------------->
## Intellij Shortcuts / Live templates
  - Live templates are awesome for quick generation of frequenly typed code
    - ex. 
      - psvm (main function)
      - sout (System.out.println())
  - [Intellij link to live templates](https://www.jetbrains.com/help/idea/using-live-templates.html#live_templates_types)

<!------------------------------------------------------------------------->
<!------------------------------- METHODS --------------------------------->
<!------------------------------------------------------------------------->
## Methods

### Default Parameters
  - Java does not support default values for parameters
  - instead use the Builder design pattern [](https://www.newthinktank.com/2012/09/builder-design-pattern-tutorial/)
  - or do something like this
    - `Dog myPetDog = new Dog().setName("Clifford").setColor("Red").setAge(12);`
    - Note: this will not work if you have required fields that require arguments to be passed through, that is when you would use the **Builder pattern**


<!------------------------------------------------------------------------->
<!------------------------------- EXCEPTIONS ------------------------------>
<!------------------------------------------------------------------------->
## Exceptions

### Try, Catch
  - ```java
    try{
      // statement that might get errors
    }
    catch(IOException e){
      // prints out the stack trace
      e.printStackTrace();

      // gets the error message
      String errorMessage = e.getMessage();
    }
    finally{
      // optional: statements that get executed no matter if exception was caught or not
    }
  ```

### Checked vs Un-Checked
  - explain


<!------------------------------------------------------------------------->
<!------------------------------ Java program ----------------------------->
<!------------------------------------------------------------------------->
## How a java program is ran
  - [](https://www.javatpoint.com/internal-details-of-hello-java-program)

### Compile time
  - ![](/2023-08-27-java-programming-masterclass-udemy/compile_time.png)

### Run time
  - ![](/2023-08-27-java-programming-masterclass-udemy/runtime.png)

### Java Path
  - what is the java path

<!------------------------------------------------------------------------->
<!---------------------------- SERIALIZATION ------------------------------>
<!------------------------------------------------------------------------->
## Serialization

### What is Serialization
  - Serialization in Java allows us to convert an Object to stream that we can send over the network or save it as file or store in DB for later usage. Deserialization is the process of converting Object stream to actual Java Object to be used in our program. 
  - If you want a class object to be serializable, all you need to do it implement the `java.io.Serializable`` **interface**. 
  - Serializable in java is a marker interface and has no fields or methods to implement. It’s like an Opt-In process through which we make our classes serializable. 

### How it is implementated
  - Serialization in java is implemented by **ObjectInputStream** and **ObjectOutputStream**