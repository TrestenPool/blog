---
layout: post
title: 'Udemy Spring boot course: Section 1 QuickStart'
date: 2023-09-18 18:44 -0500
categories: [Udemy, Java, Spring, Springboot, Hibernate, JDBC]
tags: [Java, Programming, Udemy, Spring] 
image: 
  path: /2023-09-18-udemy-spring-boot-course-section-1-quickstart/profile.png
---

- [Overview](#overview)
  - [Github repo](#github-repo)
  - [Spring boot version](#spring-boot-version)
  - [Spring Framework](#spring-framework)
    - [What is it?](#what-is-it)
    - [Spring and Springboot](#spring-and-springboot)
    - [Spring Initializr](#spring-initializr)
    - [Springboot embedded server](#springboot-embedded-server)
    - [Running a Springboot application](#running-a-springboot-application)
    - [Deploying Springboot applications](#deploying-springboot-applications)
    - [Does Springboot replace Spring MVC, Spring Core, Spring AOP, Spring REST, Spring....](#does-springboot-replace-spring-mvc-spring-core-spring-aop-spring-rest-spring)
    - [Does Springboot run faster than regular Spring code?](#does-springboot-run-faster-than-regular-spring-code)
  - [Maven](#maven)
    - [What is Maven](#what-is-maven)
  - [Creating a demo springboot application](#creating-a-demo-springboot-application)
    - [Steps](#steps)
      - [Spring initializer](#spring-initializer)
      - [Run the app](#run-the-app)
      - [Setup / mapping](#setup--mapping)



# Overview

## Github repo
  - [course github repo](https://github.com/darbyluv2code/spring-boot-3-spring-6-hibernate-for-beginners)

## Spring boot version
  - Using Spring boot 3
  - requires JDK 17 or higher

## Spring Framework

### What is it?
  - popular framework for building java applications
  - provides a large number of helper classes and annnotations
  - Normal Spring applications take a lot of effort just to get setup
  - Springboot is the solution to that making it easier and faster to get started with Spring development
  - minimizes the amount of manual configuration
  - performs auto-configuration based on props files and JAR classpath
  - provides an embedded HTTP server so you can get started quickly
    - Tomcat, jetty, undertow

### Spring and Springboot
  - Springboot uses spring behind the scenes
  - Springboot simply makes it easier to use Spring
  
### Spring Initializr
  - [start.spring.io](https://start.spring.io/)
  - Site to quickly create a starter spring boot project
  - select your dependencies 
  - then creates a Maven / Gradle project
  - then import the project into your ide

### Springboot embedded server
  - ![](/2023-09-18-udemy-spring-boot-course-section-1-quickstart/embedded_server.png)
  - springboot provides an embedded HTTP server so you can get started quickly
    - Tomcat, Jetty, Undertow
  - self contained unit in the .jar file. nothing else you have to install!!

### Running a Springboot application
  - Since everything is self contained in the .jar file
  - We can run the springboot application with `java -jar mycoolapp.jar`
    - runs the app and spins up the server!

### Deploying Springboot applications
  - ![](/2023-09-18-udemy-spring-boot-course-section-1-quickstart/war_deploy.png)
  - Springboot apps can also be deployed in the traditional way with **WAR** files
  - Deploy WAR file to an external server: Tomcat, JBoss, WebSpher

### Does Springboot replace Spring MVC, Spring Core, Spring AOP, Spring REST, Spring....
  - ![](/2023-09-18-udemy-spring-boot-course-section-1-quickstart/spring.png)
  - No Springboot **does not replace** but rather uses them behind the scenes abstracting the manual config away from the user

### Does Springboot run faster than regular Spring code?
  - No, it uses the same code of the Spring framework

## Maven

### What is Maven
  - When building your java project, you may need additional JAR files
    - ex. Spring, Hibernate, Commong Logging
  - One approach is to download the JAR files from each project web site
  - Manually add the JAR  files to your build / classpath
  - **Instead**
  - All you do is have to tell maven what dependencies you will need
    - Maven will go out and download the JAR files for those projects for you


## Creating a demo springboot application

### Steps

#### Spring initializer
  - go to the spring initializer site
    - [spring initializer](https://start.spring.io/)
  - ![](/2023-09-18-udemy-spring-boot-course-section-1-quickstart/spring_init.png)
    - enter out the project information
    - add the dependencies on the right, (selected spring web for this demo)
  - hit generate, download the file,  unzip to a directory and open up in ide

#### Run the app
  - Go to the main method and hit the run button
  - next you will see the following code in the terminal output

```
2023-09-19T16:21:21.693-05:00  INFO 741662 --- [           main] o.apache.catalina.core.StandardService   : Starting service [Tomcat]
2023-09-19T16:21:21.693-05:00  INFO 741662 --- [           main] o.apache.catalina.core.StandardEngine    : Starting Servlet engine: [Apache Tomcat/10.1.12]
2023-09-19T16:21:21.792-05:00  INFO 741662 --- [           main] o.a.c.c.C.[Tomcat].[localhost].[/]       : Initializing Spring embedded WebApplicationContext
2023-09-19T16:21:21.793-05:00  INFO 741662 --- [           main] w.s.c.ServletWebServerApplicationContext : Root WebApplicationContext: initialization completed in 1020 ms
2023-09-19T16:21:22.146-05:00  INFO 741662 --- [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat started on port(s): 8080 (http) with context path ''
2023-09-19T16:21:22.155-05:00  INFO 741662 --- [           main] c.s.d.HelloWorld.HelloWorldApplication   : Started HelloWorldApplication in 1.908 seconds (process running for 2.26)
```

  - However when we attempt to go to the site at localhost:8080 we get this error because we have no routes setup
  - ![](/2023-09-18-udemy-spring-boot-course-section-1-quickstart/error.png)

#### Setup / mapping 
  - We will setup a mapping for the "/" endpoint

```java
package com.springboot.demo.HelloWorld.rest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FunRestController {
    // expose "/" that return "Hello world"
    @GetMapping("/")
    public String sayHello(){
        return "Hello world";
    }
}
```
  - ![](/2023-09-18-udemy-spring-boot-course-section-1-quickstart/helloworld.png)
    - now when we navigate to localhost:8080 we get this message