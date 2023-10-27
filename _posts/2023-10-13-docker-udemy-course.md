---
layout: post
title: Docker Udemy Course
date: 2023-10-13 18:16 -0500
categories: [Containers, Docker, Kubernetes]
image: 
  path: /2023-10-13-docker-udemy-course/profile.png
---

# Course curriculium 
  - Getting requirements
  - Docker install
  - Container basics
  - Image basics
  - Docker networking
  - Docker Volumes
  - Docker Compose
  - Orchestration
  - Docker Swarm
  - Kubernetes (K8)
  - Swam vs K8s
  - Student Q&A
  - File Reviews
  - References Galore

# Code for this course
  - [github repo](https://github.com/bretfisher/udemy-docker-mastery)

# Section 1

## Build, Ship, Run
  - ![bsr](/2023-10-13-docker-udemy-course/profile.png/bsr.png)
  - The 3 steps to take non-containerized software and to containerize them

Docker Image (Build)
  - ![layers](/2023-10-13-docker-udemy-course/profile.png/layers.png)
  - A docker file creates a docker image by using layers
  - `docker build`
    - the command to build the image

Docker Registry (Ship)
  - There are multilpe registries
  - how it gets those packages around
  - dockerHub is the most popular
  - just a place that that lets you store your docker image
  - `docker push`
    - Pushes docker image to the registry along with the
  - ![push](/2023-10-13-docker-udemy-course/profile.png/push.png)
    - Uses a hash to make sure the user is downloading the correct docker image from the registry

Docker Run (Run)
  - Another machine can pull down the image from the registry with
  - `docker pull`
  - Then use `docker run`
    - This will create namespace for that container
  - containers cannot see what other containers are doing and their information

## Docker Lab
  - [Play with Docker](https://labs.play-with-docker.com)
  - ![Play with Docker](/2023-10-13-docker-udemy-course/profile.png/play-with-docker.png)
  - His name is Moby Dock!

## Linux concepts that Docker utilizes
  - Namespaces
    - In Linux, namespaces are a feature of the kernel that provides process isolation and resource control. They allow multiple processes to run on the same system as if they had their own isolated view of the system.
  - CGroups
    -  Cgroup (Control Group) namespaces provide an isolated view of the control groups hierarchy. This allows processes to have their own resource limits and resource control settings.
  - VETH
    - In Linux, "veth" stands for "Virtual Ethernet." It is a virtual network interface pair used to connect two network namespaces. These pairs of interfaces are linked, allowing network traffic to pass between them. Veth pairs are frequently used in containerization and network virtualization to create isolated network environments for different processes, containers, or virtual machines.
  - IpTables
    - iptables is a powerful and versatile command-line tool in Linux for managing the network packet filtering rules of the Linux kernel's netfilter framework. It is used to configure, maintain, and inspect packet filtering and network address translation (NAT) rules.
  - Union Mount
    - A union mount is a type of mount in Linux that allows multiple file systems or directories to be combined or "stacked" on top of one another, creating a single virtual file system. Union mounts are particularly useful for overlaying directories, enabling you to present a unified view of multiple directories while preserving the original data.
    - When you drop into a docker container via shell we can see it looks like a linux file system with a lot less in it

## Why docker in todays world
  - 3 main areas
    - isolation
    - environments
    - speed
  
  - containers give you speed
    - develop faster
    - build faster
    - test faster
    - deploy faster

## Section 4

## Sanity test check
  - `docker version`
    - if you want to make sure the client and the docker engine are working
  - `docker info`
    - if you want more detailed information about the client and the docker engine

## Docker cli structure
  - old way (still works) docker COMMAND (options)
  - new way docker COMMAND SUB-COMMAND (options)

## Image vs container
  - an image is the application we want to run
  - a container is an instance of that image running as a **process**

