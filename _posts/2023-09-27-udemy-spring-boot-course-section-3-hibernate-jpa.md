---
layout: post
title: 'Udemy Spring boot course: Section 3 Hibernate/JPA'
date: 2023-09-27 13:34 -0500
categories: [Udemy, Java, Spring, Hibernate, JPA]
tags: [Java, Programming, Udemy, Spring, Hibernate, JPA] 
image: 
  path: /2023-09-27-udemy-spring-boot-course-section-3-hibernate-jpa/profile.png
---

- [Hibernate](#hibernate)
- [JPA](#jpa)
- [Setting up Docker MySQL](#setting-up-docker-mysql)
  - [Setting up Docker PhpMyAdmin](#setting-up-docker-phpmyadmin)



# Hibernate
What is Hibernate
  - A framework for persisting / saving java objects in a database

Benefits
  - Handles all of the low-level SQL
  - Minimizes the amount of JDBC code you have to develop
  - Hibernate provides the Object-to-Relational Mapping **(ORM)**

ORM
  - ![](/2023-09-27-udemy-spring-boot-course-section-3-hibernate-jpa/profile.png/hibernate.png)
  - Developer defines mapping between java class and database table

# JPA
What is JPA?
  - Jakarta Persistence API (JPA) 
  - Standard API for **ORM**
  - Only a **Specification**

JPA Vendor implementations
  - Hibernate
  - EclipseLink

Benefits of JPA
  - Not locked into a specific vendor
  - portable, flexible code by coding to JPA spec

How is JDBC related to Hibernate and JPA
  - JPA uses JDBC behind the scenes
  - JPA is just another layer of abstraction 

# Setting up Docker MySQL
  - [Docker hub mysql](https://hub.docker.com/_/mysql)
  - Steps
    - Get the docker image
      - `docker pull mysql` 
    - Create the docker instance
      - `docker run --name mysql-db -e MYSQL_ROOT_PASSWORD=root -d mysql:latest` 
    - Connect to instance to test find the ip 
      - `mysql -h 172.17.0.3 -u root -p` 
    
## Setting up Docker PhpMyAdmin
  - [Docker hub PhpMyAdmin](https://hub.docker.com/_/phpmyadmin)
  - Steps
    - get the docker image
      - `docker pull phpmyadmin` 
    - create the docker container
      - `docker run --name phpmyadmin -d --link mysql-db -e MYSQL_ROOT_PASSWORD=root -e PMA_HOST=172.17.0.3 -e PMA_PORT=3306 -p 8080:80 phpmyadmin`
    - Navigate to PhpMyAdmin
      - 0.0.0.0:8080
    - Login
      - username: root
      - password: root