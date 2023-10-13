---
layout: post
title: 'Udemy Spring boot course: Section 9 JPA / Hibernate advanced mappings'
date: 2023-10-13 11:09 -0500
categories: [Udemy, Java, Springboot, JPA, Hibernate]
tags: [Java, Programming, Udemy, Spring] 
image: 
  path: /2023-10-13-udemy-spring-boot-course-section-9-jpa-hibernate-advanced-mappings/profile.png
---
- [Entity Lifecycle](#entity-lifecycle)
- [Important Database concepts](#important-database-concepts)
  - [Primary Key , Foreign Key](#primary-key--foreign-key)
  - [Cascade](#cascade)
  - [Eager , Lazy Loading](#eager--lazy-loading)
  - [Uni-Directional , Bi-Directional](#uni-directional--bi-directional)
- [Association Mappings](#association-mappings)
  - [One-to-One](#one-to-one)
  - [One-to-Many](#one-to-many)
  - [Many-to-Many](#many-to-many)
- [Examples](#examples)


# Entity Lifecycle
  - [hibernate entity life cycle](https://www.baeldung.com/hibernate-entity-lifecycle)
  - Every Hibernate entity naturally has a lifecycle within the framework – it’s either in a transient, managed, detached or deleted state.

| Operations        | Description                                                                                                                                                                           |
| :---------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| New / Transient   | An entity instance that has been created but is not yet managed by the persistence context. It is not associated with a database record.                                              |
| Detach            | An entity instance that was once managed but is no longer associated with the persistence context. Changes to a detached entity are not automatically synchronized with the database. |
| Merge             | will reattach to hibernate session                                                                                                                                                    |
| Persist / managed | An entity instance that is actively managed by the persistence context and is associated with a database record. Changes to a managed entity will be synchronized with the database.  |
| Removed           | An entity instance marked for deletion.                                                                                                                                               |
| Refresh           | Reload / sync object with data from db. Prevents stale data                                                                                                                           |

  - ![alt-text](/2023-10-13-udemy-spring-boot-course-section-9-jpa-hibernate-advanced-mappings/entity_lifecycle.png)

# Important Database concepts

## Primary Key , Foreign Key
  - Primary Key
    - Unique identifer for a row in a table
  - Foreign Key
    - Field in one table that refers to the primary key in another table
  
  - Referential Integerity
    - preserves relationship between tables
    - prevents operations that would destroy relationships
    - can only contain valid reference to primary key in another table
  
Example below shows how to create a foreign key in MySQL
```sql
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    quantity INT,
    product_id INT,
    FOREIGN KEY (product_id) REFERENCES products(id)
);
```

## Cascade
  - Cascade
    - You can apply the same operation to related entities
  - ![alt-text](/2023-10-13-udemy-spring-boot-course-section-9-jpa-hibernate-advanced-mappings/cascade.png)
    - if we save the instructor, if were to cascade we would also save the instructor detail
    - by the same token if we were to delete an instructor we would delete the instructor detail if it is one-to-one
  - by default no operations are cascaded

| Cascade Type | Description                                                                              |
| :----------- | :--------------------------------------------------------------------------------------- |
| Persist      | if entity is persisted / related entity will also be persisted                           |
| Remove       | if entity is removed / related entity will also be removed                               |
| Refresh      | if entity is refreshed / related entity will also be refreshed                           |
| Detach       | if entity is detached (not associated w/ session) / related entity will also be detached |
| Merge        | if entity is merged / related entity will also be merged                                 |
| All          | All the above cascade types                                                              |


## Eager , Lazy Loading
  - When fetch data, should we retrieve all of the results or just a subset of the results
  - **Eager**
    - Retrieve **all** of the results
  - **Lazy**
    - Retrieve a **subset** of the results
    - or Retrieve on **Request**

## Uni-Directional , Bi-Directional
  Uni-Directional
  - ![alt-text](/2023-10-13-udemy-spring-boot-course-section-9-jpa-hibernate-advanced-mappings/uni-directional.png)
    - We retrieve the instructor detail only through the instructor
    - we can't retrieve the instructor through the instructor detail
  
  Bi-Directional
  - ![alt-text](/2023-10-13-udemy-spring-boot-course-section-9-jpa-hibernate-advanced-mappings/bi-directional.png)
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
  - ![alt-text](/2023-10-13-udemy-spring-boot-course-section-9-jpa-hibernate-advanced-mappings/one-to-one.png)

## One-to-Many
  - ![alt-text](/2023-10-13-udemy-spring-boot-course-section-9-jpa-hibernate-advanced-mappings/one-to-many.png)

## Many-to-Many
  - ![alt-text](/2023-10-13-udemy-spring-boot-course-section-9-jpa-hibernate-advanced-mappings/many-to-many.png)

# Examples
  - ![alt-text](/2023-10-13-udemy-spring-boot-course-section-9-jpa-hibernate-advanced-mappings/goal.png)
  
