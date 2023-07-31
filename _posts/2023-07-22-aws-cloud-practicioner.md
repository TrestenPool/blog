---
layout: post
title: AWS cloud practicioner
date: 2023-07-22 09:24 -0500
author: Tresten Pool
categories: [cloud]
tags: [Cloud, Certificates] 
image:
  path: /2023-07-22-aws-cloud-practicioner/profile.jpg
---

# AWS Notes


### AWS Global Infrastructure
- globally distributed hardware and datacenters that are physically networked together to act as one large resource for the end user customer

- Global Infrastructure is comprised of (These numbers are constantly changing)<https://aws.amazon.com/about-aws/global-infrastructure/>
  - 25 Launched regions
  - 81 Availability zones
  - 108 Direct Connection Locations
  - 275+ Points of Precense
  - 11 Local zones
  - 17 Wavelength zones

### AWS Regions
- AWS has the concept of a Region, which is a physical location around the world where we cluster data centers. We call each group of logical data centers an Availability Zone. Each AWS Region consists of a minimum of three, isolated, and physically separate AZs within a geographic area. Unlike other cloud providers, who often define a region as a single data center, the multiple AZ design of every AWS Region offers advantages for customers. Each AZ has independent power, cooling, and physical security and is connected via redundant, ultra-low-latency networks. AWS customers focused on high availability can design their applications to run in multiple AZs to achieve even greater fault-tolerance. AWS infrastructure Regions meet the highest levels of security, compliance, and data protection.

### AWS Availability Zones
- 
- ![az](/2023-07-22-aws-cloud-practicioner/az-diagram.png)
- An Availability Zone (AZ) is one or more discrete data centers with redundant power, networking, and connectivity in an AWS Region. AZs give customers the ability to operate production applications and databases that are more highly available, fault tolerant, and scalable than would be possible from a single data center. All AZs in an AWS Region are interconnected with high-bandwidth, low-latency networking, over fully redundant, dedicated metro fiber providing high-throughput, low-latency networking between AZs. All traffic between AZs is encrypted. The network performance is sufficient to accomplish synchronous replication between AZs. AZs make partitioning applications for high availability easy. If an application is partitioned across AZs, companies are better isolated and protected from issues such as power outages, lightning strikes, tornadoes, earthquakes, and more. AZs are physically separated by a meaningful distance, many kilometers, from any other AZ, although all are within 100 km (60 miles) of each other.



### GovCloud (US)
- FedRAMP
  - Federal Risk and Authorization Management Program 
  - US government that provides a standardized approach to security assessment, authorization, and continus monitoring for cloud products and services.

- What is GovCloud?
  - A cloud service provider (CSP) generally will offer an isolated region to run FedRAMP workloads

- AWS GovCloud Regions
  - Allows customers to host sensitive Controlled unclassified informtation and other types of regulated workloads
  - Govcloud regions are only operated by employees who are u.s citizens and on u.s soil
  - They are only accessible to U.S entities and root account holder who pass a screening process Customers can architect secure cloud solutions that comply with:
    - FedRAMP high baseline
    - DOJ's Criminal Justice information Systems (CJIS) Security Policy
  

### AWS China
- aws cloud offerings for mainland china
- china is completely isolate intentionally from AWS Global to meet regulator compliance for mainland china
- amazonaws.cn
- Not all services are available in china (ex. Route 5)
- Running in mainland china (instead of singapore) means you would not need to traverse the Great Firewall
- There are 2 regions
  - ![regions](/2023-07-22-aws-cloud-practicioner/china-1.png)
  
  1. Ningxia
    - CN-Northwest-1
    - Operated by NSWCF

  2. Beijing
    - CN-North-1
    - Operated by NSWCF


### Sustainablilty
- Amazon co-founded the Climate Pledge to achieve Net-Zero Carbon Emissions by 2040 across all amazon businesses 
- <https://sustainability.aboutamazon.com/products-services/the-cloud?energyType=true>

1. Renewable Energe
  - working towards having their AWS Global infrastructure powered by 100% renewable energy by 2025

2. Cloud Efficiency
  - aws infrastructure is 3.6 times more energy efficient than the median of U.S. enterprise data centers surveyed

3. Water Stewardship
  - technology to cool the datacenters use of recycled water for cooling purposes

### AWS Ground Station
- ![ground station](/2023-07-22-aws-cloud-practicioner/satellite.png)
- fully managed service that lets you control satellite communications, process data, and scale your operations without having to worry about building or managing your own ground station infrastructure

- used for 
  - Weather forecasting
  - surface imaging
  - communications, video broadcasts

- to use ground station:
  - schedule a contact (select satellite, start and end time, and the ground location)
  - use ec2 instances that will uplink and downlink data during the contact or receive downlinked data in the aws s3 bucket

### AWS Outposts
- fully managed service that offers the same AWS infrastructure, aws service, api's, and tools to virtually any datacenter, co-location space, or non-premises facility for a truly consistent hybrid experience

- AWS Outposts is a rack of servers running AWS infrastructure on your phyiscal location

- comes with the rack server and server

- AWS Outposts comes in 3 form factors
  - 42U
  - 1U
  - 2U  

### Cloud Architecture Teminologies
- Solutions Architect
  - tech role that architects a solution using multiple systems via researching, documentation, experimentation

- Cloud Architect
  - focused solely on the cloud solutuion

- Availability
  - your ability to ensure a service remains available (High Availability HA)

- Scalablility
  - your ability to grow rapidly or unimpeded

- Elasticity
  - Your ability to shrink and grow to meet the demand

- Fault tolerance
  - your ability to prevent a failure

- Disaster recovery
  - your ability to recover from a failure (Highly Durable DR)

- Business factors you should always keep in mind
  - Security - How secure is this solution?
  - Cost - How much is this going to cost

### High Availability
- your ability for your service to remain available by ensuring there is no **single point of failure** and/or ensure level of performance

- Run your workload across multilple **Availability zones** ensures if 1 or 2 AZ's become unavailable your service/applications remains available

- Elastic Load Balancer
  - A load balancer allows you to evenly distribute traffic to multiple servers in one or more datacenters. If a datacernter or server becomes unavailable, the load balancer will route the traffic to the other working datacenter and servers

### High Scalability
- your ability to **increase your capacity** based on the increasing/decreasing demand in traffic, memory and computing power

- 2 types of scaling
  1. Vertical Scaling
    - Upgrade to a bigger server, ex. better cpu, more ram
  2. Horizontal Scaling
    - Adding more servers of the same size, compute devices to distribute the load to 
    - Typically preferred because helps with **HA**

### High Elasticity
- your ability to **automatically** increase/decrease your capacity based on the current demand of traffic, memory and computing power

- Horizontal scaling
  - Scaling out
    - add more servers of the same size
  - Scaling in
    - removing underutilized server of the same size

- Typically done with Horizontal scaling because vertical scaling is generally hard for traditional architecture so you'll usually only see horizontal scaling described with elasticity

- Auto Scaling Groups (ASG)
- ![aws auto scaling](/2023-07-22-aws-cloud-practicioner/auto-scaling.png)
  - an AWS feature that will automatically add or remove servers based on scaling rules you define based on metrics
  
