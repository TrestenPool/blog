---
layout: post
title: Migration Yelp-Camp WebApp from Heroku to AWS Elastic Beanstalk and MongoDB
  Atlas to AWS DocumentDB
date: 2023-08-24 13:43 -0500
author: Tresten Pool
categories: [migration]
tags: [AWS, MongoDB, DocumentDB] 
image:
  path: /2023-08-24-migration-yelp-camp-webapp-from-heroku-to-aws-elastic-beanstalk-and-mongodb-atlas-to-aws-documentdb/profile.jpeg
---


# Table of contents
- [Table of contents](#table-of-contents)
- [Goal](#goal)
- [Database Migration](#database-migration)
  - [Steps](#steps)
- [References](#references)

# Goal
  - migrate a web app that was built as the main project for a web developer bootcamp udemy class to AWS.
  - The app was built with ExpressJS as the backend and bootstrap for the frontend
  - We want to migrate the following
    - Mongodb to AWS DocumentDB
    - Heroku to Elastic Beanstalk for the hosting of the webapp

# Database Migration

## Steps
  - ![db migration steps](/2023-08-24-migration-yelp-camp-webapp-from-heroku-to-aws-elastic-beanstalk-and-mongodb-atlas-to-aws-documentdb/db-migration-steps.png)
  - We are choosing to do this database migration offline instead of online because it is cheaper and because our site isn't that important.
  - Otherwise if we wanted as little downtime as possible we would choose a method where we can copy the database in place while it is running still
  
# References
  - {% include embed/youtube.html id='Png6NIV73qc' %}