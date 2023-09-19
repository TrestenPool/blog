---
layout: post
title: 'Udemy Spring boot course: Section 1 QuickStart'
date: 2023-09-18 18:44 -0500
categories: [Udemy, Java, Spring, Springboot, Hibernate, JDBC]
tags: [Java, Programming, Udemy, Spring] 
image: 
  path: /2023-09-18-udemy-spring-boot-course-section-1-quickstart/profile.png
---

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


