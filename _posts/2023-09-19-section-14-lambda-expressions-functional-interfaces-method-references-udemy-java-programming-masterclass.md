---
layout: post
title: Section 14. (Lambda expressions, functional interfaces, method references)
  Udemy - Java Programming Masterclass
date: 2023-09-19 15:09 -0500
categories: [Udemy, Java, Spring, Springboot, Hibernate, JDBC]
tags: [Java, Programming, Udemy, Spring] 
image: 
  path: /2023-09-19-section-14-lambda-expressions-functional-interfaces-method-references-udemy-java-programming-masterclass/profile.png
---
- [Git](#git)
- [Lambda Expressions](#lambda-expressions)
  - [Overview](#overview)
    - [Functional interface](#functional-interface)
      - [Consumer functional interface](#consumer-functional-interface)
      - [Predicate functional interface](#predicate-functional-interface)
  - [Syntax](#syntax)
  - [Usuage example](#usuage-example)
  - [Multi line lambda](#multi-line-lambda)
  - [Scope](#scope)


# Git

# Lambda Expressions

## Overview
  - introduced in **JDK 8**
  - thought of as implicit code for an anonymous class, using a special kind of interface
  - The method to be used is **inferred by java**
  - java requires types which support lambda expressions, to be a **functional interface**
  - considered java's first step into **functional programmming**
  - **Streams** make extensive use of lambdas because the form a pipline of work processed in a chain of events

### Functional interface
  - A functional interface is an interface that has one, and **only one abstract method**
  - referred to as **SAM** (Single abstract method)
  -  java provides a library of functional interfaces in **java.util.function.package**. Just over 40 interfaces and counting.
  - ![](/2023-09-19-section-14-lambda-expressions-functional-interfaces-method-references-udemy-java-programming-masterclass/functional_interface_types.png)
    - 4 types of functional interface types

#### Consumer functional interface
  - in the `java.util.function` package
  - One abstract method `void accept(T t);`. it takes in a single argument and doesn't return anything.
  - In the following example the ArrayList has a method with the signagure `public void forEach(Consumer<? super E> action) {..}`

```java
List<String> list = new ArrayList<>(List.of(
        "alpha", "bravo", "charlie", "delta"
));

// traditional way of printing an arraylist
for(var str : list){
    System.out.println(str);
}

// lambda expression print
list.forEach(s -> System.out.println(s));
```

- example 2 

```java
public static void main(){
  var coordinates = Arrays.asList(
          new double[]{47.182, -47.123},
          new double[]{61.222, -77.190},
          new double[]{12.331, -55.399}
  );

  // using a variable for the lambda expression for the consumer method
  BiConsumer<Double, Double> p1 = (lat, lng) -> System.out.printf("[lat:%.3f lon:%.3f]\n", lat, lng);
  coordinates.forEach(coordinate -> processPoint(coordinate[0], coordinate[1], p1));

  // using a lambda expression for the  consumer method to pass to processPoint
  coordinates.forEach(coordinate -> processPoint(coordinate[0], coordinate[1], (x,y) -> System.out.printf("[lat:%.3f lon:%.3f]\n", x, y)));
}

public static <T> void processPoint(T t1, T t2, BiConsumer<T, T> consumer){
    consumer.accept(t1, t2);
}
```

#### Predicate functional interface
  - Takes in 1 argument and returns true or false if a specification is met
  - `boolean test(T t);`
    - This is the abstract method for the predicate functional interface

```java
public static void main(String[] args){
  List<String> mylist = new ArrayList<>(List.of(
          "Tresten", "Josh", "Dave", "Mike", "Roxy", "Tim"
  ));

  fire_person( (str) -> str.equals("Tresten") || str.equals("Josh"), mylist);
  System.out.println(mylist); // Dave, Mike, Roxy, Tim
}
  
public static void fire_person(Predicate<String> fire_person_predicate, List<String> people){
    var iterator = people.iterator();
    while(iterator.hasNext()){
        var person = iterator.next();
        if(fire_person_predicate.test(person)) {
            System.out.println("YOUR FIRED!!! " + person);
            iterator.remove();
        }
    }
}
```

## Syntax
  - ![](/2023-09-19-section-14-lambda-expressions-functional-interfaces-method-references-udemy-java-programming-masterclass/syntax.png)

## Usuage example
  - lambda expression parameters are determined by the associated interface's method
  - The method to be used is **inferred by java**
  - ![](/2023-09-19-section-14-lambda-expressions-functional-interfaces-method-references-udemy-java-programming-masterclass/lambda.png)
  - ![](/2023-09-19-section-14-lambda-expressions-functional-interfaces-method-references-udemy-java-programming-masterclass/example.png)

```java
// our list of people
List<Person> people = new ArrayList<>(Arrays.asList(
        new Main.Person("Mickey", "Mouse"), // just to show you we can use this syntax because the record is a static nested class
        new Person("Donald", "Duck"),
        new Person("Goofy", "Mcman"),
        new Person("Hubert", "Jensen")
));

// sort with a lambda expression which is a comparable statement
people.sort( (o1, o2) -> o1.firstName.compareTo(o2.firstName) );
```

```java
// Comparator interface that extends Comparator
interface EnhancedComparator<T> extends Comparator<T>{
    int secondLevel(T o1, T o2);
}

// concrete class for the above interface
var comparatorMixed = new EnhancedComparator<Person>(){
    @Override
    public int compare(Person o1, Person o2) {
        int result = o1.lastName.compareTo(o2.lastName);
        return (result == 0) ? secondLevel(o1, o2) : result; // if the last names are the same, match by the first name too, the second level
    }

    @Override
    public int secondLevel(Person o1, Person o2) {
        return o1.firstName.compareTo(o2.firstName);
    }
};

// we are unable to use a lambda expression for the intended comparator comparatorMixed because it is not a Functional Interface
// It is not a Functional Interface because it has 2 abstract methods!!
people.sort(comparatorMixed);

System.out.println(people);
```

## Multi line lambda

```java
List<String> list = new ArrayList<>(List.of(
        "alpha", "bravo", "charlie", "delta"
));

// multi-line lambda expression to make all the elements in list uppercase
list.forEach(mystring -> {
    int index = list.indexOf(mystring);
    list.set(index, list.get(index).toUpperCase());
});
```

## Scope
  - A lambda expression has access to **final** variables or **effectively final** of the enclosing method.

```java
// we are able to use this variable because it is EFFECTIVELY FINAL, meaning it hasn't been changed since its declaration
String prefix = "nato";
list.forEach(mystring -> {
    int index = list.indexOf(mystring);
    list.set(index, "%s %s".formatted(prefix, list.get(index).toUpperCase()) );
});
```
  