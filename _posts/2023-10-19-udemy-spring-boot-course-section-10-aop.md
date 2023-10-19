---
layout: post
title: 'Udemy Spring boot course: Section 10 AOP'
date: 2023-10-19 10:39 -0500
categories: [Springboot, Spring]
image: 
  path: /2023-10-19-udemy-spring-boot-course-section-10-aop/profile.png
---

- [Git Repo for this sesion](#git-repo-for-this-sesion)
- [Resources](#resources)
- [Brief intro example](#brief-intro-example)
- [Aspect oriented programming](#aspect-oriented-programming)
  - [Weaving](#weaving)


# Git Repo for this sesion
  - put here

# Resources
  - {% include embed/youtube.html id='Ft29HgsePfQ' %}
  - [baelung docs on aop](https://www.baeldung.com/spring-aop-vs-aspectj)

# Brief intro example 
  - we have the following architecture
    - ![alt-text](/2023-10-19-udemy-spring-boot-course-section-10-aop/app_arch.png)
  - we have the following code for our dao
```java
public void addAccount(Account account, String userId) {
  entityManager.persist(account);
}
```
  - lets say manager asks us to implement logging with the following requirements
    - modular - can be used for other methods
    - happens before and/or after the method we call
  -lets say manager asks us to do the same thing but to implement security

We could do the following but we would have to reuse the code in other places, just copying and pasting (NOT GOOD PRACTICE)
```java
public void addAccount(Account account, String userId) {
  // logging +4 lines
  // security +5 lines
  entityManager.persist(account);
}
```

This introduces Two big Problems
  - **Code Tangling**
    - logging and security code tangled together along with business logic
  - **Code Scattering**
    - If we need to update the logging or security codes, we have to do so in numerous places


Other Quick Possible solutions that could work
  - **Inheritence**
    - create a abstract class of Logging & Security and just have the classes inherit from it
    - This could work but but every class would need to inherit from these classes
    - Plus java doesn't support multile inheritence so it could inherit from Logging or Security but **not both**
  
  - **Delegation**
    - classes delegate logging and security calls
    - we would still need to uppdate all those classes that want to implement logging/security and put the call to those methods in there
  
Next section below talks about the BEST SOLUTION (AOP)

# Aspect oriented programming
  - Programming paradigm based on this concept of a **Aspect**
  - AOP is an extension of OOP
  - **Aspect**
    - encapsulates **cross-cutting concerns**
    - Where cross-cutting concerns are just logic like security, logic that is the same for multiple methods
  - ![alt-text](/2023-10-19-udemy-spring-boot-course-section-10-aop/cross-cutting.png)

AOP Terminology

| Term      | Description                                                                                                                                                                                                                                        |
| :-------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Aspect    | a standard code/feature that is scattered across multiple places in the application and is typically different than the actual Business Logic (for example, Transaction management). Each aspect focuses on a specific cross-cutting functionality |
| Advice    | the action taken by the aspect in a specific joinpoint                                                                                                                                                                                             |
| Joinpoint | it’s a particular point during execution of programs like method execution, constructor call, or field assignment                                                                                                                                  |
| Pointcut  | a regular expression that matches a joinpoint. Each time any join point matches a pointcut, a specified advice associated with that pointcut is executed                                                                                           |
| Weaving   | the process of linking aspects with targeted objects to create an advised object                                                                                                                                                                   |

Advice Types

| Advice          | Description                                                                               |
| :-------------- | :---------------------------------------------------------------------------------------- |
| Before          | Run advice before the method execution.                                                   |
| After           | Run advice after the method execution, regardless of its outcome.                         |
| After-returning | Run advice after the method execution, only if the method completes successfully.         |
| After-throwing  | Run advice after the method execution, only if the method exits by throwing an exception. |
| Around          | Run advice before and after the advised method is invoked.                                |

Pros / Cons

| Pros                                     | Cons                                                               |
| :--------------------------------------- | :----------------------------------------------------------------- |
| Reusable modules                         | Too many Aspects                                                   |
| Resolve code tangling                    | App flow can be hard to follow                                     |
| Resolve code scatter                     | Minor performance cost for aspect execution  (**runtime weaving**) |
| Apply selectively based on configuration |                                                                    |


## Weaving
  - Two leading AOP frameworks for Java
    - Spring AOP
    - AspectJ

Spring AOP
  - support out of the box
  - run-time weaving utilizing proxy-based

Proxy-based
  - ![alt-text](/2023-10-19-udemy-spring-boot-course-section-10-aop/proxy.png)

Runtime weaving
  - Runtime weaving, in the context of Aspect-Oriented Programming (AOP), refers to the process of applying aspects (cross-cutting concerns) to a running program or application. 

AspectJ
  - Original AOP framework
  - provides **complete support** for AOP
  - released in 2001

Runtime weaving vs Compile-time weaving
  - Runtime weaving involves integrating aspect code with the running application at runtime, typically during the execution of the program.
  - This is in contrast to compile-time weaving, where aspect code is integrated with the application during the compilation phase.
  - Runtime weaving allows you to add, modify, or remove aspects without recompiling the entire application, making it more flexible and adaptable.

Spring AOP pros/cons

| Pros                                                 | Cons                                                                  |
| :--------------------------------------------------- | :-------------------------------------------------------------------- |
| Simplier to use than AspectJ                         | only supports **method level** join points                            |
| Uses Proxy pattern                                   | Can **only** apply aspects to beans created by **Spring app context** |
| Can migrate to AspectJ when using @Aspect annotation | Minor performance costs for using **run-time weaving**                |


AspectJ pros/cons

| Pros                                                 | Cons                                                     |
| :--------------------------------------------------- | :------------------------------------------------------- |
| Support **all** Join points                          | Compile-time weaving required **extra compilation step** |
| works with any POJO, not just beans from app context | AspectJ **pointcut** **syntax** can become **complex**   |
| **Faster** performance compared to Spring AOP        |                                                          |
| **Complete** AOP support                             |                                                          |

