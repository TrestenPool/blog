---
layout: post
title: 'Udemy Spring boot course: Section 2 Spring Core'
date: 2023-09-21 15:41 -0500
categories: [Udemy, Java, Spring, Core]
tags: [Java, Programming, Udemy, Spring] 
image: 
  path: /2023-09-21-udemy-spring-boot-course-section-2-spring-core/profile.png
---

- [Inversion of Control (IoC)](#inversion-of-control-ioc)
- [Dependency Injection](#dependency-injection)
  - [Types of Injection](#types-of-injection)
    - [Constructor Injection](#constructor-injection)
    - [Setter Injection](#setter-injection)
      - [Setter injection example](#setter-injection-example)
  - [Spring Autowiring](#spring-autowiring)
    - [Types of Autowiring](#types-of-autowiring)
- [Spring Container](#spring-container)
  - [Configuration of the spring container](#configuration-of-the-spring-container)
- [Component Scanning](#component-scanning)



# Inversion of Control (IoC)
  - the approach of outsourcing the construction and management of objects

Coding Scenario
  - ![](/2023-09-21-udemy-spring-boot-course-section-2-spring-core/coding_scenario.png)

Spring Solution
  - The app requests a coach object from spring
  - Spring will then use the **Object Factory** to return the reference to the correct object
  - Spring determines which object you need based on the **configuration** you set
  - ![](/2023-09-21-udemy-spring-boot-course-section-2-spring-core/spring_solution.png)

# Dependency Injection
  - Dependency  Inversion Principle - client delegates to another object the responsiblity of providing its dependencies

Car Factory Example
  - user says give me a car object
    - car factory assemblies the car and all its parts and components
    - once the car factory is finished it will return the user the car object
  - ![](/2023-09-21-udemy-spring-boot-course-section-2-spring-core/car_di_example.png)

Team example
  - The application requests a coach object
  - Spring object factory assemblies the correct object based on the configuration and returns the reference to the user 
  - ![](/2023-09-21-udemy-spring-boot-course-section-2-spring-core/di_example.png)

## Types of Injection
  - There are two types of injection
    - Constructor injection
    - Setter injection

### Constructor Injection
  - use this when you have **required dependencies**
  - recommended as first choice

### Setter Injection
  - use this when you have **optional dependencies**
  - if dependency is not provided, your app can provide reasonable default logic

#### Setter injection example
  - ![](/2023-09-21-udemy-spring-boot-course-section-2-spring-core/example.png)
    - In this example we want the spring container to autowire a coach bean to our DemoController class

```java
public interface Coach{
  String getDailyWorkout();
}
```
{: file='Coach.java'}

```java
@Component
public class CricketCoach implements Coach{
  @Override
  public String getDailyWorkout() {
    return "Practice fast bowling for 15 minutes;
  }
}
```
{: file='CricketCoach.java'}


```java
@RestController
public class DemoController {
  private Coach mycoach;

  @Autowired
  public DemoController(Coach thecoach){
    this.mycoach = thecoach;
  }

  @GetMapping("/getworkout")
  public String getDailyWorkout(){
    return mycoach.getDailyWorkout();
  }
}
```
{: file='DemoController.java'}

  - **@Component** annotation marks the class as a **Spring Bean**
    - A spring bean is just a regular Java class that is **managed by Spring**
    - It also makes the class available for **Dependency Injection**
  
  - **@RestController** annoation tells spring this is a class that lists rest routes
  - **@AutoWired** annoation tells spring to infer the type and spring bean to be injected into the constructor when calling this restcontroller at creation
    - if you only have 1 constructor then @Autowired on constructor is optional

## Spring Autowiring
  - simplifies the process of injecting dependencies into Spring beans (components or objects).
  - Dependency injection is a fundamental concept in Spring, and autowiring is one way to achieve it.
  - **Autowiring allows you to automatically inject the required dependencies into a Spring bean without explicitly specifying them in the configuration.**
  - Spring can automatically identify and inject the appropriate dependencies based on certain rules and annotations. 

### Types of Autowiring

| Type                                              |                                                                     Description                                                                      |
| :------------------------------------------------ | :--------------------------------------------------------------------------------------------------------------------------------------------------: |
| No Autowiring (Default)                           |    must explicitly specify the dependencies using <property> elements in XML configuration or @Autowired annotations in Java-based configuration.    |
| Autowire by Type (autowire="byType")              |    Spring automatically wires dependencies by matching their types. If there are multiple beans of the same type, Spring will raise an exception     |
| Autowire by Name (autowire="byName")              |                                              Spring automatically wires dependencies by matching their                                               |
| Autowire by Constructor (autowire="constructor"): |                                  Spring automatically wires dependencies by examining the constructor of the bean.                                   |
| Autowire by Qualifier (@Qualifier annotation):    | When you have multiple beans of the same type, you can use the @Qualifier annotation along with @Autowired to specify which bean should be injected. |







# Spring Container
Primary Functions
  - Create and manage objects (Inversion of control)
  - Injeft object dependencies (Dependency Injection)

## Configuration of the spring container

| Configuration Type | Relevance |
| :----------------- | :-------: |
| XML Configuration  |  Legacy   |
| Java Annotations   |  Modern   |
| Java Source Code   |  Modern   |

# Component Scanning
  - Spring will scan your java classes for special annotations
  - @Component, etc..
    - This automatially registers the beans in the Spring Container