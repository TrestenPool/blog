---
layout: post
title: Angular Section 1,2. The Basics
date: 2023-10-26 08:35 -0500
categories: [Angular, Udemy]
image: 
  path: /2023-10-26-angular-section-1-2-the-basics/profile.png 
---

# What is Angular
  - Angular is a js framework for (SPA's) **Single page applications**

## What is a SPA
  - Single page application
  - Single html file is loaded at the start, but as you navigate around the site it is still the same html file, It is only rendering different views on the page with javascript loading it in the background

Why is this good?
  - good for performance
  - the client no longer has to go out and talk to the server with every request like it used to. Instead it only reaches out to the server in the background when it needs some additional info from the server making it very responsive

# Angular Versions Explained
  - ![alt-text](/2023-10-26-angular-section-1-2-the-basics/angular_versions.png)
  - started with AngularJS (Angular 1)
    - totally different than what angular is today
    - not future proof because of fundamental structure
    - Called "Angular JS"

  - Angular 2 was a complely re-write
    - released in 2016
    - Called just "Angular"
  - Angular 4 
    - Angular 3 was not released for internal things
  - Angular 10, 11, 12, ...
    - new major version is released every 6 months
    - small, incremental, backwards-compatiable changes

# Angular Pre-requisites & Install
  - Node is required 
  - I am using nvm for my node version management
  - `nvm use 16.14`
  - `npm install -g @angular/cli`
  
# Angular CLI
  - [github-repo](https://github.com/angular/angular-cli)
  - [angular docs workflow](https://angular.io/cli)

## Create new project
  - `ng new <project-name> --no-strict`
    - `--no-strict` 
      - Strict mode improves maintainability, helps you catch bugs ahead of time, and turns runtime errors into compile-time errors.
    - common convention to use lowercase letters for the project name
    - then it will ask you the following
      - add angular routing?
      - which stylesheet format you would like to use

  You will then see the following of angular bootstrapping your application
  - ![alt-text](/2023-10-26-angular-section-1-2-the-basics/terminal_creating_project.png)

## Run your application
  - `ng serve`
  - it will run on port 4200 by default

You will see this if you navigate to localhost:4200
  - ![alt-text](/2023-10-26-angular-section-1-2-the-basics/default_page.png)
  



