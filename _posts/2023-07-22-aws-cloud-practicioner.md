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

### AWS resources
- AWS Labs
  - Get hands on learning with aws resources for free
  - [aws labs](https://aws.amazon.com/training/digital/aws-builder-labs/)


### AWS Account ID
- every aws account has a unique Account ID
- composed of 12 digits
- used when
  - logging in with a non-root user account
  - support cases
- it is generally good practice to keep the account id secret because could be used for malicious actions

### Amazon Resource Names (ARN)
- uniquely identify aws resources. ARN's are required to specify a resource unambiguously across all of AWS
- can contain a wildcard asterick, typically usefull for policies to specify a group of things
  - arn:aws:iam::123456789012:user/Development/product_1234/*

- ARN's have the followinng variations
  - arn:partition:service:region:account-id:resource-id
  - arn:partition:service:region:account-id:resource-type/resource-id
  - arn:partition:service:region:account-id:resource-type:resource-id

- Partition
  - aws - aws regions
  - aws-cn - china regions
  - aws-us-gov - AWS govcloud regions

- Service
  - ec2
  - s3

- Regions
  - us-east-1
  - us-central-1

- Resource ID
  - Could be a number, name or path
  - user/Bob
  - instance/i-1232751232382

##### Examples
- S3 bucket arn
  - arn:aws:s3:::my-bucket
    - doesn't contain region, account-id because s3 buckets are in every region and account id because it is the current user

- Load balancer
  - arn:aws:elasticloadbalancing:us-east-2:123456789101112:loadbalancer/app/my-web-server/1231828182323


### AWS Policies
- policies are used to define **permissions** and access control for various aws resources. 
- these policies can be fine-grained or umbrella multiple resources
- policies in AWS are written in JSON format
- There are several types of policies used in AWS

  - IAM (Identity and access management)
    - These policies are used to control access to AWS resources for individual users, groups, or roles. IAM policies define the permissions that are granted or denied for specific actions on specific resources. They are attached to IAM entities, such as users, groups, or roles.

  - Resource-based policies 
    - These policies are associated directly with AWS resources such as S3 buckets, Lambda functions, and SQS queues. They define permissions for other AWS identities to access the resources. For example, you can use a resource-based policy on an S3 bucket to allow a specific IAM user from another AWS account to access the contents of the bucket.

  - SCP (Service Control Policies)
    - SCPs are used within AWS Organizations to manage permissions across multiple AWS accounts in an organization. SCPs define the maximum permissions that can be applied to an account or organization unit (OU) within the organization.

  - Assume Role Policies
    - When using IAM roles to grant temporary permissions to an entity (such as an AWS service or a federated user), an assume role policy is attached to the role. It specifies which principal (AWS service or federated user) is allowed to assume the role and under what conditions.


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
  
### Fault Tolerance
- ability for your service to ensure there is **no single point of failture**. Preventing the chance of failure

- **Fail-overs** is when you have a plan to **shift traffic** to a redundant system in case the primary system fails

- ![fail over](/2023-07-22-aws-cloud-practicioner/fail-over.png)
  - a common example is having a copy (secondary) of your database where all ongoing changes are synced. The secondary system is not in-use until a **fail over occurs** and it becomes the primary database

### High Durablility (DR)
- ability to **recover** from a disaster and prevent the loss of data. Solutions that recover from a disaster is known as **Disaster Recovery (DR)**

- Common questions
  - Do we have a backup?
  - How fast can you recover with the backup
  - Does you backup still work?
  - How do you ensure current live data is not corrupt

- Cloud Endure Disaster Recovery
  - ![cloudendure](/2023-07-22-aws-cloud-practicioner/cloudendure.png)
  - continously replicates your machine into a low-cose staging area in your target AWS accoiunt and preferred regions enabling fast and reliable recovery in case of IT data center failures.

### Business Continuity Plan (BCP)
  - A **business continuity plan** is a document that outlines how a business will continue operating **during an unplanned disruption in services**

  - ![bcp](/2023-07-22-aws-cloud-practicioner/bcp.png)
    - a BCP will define the **Recovery point (RPO) and Recovery time(RTO)**
  
  - Recovery Point Objective (RPO)
    - ![rpo](/2023-07-22-aws-cloud-practicioner/rpo-diagram.png)
    - the maximum acceptable amount of data loss after and unplanned data-loss incident, express as an **amount of time**
    - How much data are you willing to lose?
  
  - Recovery Time Objective (RTO)
    - ![rto](/2023-07-22-aws-cloud-practicioner/rto-diagram.png)
    - the maximum amount of downtime during your business can tolerate without incurring a significant financial loss
    - How much time are you willing to go down?
  
### Disaster Recovery Options
  - ![disaster options](/2023-07-22-aws-cloud-practicioner/disaster-recovery-options.png)
    - backing up you data and restoring it new infrastructure is a lot less work and cost effective as opposed as always having a scalled up copy of your infrastructure in another aws regions if the other was to go down

### Powershell cloudshell 
  - by default the cloudshell uses linux terminal
  - [powershell guide](https://aws.plainenglish.io/aws-powershell-tools-in-cloudshell-79bbc4dcd7ac)
  
  - How to use powershell in the cloudshell
    
    1. `pwsh` 
      - switch to the powershell shell
    
    2. `Install-Module -Name AWS.Tools.Installer -Force`
      - install the powershell aws installer
    
    3. `Install-AWSToolsModule AWS.Tools.Lambda`
      - install any of the aws modules you would like, in this case it would be installing the lambda module commands

### Configuring AWS Cli
  - first make sure the aws cli is installed on your system
  - go to iam the user you would like to use for the cli
  - click on `Create access key` in the iam menu
    - ![create access key](/2023-07-22-aws-cloud-practicioner/create-access-key.png)
  - `aws configure`
    - paste in the user id and the secret key from the step above
  - you can edit and add additional profiles in ~/.aws/credentials

### Infrastructure as Code (IaC)
- Aws has two offerings
  1. AWS CloudFormation (CFN)
    - ![cloudformation](/2023-07-22-aws-cloud-practicioner/aws-cloudformation.png)
    - **declarative** Iac tool
      - What you see is what you get
      - More verbose, but zero chance of mis-configuration
      - Json, YAML, XML
  
  2. AWS Cloud Development Kit (CDK)
    - ![cdk](/2023-07-22-aws-cloud-practicioner/aws-cdk.png)
    - an **imperative** IaC tool
      - You say what you want, and the rest is filled in implicit
      - less verbose, you could end up with misconfiguration
      - Does more than Declarative
      - Python, ruby, php, javascript, etc...


### AWS CloudFormation

- Allows you to write Iac in either a Json or Yaml file
- easier for devops engineers who do not have a background in web programming languages
- is simple but can lead to large files or is limited in some regard to creating dynamic or repeatable infrastructure compared to CDK

### AWS Toolkit for VSCode
- plugin to create, debug, deploy aws resources

- what you get
  - aws explorer
    - explore a wide range of aws resources to your linked aws account
  
  - aws cdk explorer
    - allows you to expore your stacks defined by your cdk

  - aws elastic container service
    - provides intellisense for ecs task-definitions files

  - Serverless applications
    - create, debug, deploy serverless applications via SAM and CFN

### Access Keys
- **Key and secret** required to have programmatic access to AWS resources. Like when interacting with the aws api outside of the aws management console.
- commonly referred to as **AWS Credentials**

- Things to know about access keys
  - Do **Not** share your access keys
  - Do **Not** commit access keys to a codebase like git
  - you can have 2 active access keys
  - you can deacticate access keys
  - access keys have whatever access a user has to a aws resource

- ![access keys](/2023-07-22-aws-cloud-practicioner/aws-access-keys.png)
- ![access keys 2](/2023-07-22-aws-cloud-practicioner/aws-access-keys-2.png)


### Shared Responsiblity Model
- **Cloud security framework** that defines the security obligations of the customer versa the cloud service provider (CSP)

- each CSP has their own variant of the Shared responsiblity model by they are all generally the same 

- ![shared responsiblity model](/2023-07-22-aws-cloud-practicioner/aws-shared-responsiblity-model.png)

- In / Of
  - Customers are responsible for the data **in** the cloud
  - AWS is responsible of the resources/hardware **of** the cloud

- ![shared reponsiblity for types of cloud services](/2023-07-22-aws-cloud-practicioner/computing-responsiblity.png)

- ![shared resopnsiblity level of customer responsiblity](/2023-07-22-aws-cloud-practicioner/aws-shared-responsiblity-model-2.png)