---
layout: post
title: 'Udemy Spring boot course: Section 9 JPA / Hibernate advanced mappings'
date: 2023-10-13 11:09 -0500
categories: [Udemy, Java, Springboot, JPA, Hibernate]
tags: [Java, Programming, Udemy, Spring] 
image: 
  path: /2023-10-13-udemy-spring-boot-course-section-9-jpa-hibernate-advanced-mappings/profile.png
---
- [Important Database concepts](#important-database-concepts)
  - [Primary Key , Foreign Key](#primary-key--foreign-key)
  - [Cascade](#cascade)
  - [Eager , Lazy Loading](#eager--lazy-loading)
  - [Uni-Directional , Bi-Directional](#uni-directional--bi-directional)
- [Association Mappings](#association-mappings)
  - [One-to-One](#one-to-one)
  - [One-to-Many](#one-to-many)
  - [Many-to-Many](#many-to-many)



# Important Database concepts

## Primary Key , Foreign Key
  - Primary Key
    - Unique identifer for a row in a table
  - Foreign Key
    - Field in one table that refers to the primary key in another table

## Cascade
  - Cascade
    - You can apply the same operation to related entities
  - ![](/2023-10-13-udemy-spring-boot-course-section-9-jpa-hibernate-advanced-mappings/cascade.png)
    - if we save the instructor, if were to cascade we would also save the instructor detail
    - by the same token if we were to delete an instructor we would delete the instructor detail if it is one-to-one

## Eager , Lazy Loading
  - When fetch data, should we retrieve all of the results or just a subset of the results
  - **Eager**
    - Retrieve **all** of the results
  - **Lazy**
    - Retrieve a **subset** of the results
    - or Retrieve on **Request**

## Uni-Directional , Bi-Directional
  Uni-Directional
  - ![](/2023-10-13-udemy-spring-boot-course-section-9-jpa-hibernate-advanced-mappings/uni-directional.png)
    - We retrieve the instructor detail only through the instructor
    - we can't retrieve the instructor through the instructor detail
  
  Bi-Directional
  - ![](/2023-10-13-udemy-spring-boot-course-section-9-jpa-hibernate-advanced-mappings/bi-directional.png)
  - we can get the instructor detail through the instructor
  - we can get the instructor through the instructor detail


  


# Association Mappings
  - In the database we will have multiple tables and relationships between tables
    - We will need these advanced mappings to describe this in hibernate
  
| Annotation                |
| :------------------------ |
| One-to-One                |
| One-to-Many , Many-to-One |
| Many-to-Many              |


## One-to-One
  - ![](/2023-10-13-udemy-spring-boot-course-section-9-jpa-hibernate-advanced-mappings/one-to-one.png)

## One-to-Many
  - ![](/2023-10-13-udemy-spring-boot-course-section-9-jpa-hibernate-advanced-mappings/one-to-many.png)

## Many-to-Many
  - ![](/2023-10-13-udemy-spring-boot-course-section-9-jpa-hibernate-advanced-mappings/many-to-many.png)



