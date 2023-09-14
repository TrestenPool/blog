---
layout: post
title: Java Programming Masterclass Udemy
date: 2023-08-27 22:15 -0500
author: Tresten Pool
categories: [Udemy, Java]
tags: [Java, Programming, Udemy] 
image: 
  path: /2023-08-27-java-programming-masterclass-udemy/profile.png
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
    - [Var](#var)
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
      - [Joining](#joining)
  - [Arrays](#arrays)
    - [Notes](#notes)
    - [Declaration](#declaration)
    - [Instanciating](#instanciating)
    - [Sorting](#sorting)
    - [Searching](#searching)
    - [Equality](#equality)
    - [Fill](#fill)
    - [CopyOf](#copyof)
    - [Multi-Dimensional arrays](#multi-dimensional-arrays)
      - [Declaration](#declaration-1)
      - [Printing](#printing)
  - [Iterator](#iterator)
    - [Iterator Position](#iterator-position)
    - [ListIterator](#listiterator)
  - [List, ArrayList, LinkedLists, Iterator, Autoboxing](#list-arraylist-linkedlists-iterator-autoboxing)
    - [ArrayList](#arraylist)
    - [LinkedList](#linkedlist)
  - [Autoboxing, Unboxing](#autoboxing-unboxing)
    - [Autoboxing](#autoboxing)
  - [Enums](#enums)
    - [Declaring](#declaring)
  - [Collections](#collections)
  - [Hash codes](#hash-codes)
  - [this() super() constructor methods](#this-super-constructor-methods)
    - [this() super() example](#this-super-example)
  - [POJO'S](#pojos)
    - [Record Data type](#record-data-type)
    - [Protected](#protected)
    - [Public](#public)
  - [Intellij Shortcuts / Live templates](#intellij-shortcuts--live-templates)
  - [Methods](#methods)
    - [Default Parameters](#default-parameters)
    - [Method Overriding \& Method Overloading](#method-overriding--method-overloading)
      - [Method Overriding](#method-overriding)
        - [Rules](#rules)
      - [Method Overloading](#method-overloading)
    - [Covariant return types](#covariant-return-types)
    - [Variable Arguments](#variable-arguments)
    - [Checked vs Un-Checked](#checked-vs-un-checked)
  - [How a java program is ran](#how-a-java-program-is-ran)
    - [Compile time](#compile-time)
    - [Run time](#run-time)
    - [Java Path](#java-path)
    - [Objects vs References vs Instance vs Class](#objects-vs-references-vs-instance-vs-class)
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

--- 

# Java Blog

<!------------------------------------------------------------------------->
<!------------------------------ JSHELL ----------------------------------->
<!------------------------------------------------------------------------->
## Jshell
  - REPL for java terminal

--- 


<!------------------------------------------------------------------------->
<!-------------------------------- DATATYPES ------------------------------>
<!------------------------------------------------------------------------->
## Data types

### Primitive Data types vs Wrapper Classes
  - explain

---
### Converting string value to the different primitive data types with **Parse**
  - Convert String value to an integer
    - `Integer.parseInt(mystringvar);`

  - Convert String value to an double
    - `Double.parseDouble(mystringvar);`

  - Convert String value to a long
    - `Long.parseLong(mystringvar);`

--- 

### Casting
  - `int x = (int) ( 10.5 / 2)`

### Var
  - **(LVTI)** Local variable type inference was introduced in Java 10
  - Lets you assign a variable where the type is decided at runtime
  - `var mymovie =  new Horror("Alien vs Predator");`
    - constraint
      - can't be used in field declarations
      - can't be used in method signatures, either as parameter or as return type

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

  - `System.out.printf("Your age is %d", age);`

  - ```java
    for(int i = 10; i < 10_000_000; i*=10){
        System.out.printf("i = %7d\n", i);
    }
  ```
  - outuput
    - ```text
      i =      10
      i =     100
      i =    1000
      i =   10000
      i =  100000
      i = 1000000
    ```

  - `String greeting = String.format("Hello %s, it is a pleasure to meet you", name);`
    - formatting a new string with other string variables
    - List of format specifiers
    - ![](/2023-08-27-java-programming-masterclass-udemy/string-formatting-table.png)

#### Substrings
  - ```java
    String birthdate = "01/29/1999";
    System.out.println(birthdate.substring(0, 2) + " ==> " + birthdate.substring(3, 5) + " ==> " + birthdate.substring(6));
  ```

#### Joining
  - ```java
    String newDate = String.join("/", "12", "12", "51", "1999");
  ```

    
#### StringBuilder
  - Stringbuilder is a muttable string class
  - StringBuilder does NOT share the String's special features such as being able to assign a literal value or use the + operator on it

#### Text Block
  - a special format for **multi-line String literals**
  - simply a String, with a new representation in the source code
  - It became official **JDK 15**
  - ```java
      // old way
      String bulletIt = "Print a bulleted list: \n" +
              "\t\u2022 First Point" + "\n" +
              "\t\u2022 Second Point" + "\n";
      System.out.println(bulletIt);


      // new way with textblock """ text goes here """
      String textblock = """
              Print a Bulleted List:
                  \u2022 First Point
                  \u2022 Second Point""";
      System.out.println(textblock);
  ```

<!--------------------------------------------------------------------------->
<!------------------------------- ARRAYS ------------------------------------>
<!--------------------------------------------------------------------------->
## Arrays
  - something

### Notes
  - Arrays are not resizable
  - You can't add or delete elements
  - You can only modify values 

### Declaration
    - ```java
      int[] integerArray;
      String[] nameList;
      
      // not as common to have the square brackets after the array variable name
      String courseList[];
    ```

### Instanciating
  - ```java
    int[] integerArray = new int[10];
  ```

### Print 
  - Easy way to print out all elements out instead of using a for or for each loop is to use the static method in Arrays
  - ```java
    int[] integerarray = {1,2,3,4,5,6,6};

    // this will print out all of the elements in the array in square brackets comma delimited
    System.out.println(Arrays.toString(integerarray));
  ```

### Sorting
  - `Arrays.sort(myintarray);`
  - You have to use the static method **sort** in Arrays class

### Searching
  - Best way to search through a sorted array is using `Arrays.binarySearch(arr, "key");`
    - returns the index of where it found the element, -1 if not found
    - has to be sorted before using

### Equality
  - you can check if two arrays have the same elements with `Arrays.equals(arr1, arr2);`

### Fill
  - `Arrays.fill(myintarray, 0);`
  - This will fill all of the elements in the array with 0

### CopyOf
  - `int[] secondarr = Arrays.copyOf(myintarray, myintarray.length);`

### Multi-Dimensional arrays

#### Declaration
  - standard matrix declaration
  - ```java
    // declare 3x3 matrix, defaults to 0's
    int[][] array = new int[3][3];
  ```
  - Multi-dimensional array with varrying lengths
  - ```java
    // 3 row matrix varrying lengths of rows
    int[][] matrix = new int[3][];

    matrix[0] = new int[5];
    matrix[1] = new int[2];
    matrix[2] = new int[3];
  ```

#### Printing
  - easiest way to print out multi dimensional array with **Arrays.deepToString()**
  - ```java
    System.out.println(Arrays.deepToString(matrix));
 
  
<!--------------------------------------------------------------------------->
<!------------------------------- ITERATORS --------------------------------->
<!--------------------------------------------------------------------------->
## Iterator
  - Notes
    - Iterator starts off before the first element, meaning it is not pointing to anything when you first get the iterator
    - Only goes forward
    - Cannot get the current element it is currently pointed to, it can only go to the next object and return you that object
    - You can't reset an interator, once it finishes its traversal it is done, if you wanted to reset it you would have to request a new iterator
  
  - methods
    - **Collection.iterator()** - get the iterator
      - `Iterator iterator = Collection.iterator()`
    - **Iterator.hasNext()** - Checks to see if there is another element to go to next
      - `while(iterator.hasNext())`
    - **Iterator.next()** - goes to the next element
      - `iterator.next()`
    - **Iterator.remove()** - removes the element that is currently at the cursor of the iterator

### Iterator Position
  - The iterator position never at an index but between the indexes
  - ![](/2023-08-27-java-programming-masterclass-udemy/iterator.png)

### ListIterator
  - Notes
    - there is a list iterator
    - Adds a couple more methods
      - **ListIterator.previous** - Goes to the prevoius object 
    - Adds an object at the current cursor
      - **ListIterator.add()** - Adds an object at the current position in the list
    - Removes an object in the current cursor


<!--------------------------------------------------------------------------->
<!--------- Lists, Arraylist, LinkedList, Iterator, Autoboxing ------------->
<!--------------------------------------------------------------------------->
## List, ArrayList, LinkedLists, Iterator, Autoboxing
  - They are **java containers**
  - **No support** for **primitive** datatypes 
  - Why do we have these in the first place when we have arrays
    - Arrays are mutable but **do not** **allow for resizing**
  - List is the interface that classes like the ArrayList implement to achieve consistency
  - Make sure to specify a type in the diamond brackets because otherwise it will default to the **raw parameterized type**
    - `ArrayList mylist = new ArrayList(); // raw type`
    - `ArrayList<Integer> mylist = new ArrayList<>() //  specifying type;`
      - Make sure to include the <> on the right side of the assignment otherwise it will default to raw type

### ArrayList
  - Differences between arrays and arraylists
    - ![](/2023-08-27-java-programming-masterclass-udemy/array_arraylist.png)
    - ![](/2023-08-27-java-programming-masterclass-udemy/array_arraylist_search.png)
    - ![](/2023-08-27-java-programming-masterclass-udemy/array_arraylist_sort.png)
  - implments List
  - Does not implement Synchronizable therefore is **not thread-safe**
  - Maintains an array in memory that is actually bigger than what we need in most cases
  - Keeps track of the capacity and the size of the array and resizes if needed behind the scenes
  - ```java
    ArrayList<GroceryItem> grocerList = new ArrayList<>();
    grocerList.add(new GroceryItem("milk"));
    grocerList.add(new GroceryItem("yogurt"));
    grocerList.add(new GroceryItem("apples", "Produce", 6));

    System.out.println(grocerList);
  ```
  - instanciating an array with **Arrays.asList()**
  - ```java
    ArrayList<String> arrayList = new ArrayList<>(Arrays.asList("Hello", "World"));
  ```

### LinkedList
  - Can be more performance efficient if you are performing a majority of operations at the head or end of the list


<!--------------------------------------------------------------------------->
<!----------------------- AUTOBOXING, UNBOXING ------------------------------>
<!--------------------------------------------------------------------------->
## Autoboxing, Unboxing
  - Autoboxing
    - Going from primitive to wrapper class
  
  - Unboxing
    - Going from a wrapper to a primitive

### Autoboxing
  - **Integer.valueOf()** - Converts int to Integer
  - ```java
    // manually doing it ourselves
    int x = 15;
    Integer integer = Integer.valueOf(x);

    // Letting java do it for us (PREFERRED)
    Integer intWrappper = x;
  ```

### Unboxing
  - ```java
    Integer integer = 15;

    // manually unboxing
    int intval = integer.intValue();

    // letting java do it for us (PREFFERED)
    int intval = integer;
  ```

<!--------------------------------------------------------------------------->
<!------------------------------- ENUMS ------------------------------------->
<!--------------------------------------------------------------------------->
## Enums
  - A special data type that contains predefined constants.
  - like an array except, its elements are known, not changeable and can be referred to by its constant name instead of index position
  - ordered in the way you declare the constants

### Declaring
  - ```java
    public enum DayofTheWeek{
      Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
    }
  ```

### Usage
  - ```java
    // Assignment
    Enum<DayofTheWeek> day = DayofTheWeek.Monday;

    // printing out its name and its index
    System.out.printf("Value: %s\nIndex: %d", day.name(), day.ordinal());
  ```

  - methods
    - enumVariable.name() - name of the enum
    - enumVariable.ordinal() - index of the enum
  
  - Getting all of the enums with **Enum.values()**

  - ```java
    DayofTheWeek[] days = DayofTheWeek.values();
    for(DayofTheWeek curr_day: days){
        System.out.println(curr_day);
    }
  ```

### Switch statement 
  - ```java
    // Gets all of the enums
    var daysOfTheWeek = DayofTheWeek.values();
    var day = daysOfTheWeek[6];

    switch (day){
        case Monday -> System.out.println("I hate mondays");
        case Friday -> System.out.println("Woohoo, almost the weekend");
        case Saturday -> System.out.println("LET's get drunk tonight!!");
        case Sunday -> System.out.println("ohh, I feel like sh**, I'm resting for work tomorrow");
        default -> System.out.println("Just another weekday :(");
    }
  ```

<!--------------------------------------------------------------------------->
<!------------------------------- COLLECTIONS ------------------------------->
<!--------------------------------------------------------------------------->
## Collections
  - explain



<!--------------------------------------------------------------------------->
<!------------------------------- HASH CODES ------------------------------>
<!------------------------------------------------------------------------->
## Hash codes
  - hash codes are integers that are unique to an instance in the currently executing code
  - can be used if we have multiple references and see if the are pointing to the same object stored in the heap
  - mechanism for comparisons
  - think of it like the address in memory like in c

<!------------------------------------------------------------------------->
<!------------------------------- Java OOP -------------------------------->
<!------------------------------------------------------------------------->
## this() super() constructor methods

### this() super() example
  - keywords **extends** is used to extend from a base class
  - a child class can only extend from 1 parent class
  - In the constructor of the child class, the super() method is used to instantiate the superclass
  - **super() has to be the first line in the constructor of the child class**
  - **this() has to be the first line in the constructor it is calling from**

  - ```java
    public class Animal {
      private String type;
      private String size;
      private double weight;

      public Animal(String size, double weight){
        this.size = size;
        this.weight = weight;
        System.out.println("Animal 2 argument constructor finished");
      }

      public Animal(String type, String size, double weight) {
        this(size, weight);
        this.type = type;
        System.out.println("Animal 3 argument constructor finished");
      }
    }
  ```
  - ```java
    public class Dog extends Animal{
        public Dog(String size, double weight) {
            super("Dog", size, weight);
            System.out.println("Dog constructor finished");
        }

    }
  ```
    - If you were to execute the following code in Main `Dog myDog = new Dog("Medium", 32.0);`, you would get the output below
      - ```
        Animal 2 argument constructor finished
        Animal 3 argument constructor finished
        Dog constructor finished
      ```


<!------------------------------------------------------------------------->
<!------------------------------- POJOS ----------------------------------->
<!------------------------------------------------------------------------->
## POJO'S
  - Plain old java object
  - might also be referred to as a bean or javabean
  - A javabean is just a pojo with some extra rules applied to it
  - A Pojo is sometimes called a **Entity**, because it mirrors database entities
  - Another acronym is DTO, for Data transfer object

### Record Data type
  - records was introduced in **JDK 14**
  - called **"Plain Data Carriers"**
  - became officially part of Java in JDK 16
  - It's purpose is to replace the boilerplat code for the POJO, but more restrictive
  - special class that contains data, that's not meant to be altered
  - it seeks **immutability**
  - contains only constructor and accessors
  - best of all developers don't need to write the boilerplate code anymore
  - ```java
    public record LPAStudent(String id, String name, String dateOfBirth, String classList) {
    }
  ```
    - The line above is called the **Record Header**
    - the record header contains the **record components**
    - All of the record components are declared as **private and final**
    - Getters are just the name of the record component themselves
      - ex. to access id you would use student.id();


<!------------------------------------------------------------------------->
<!------------------------------- ANNOTATIONS ----------------------------->
<!------------------------------------------------------------------------->
## Annotations
  - Annotations are a type of metadata
  - a way of formally describing additional information about our code
  - Annotations are more structured, and have more meaning that comments
  - used by the compiler, or other pre-processing functions to get more information about the code


<!------------------------------------------------------------------------->
<!------------------------------- GETTING INPUT  -------------------------->
<!------------------------------------------------------------------------->
## Getting input 
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
    1. Default
    2. Private
    3. Protected
    4. Public
    - ![](/2023-08-27-java-programming-masterclass-udemy/access-modifers.png)
  - in Java, Access modifiers help to restrict the scope of a class, constructor, variable, method, or data member

### Default
  - When no access modifier is specified for a class, method, or data member – It is said to be having the default access modifier by default. 
  - having default access modifiers are accessible only within the same package

  - ```java
    // Java program to illustrate default modifier
    package p1;

    // Class Geek is having Default access modifier
    class Geek
    {
      void display()
      {
        System.out.println("Hello World!");
      }
    }
    ```

### Private
  - The methods or data members declared as private are accessible only within the class in which they are declared.
  - Top-level classes or interfaces can not be declared as private because
    - private means “only visible within the enclosing class”.
  - The following line of code will produce an error because display() method inside class A is private 

  - ```java
    // Java program to illustrate error while
    // using class from different package with
    // private modifier
    package p1;

    class A
    {
    private void display()
      {
        System.out.println("GeeksforGeeks");
      }
    }

    class B
    {
    public static void main(String args[])
      {
        A obj = new A();
        // Trying to access private method
        // of another class
        obj.display();
      }
    }
  ```

### Protected
  - The methods or data members declared as protected are accessible within the same package or subclasses in different packages.

  - ```java
    // Java program to illustrate
    // protected modifier
    package p1;

    // Class A
    public class A {
      protected void display() {
        System.out.println("GeeksforGeeks");
      }
    }
  ```

  - ```java
    // Java program to illustrate
    // protected modifier
    package p2;
    import p1.*; // importing all classes in package p1

    // Class B is subclass of A
    class B extends A {
      public static void main(String args[]) {
        B obj = new B();
        obj.display();
      }
    }
  ```

### Public
  - The public access modifier has the widest scope among all other access modifiers.
  - Classes, methods, or data members that are declared as public are accessible from everywhere in the program. There is no restriction on the scope of public data members.



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

### Method Overriding & Method Overloading
  - ![](/2023-08-27-java-programming-masterclass-udemy/method-overloading-overriding.png)

#### Method Overriding
  - Override methods super class methods in the subclasses
  - Defining a method in a child class that already exists in the parent class with the same name, same arguments
  - Often referred to as **Runtime Polymorphism** or **Dynamic Method Dispatch**
    - because the method that is going to be called is decided at runtime
  - ex. overriding toString()

##### Rules
  - You can't override static methods, only instance methods
  - method overriding cannot have Lower access modifer
    - ex cannot use protected if the parent method is using public
    - It's a fundamental principle in OOP: the child class is a fully-fledged instance of the parent class, and must therefore present at least the same interface as the parent class. Making protected/public things less visible would violate this idea; you could make child classes unusable as instances of the parent class.
  - Only inherited methods can be overriden

#### Method Overloading
  - Having multiple methods with different method signatures
  - Often referred to as **compile-time polymorphism**
    - this means the compiler is determining the right method  to call, based on the method name and argument list
  - ex. having multiple constructors where 1 has 0 parameters and others have multiple parameters

### Covariant return types
  - When you return a more specified return type in an overriden method, example below
    - ```java
      // Classes used as return types:
      class A {
      }

      class B extends A {
      }

      // "Class B is narrower than class A"
      // Classes demonstrating method overriding:

      class C {
          A getFoo() {
              return new A();
          }
      }

      class D extends C {
          // Overriding getFoo() in parent class C
          B getFoo() {
              return new B();
          }
      }
    ```

### Variable Arguments
  - **Vargs**
  - More flexible than just taking in a single String array
  - Takes 0, 1 or many arguments
  - `String... args`
  - ```java
    public static void printText(String... args){
      for(String el: args){
          System.out.printf("%s ", el);
      }
    }
  ```

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

### Objects vs References vs Instance vs Class
  - Classes are just the blueprints for objects
  - Objects are the memory structures stored on the heap
  - Objects are an instance of a Class
  - References are the variables stored on the stack that point to the object location on the heap
  - Instances are objects that are created from instanciating a class


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