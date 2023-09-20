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
  - [Standard Directory Structure](#standard-directory-structure)
  - [Spring Framework](#spring-framework)
    - [Overview](#overview-1)
  - [Springboot Framework](#springboot-framework)
    - [What is it?](#what-is-it)
    - [Spring and Springboot](#spring-and-springboot)
    - [Spring Initializr](#spring-initializr)
    - [Springboot embedded server](#springboot-embedded-server)
    - [Running a Springboot application](#running-a-springboot-application)
    - [Deploying Springboot applications](#deploying-springboot-applications)
    - [Does Springboot replace Spring MVC, Spring Core, Spring AOP, Spring REST, Spring....](#does-springboot-replace-spring-mvc-spring-core-spring-aop-spring-rest-spring)
    - [Does Springboot run faster than regular Spring code?](#does-springboot-run-faster-than-regular-spring-code)
    - [Spring Projects](#spring-projects)
  - [Maven](#maven)
    - [What is Maven](#what-is-maven)
    - [POM file](#pom-file)
    - [Project Coordinates](#project-coordinates)
    - [mvnw](#mvnw)
    - [Maven Errors](#maven-errors)
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

## Standard Directory Structure
  - ![](/2023-09-18-udemy-spring-boot-course-section-1-quickstart/spring_directory_structure.png)
  - if doing a web app place the webapp files in src>main>webapp
  - ![](/2023-09-18-udemy-spring-boot-course-section-1-quickstart/app_properties.png)
    - By default Spring boot will load properties from: application.properties
    - things like where the port number can be configured

## Spring Framework
  - Lightweight dev with **Java POJOs**
  - **Dependency injection** to promote loose coupling

### Overview
  - ![](/2023-09-18-udemy-spring-boot-course-section-1-quickstart/spring_core_container.png)
  - the core container is the heart of spring
    - it manages how beans are created
    - it has a bean factory for creating beans
    - SpEL - Spring expression language: language in the config files to refer to other beans


## Springboot Framework

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

### Spring Projects
  - Spring projects are additional Spring modules built-on top of the Spring Framework
    - Spring Cloud, Spring Data, Spring Batch, Spring Security .. .
  - [spring projects site](https://spring.io/projects)

## Maven

### What is Maven
  - When building your java project, you may need additional JAR files
    - ex. Spring, Hibernate, Commong Logging
  - One approach is to download the JAR files from each project web site
  - Manually add the JAR  files to your build / classpath
  - **Instead**
  - All you do is have to tell maven what dependencies you will need
    - Maven will go out and download the JAR files for those projects for you

### POM file
  - **Project Object Model File**
  - shopping list for maven
  - ![](/2023-09-18-udemy-spring-boot-course-section-1-quickstart/maven_structure.png)

### Project Coordinates
  - where maven goes to look to download
  - ![](/2023-09-18-udemy-spring-boot-course-section-1-quickstart/project_coordinates.png)
  - referred to as **GAV** (Group ID, Artificat ID, Version)
  - [maven search](https://search.maven.org/)

### mvnw 
  - mvnw allows you to run a Maven project
    - no need to have maven installed
    - if maven installed is not correct version it will automatically update it to the latest version
  - two mvn files for windows or linux/mac
    - mvnw.cmd -- windows
    - mvnw.sh -- linux/mac

### Maven Errors
  - JDK17 does not work with mvn 3.6.0 [error fix](https://medium.com/ci-cd-devops/error-error-executing-maven-error-java-lang-illegalstateexception-unable-to-load-cache-item-39e886a67216)
  - I was getting warning error when attempting to run `mvn package` or `mvn spring-boot:run` saying Java_Home was not set
    - I had placed the following lines in `/etc/environment` as root

```sh
JAVA_HOME="/usr/lib/jvm/jdk-17-oracle-x64"
export JAVA_HOME
```

  - After the modification run `source /etc/environment`

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