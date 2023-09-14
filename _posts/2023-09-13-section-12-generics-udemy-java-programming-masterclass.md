---
layout: post
title: Section 12. (Generics) Udemy - Java Programming Masterclass
date: 2023-09-13 13:58 -0500
author: Tresten Pool
categories: [Udemy, Java]
tags: [Java, Programming, Udemy] 
image: 
  path: /2023-09-13-section-12-generics-udemy-java-programming-masterclass/profile.png
---

- [Git](#git)
- [Overview](#overview)
  - [Example](#example)
- [Generic naming convention](#generic-naming-convention)
- [Raw usage of generic classes](#raw-usage-of-generic-classes)


# Git
  - [Github link to Section 12 example code Sports teams examples](https://github.com/TrestenPool/Java-Programming-MasterClass/tree/main/section12/Generics/src)
  - [Github link to Section 12 Challenge map ](https://github.com/TrestenPool/Java-Programming-MasterClass/tree/main/section12/Generics/src)
    - ![](/2023-09-13-section-12-generics-udemy-java-programming-masterclass/challenge_class_diagram.png)

# Overview
  - java supports generic types, such as
    - classes
    - records
    - interfaces
    - methods
  
  - ![](/2023-09-13-section-12-generics-udemy-java-programming-masterclass/anatomy.png)
  - generics allow the compiler to do **compile-time type checking**, when adding and processing elements in the list


## Example
  - ```java
    // not using generics
    public class ITellYou {
      private String field;
    }

    // using generics
    public class ITellYou<T> {
        private T field;
    }
  ```
  - T is the placeholder for a type that will be specified later
  - T is the **type identifier**
  - The type idenfiter can be **any letter** or word but **T** is short for Type which is why it is commonly used


## More than 1 Generic Type
  - You can have more than 1 type parameter
  - convention is T, S, U in that order

  - ```java
    public class Team<T, S, U, V> {
      private T variable1;
      private S variable2;
      private U variable3;
      private V variable4;
    }
  ```

# Generic naming convention
  - some letters are **reserved** for special use cases
  - the most commonly used type parameters are
    - **E** - element (used extensively by the Java Collections framework)
    - **K** - key (used for mapped types)
    - **N** - for Number
    - **T** - for Type
    - **V** - for Value
    - **S, U, V** etc for 2nd, 3rd, 4th types

# Raw usage of generic classes
  - you can use generic classes without specifying a type in the type parameters
  - this is called the **Raw Use** of the reference type
  - raw use is still available for backwards compability, but is highly discouraged
  - ```java
    public class MyArray <T> {
      T myvar;
    }

    public static void Main(String.. args){
      // raw type
      MyArray rawtype = new MyArray();

      // generic type (preferred)
      MyArray<Integer> myintarray = new MyArray<>();
    }
  ```

# Bounded Generic classes
  - Generic classes can be bounded, limiting the types that can use it
  - ```java
    public class Team <T extends Player> 
  ```
  - this **extends** keyword **doesn't have the same meaning** as extends, when its used in a class declaration
    - This isn't saying that our type T extends Player although it could
    - All this is saying is that the paramaterized type T, has to be a Player, or a **subtype of Player**
    - A subclass that has extended or implements Player would work just fine
  - this is saying that a type that extends the Player class can be passed as a type to this class during instanciation
  - the example is called an **upper bound**