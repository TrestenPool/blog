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

1. Renewable Energe
  - working towards having their AWS Global infrastructure powered by 100% renewable energy by 2025

2. Cloud Efficiency
  - aws infrastructure is 3.6 times more energy efficient than the median of U.S. enterprise data centers surveyed

3. Water Stewardship
  - technology to cool the datacenters use of recycled water for cooling purposes

4. 
