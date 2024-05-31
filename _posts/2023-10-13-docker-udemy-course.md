---
layout: post
title: Docker Udemy Course
date: 2023-10-13 18:16 -0500
categories: [Containers, Docker, Kubernetes]
image:
  path: /2023-10-13-docker-udemy-course/profile.png
---

- [Course curriculium](#course-curriculium)
- [Code for this course](#code-for-this-course)
- [Miscellaneous](#miscellaneous)
  - [--format](#--format)
  - [--filter](#--filter)
- [Section 1](#section-1)
  - [Build, Ship, Run](#build-ship-run)
  - [Docker Lab](#docker-lab)
  - [Linux concepts that Docker utilizes](#linux-concepts-that-docker-utilizes)
  - [Why docker in todays world](#why-docker-in-todays-world)
- [Section 4](#section-4)
  - [Sanity test check](#sanity-test-check)
  - [Docker cli structure](#docker-cli-structure)
  - [Image vs container](#image-vs-container)
  - [Getting a list of containers](#getting-a-list-of-containers)
  - [Creating Container from image](#creating-container-from-image)
  - [How publishing ports works](#how-publishing-ports-works)
  - [Removing Containers](#removing-containers)
  - [Getting the logs for a container](#getting-the-logs-for-a-container)
  - [Get the processes and their PIDs for a container](#get-the-processes-and-their-pids-for-a-container)
  - [What happens in when we run a container?](#what-happens-in-when-we-run-a-container)
  - [Container vs Vms](#container-vs-vms)
  - [Passing environment variables to our container](#passing-environment-variables-to-our-container)
  - [docker stats](#docker-stats)
  - [Getting a shell inside containers](#getting-a-shell-inside-containers)
  - [Docker networking](#docker-networking)
    - [Bridge network](#bridge-network)
      - [How bridge network works](#how-bridge-network-works)
      - [Multiple networks](#multiple-networks)
    - [View what port a container is listening on](#view-what-port-a-container-is-listening-on)
    - [Docker network](#docker-network)
    - [Docker network drivers](#docker-network-drivers)
    - [Docker networks DNS](#docker-networks-dns)
      - [Docker DNS Round Robin](#docker-dns-round-robin)
  - [Docker inspect](#docker-inspect)
- [Section 5 Container Images](#section-5-container-images)
  - [What is an image?](#what-is-an-image)
  - [Official and unofficial images](#official-and-unofficial-images)
  - [Image layers](#image-layers)
  - [docker history \& docker inspect](#docker-history--docker-inspect)
  - [Building an image from a dockerfile](#building-an-image-from-a-dockerfile)
  - [Ordering of the dockerfile](#ordering-of-the-dockerfile)
  - [Keywords](#keywords)
- [Section 6 Persistent Data : Volumes](#section-6-persistent-data--volumes)
  - [Volume Command](#volume-command)
  - [Bind Mounting](#bind-mounting)
  - [Bind Mounts vs Volumes](#bind-mounts-vs-volumes)
  - [docker volume create](#docker-volume-create)
- [Section 7. Docker Compose](#section-7-docker-compose)
  - [What is docker compose](#what-is-docker-compose)
  - [Docker cli tool](#docker-cli-tool)
  - [docker-compose down --rmi local -v](#docker-compose-down---rmi-local--v)
  - [docker build](#docker-build)
- [Section 8. Swarm Intro and Creating a 3-Node Swarm Cluster](#section-8-swarm-intro-and-creating-a-3-node-swarm-cluster)
  - [What is it](#what-is-it)
  - [How it works](#how-it-works)
  - [docker swarm init](#docker-swarm-init)
  - [docker node ls](#docker-node-ls)
  - [docker service ls](#docker-service-ls)
  - [docker service ps ](#docker-service-ps-)
  - [docker service](#docker-service)
  - [Say one of those containers goes down](#say-one-of-those-containers-goes-down)
  - [Overlay Multi-Host Networking](#overlay-multi-host-networking)
  - [Swarm Routing mesh](#swarm-routing-mesh)
  - [mounting volumes in swarm](#mounting-volumes-in-swarm)
  - [Stacks](#stacks)
  - [Updating a stack](#updating-a-stack)
  - [Secrets in stacks](#secrets-in-stacks)
  - [Creating the secret through the file](#creating-the-secret-through-the-file)
  - [Creating the secret by passing it through the shell](#creating-the-secret-by-passing-it-through-the-shell)
  - [Telling docker to use a secret for a docker container](#telling-docker-to-use-a-secret-for-a-docker-container)
  - [Telling docker to use secrets in a container in the docker compose file](#telling-docker-to-use-secrets-in-a-container-in-the-docker-compose-file)
  - [Secrets with stacks](#secrets-with-stacks)
- [Section 10: Swarm App Lifecycle](#section-10-swarm-app-lifecycle)
  - [Full App Lifecycle with Compose](#full-app-lifecycle-with-compose)
  - [Using the docker-compose config to merge](#using-the-docker-compose-config-to-merge)
  - [Swarm Updates](#swarm-updates)
  - [Docker Healthcheck](#docker-healthcheck)
- [Section 13 The What and Why of Kubernetes](#section-13-the-what-and-why-of-kubernetes)
  - [What is Kubernetes](#what-is-kubernetes)
  - [Why Kubernetes](#why-kubernetes)
  - [Kubernetes vs Swarm](#kubernetes-vs-swarm)
- [Section 14 Kubernetes Architecture and Install](#section-14-kubernetes-architecture-and-install)
  - [Terminology](#terminology)
- [Section 15: Your first Pods](#section-15-your-first-pods)
  - [Kubectl run, create, apply](#kubectl-run-create-apply)
  - [kubectl explain](#kubectl-explain)
  - [General](#general)
  - [Deployment with kubectl](#deployment-with-kubectl)
  - [Scaling Relicasets](#scaling-relicasets)
- [Section 16. Inspecting Kubernetes Resources](#section-16-inspecting-kubernetes-resources)
  - [kubectl get ..](#kubectl-get-)
  - [kubectl describe](#kubectl-describe)


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

# Miscellaneous

## --format
  - The --format options is available for a lot of docker commands like `docker container ls` and `docker image ls`
  - You can use a go template to format the output to customize it to your liking [go templates docs](https://docs.docker.com/config/formatting/) 

  - `docker container ls --format {{json .}} | jq`
    - view all of the possible columns you can print out
    - pipes the output to jq to make it easier to read

  - `docker image ls --format {{.ID}}\t{{.Repository}}`
    - print out the ID and Repository information for all of the images
  
  - `docker image ls --format 'table {{.ID}}\t{{.Repository}}'`
  
  - `docker container inspect --format='{{range .NetworkSettings.Networks}}{{println .IPAddress}}{{println .MacAddress}}{{end}}' httpd`
    - print out a range of values inside of a nested json object
    - make sure to end with `{{end}}`

## --filter
  - The --filter option is available for a lot of docker commands like 
  - you can either choose to use `--filter` or `-f`
  - it is in key=value format `--filter foo=bar`
  - Using the same filter multiple times is interpreted as a **logical OR** `--filter foo=bar --filter foo=mars`
  - Using a different filter is interpreted as a **logical AND** `--filter foo=bar age=25 state=Tx`


# Section 1

## Build, Ship, Run
  - ![bsr](/2023-10-13-docker-udemy-course/bsr.png)
  - The 3 steps to take non-containerized software and to containerize them

Docker Image (Build)
  - ![layers](/2023-10-13-docker-udemy-course/layers.png)
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
  - ![push](/2023-10-13-docker-udemy-course/push.png)
    - Uses a hash to make sure the user is downloading the correct docker image from the registry

Docker Run (Run)
  - Another machine can pull down the image from the registry with
  - `docker pull`
  - Then use `docker run`
    - This will create namespace for that container
  - containers cannot see what other containers are doing and their information

## Docker Lab
  - [Play with Docker](https://labs.play-with-docker.com)
  - ![Play with Docker](/2023-10-13-docker-udemy-course/play-with-docker.png)
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

# Section 4

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

## Getting a list of containers
  - `docker ps` or new way `docker container ls`
    - gets a list of running containers
  - `docker ps -a`
    - gets a list of all containers, **running and stopped**
  - `docker ps -aq`
    - gets a list of all containers just the container id's
  - ` docker ps -aq --filter "id=container_id" `
    - list docker containers with a certain id
  - ` docker ps -aq --filter "ancestor=nginx" `
    - list docker containers that have an image of **nginx**

## Creating Container from image
  - `docker run nginx -d`
    - run a new docker nginx container image and detach from the session

## How publishing ports works
  - `docker container run -p 8080:80  httpd`
    - we are saying the host machine is going to listen on 8080 and port forward to 80 in the docker container
    - 8080:80
    - host machine -> docker container

## Removing Containers
  - `docker rm container_id`
    - removes the container from the list of containers
  - `docker ps -aq --filter "ancestor=nginx" | xargs docker rm `
    - removes all docker images that are using the nginx image
  - `docker rm 634 123`
    - you don't have to give the entire container_id just the first couple that are unique
    - you can also remove multiple at one time

## Getting the logs for a container
  - `docker logs -f container_id`

## Get the processes and their PIDs for a container
  - `docker container top container_id`

## What happens in when we run a container?
  - example `docker run nginx`
  1. looks for image locally in image cache
  2. then looks in remote image repo (defaults to docker hub)
  3. downloads the latest version (nginx:latest)
  4. creates new container based on that image and prepares start
  5. gives it a virtual IP on a private network inside docker engine
  6. Opens up port 80 on host nad forwards to port 80 in container
  7. starts container by using the CMD in the docker file

## Container vs Vms
  - containers are just a restricted process running on the OS kernel
  - exit when process stops
  - Docker desktop uses a lightweight linux vm to run your containers

## Passing environment variables to our container
  - a lot of times a container will allow or even mandate you pass environment variables to the container
  - this is done with `-e` or `--env`
  - `docker run -e MYSQL_ROOT_PASSWORD=P@ssw0rd1 mysql`

## docker stats
  - `docker stats nginx`
    - look at real time stats for a container

  - `docker stats`
    - real time stats for all running containers

## Getting a shell inside containers
  - `docker run -it nginx bash`
    - start a **new container** interactively
  - `docker container exec -it nginx bash`
    - get shell inside **existing container**

## Docker networking
  - each container connected to a private virtual network "bridge"
  - each virtual network routes through NAT firewal on host IP
  - all containers on a virtual network can talk to each other without -p
  - best practice is to create a new virtual network for each app
    - network "my_web_app" for mysql and php/apache containers
    - network "my_api" for mongo and nodejs containers
  - we can attach containers to more than one network or none if we wanted
  - skip virtual networks and use host IP (--net=host)
  - "Batteries included, but removable"
    - docker motto
    -  defaults work well in many cases, but easy to swap out parts to customize it
  - typically starts defaults to 172.17 for the bridge network

### Bridge network
  - When you create a new container without explicitly specifying a custom network, it is connected to the "bridge" network.
  - The bridge network allows containers to communicate with each other using their container names as hostnames
  - Containers connected to the bridge network can also access the external network and the host machine.

#### How bridge network works
  - Each container connected to the "bridge" network is assigned a unique IP address within the bridge network's subnet.
  - The bridge network is NATed, allowing containers to access external resources and the internet via the host's IP address.
  - It's important to note that the default bridge network is for basic communication and isolation between containers on the same host. If you need more advanced network configurations, such as connecting containers across different hosts or requiring specific networking features, Docker provides support for user-defined custom networks that you can create and manage as needed.

#### Multiple networks
  - You can have multiple containers listening on the same port but the host must be listening on a different port
    - ex. we can have 8080:80 & 80:80
      - this means that when port 8080 is accessed on host it will route to container 1 to port 80 & when port 80 is accessed on host it will route to second container port 80
    - but we cannot do this. 80:80 & 80:8080
      - this will error out when we try to create the second container saying that the host machine is already listening on port 80

### View what port a container is listening on
  - `docker port container-name`

### Docker network
  - `docker network ls`
    - list all networks
  - `docker network inspect NETWORK_NAME`
    - inspect a network
    - among all of the information it gives you it will give you the running containers in the networkj0:w

```json
[
    {
        "Name": "bridge",
        "Id": "9cc27e1d79d7df5e7f15b5eea7e4de674acf99b0841fbda6dab6f81054f413ac",
        "Created": "2023-10-30T17:24:08.868915952-05:00",
        "Scope": "local",
        "Driver": "bridge",
        "ConfigOnly": false,

        // ...

        "Containers": {
            "595894343cb46781979de44dc5e5a87cc2c5a543ed23c3c7162b37bd461730a7": {
                "Name": "nginx",
                "EndpointID": "b943f2917d7e38b3672f4ee76a795dbfb0fc6103cd541ba0370a6ee50c381b0d",
                "MacAddress": "02:42:ac:11:00:03",
                "IPv4Address": "172.17.0.3/16",
                "IPv6Address": ""
            },
            "9ac08dc89f5a9e6b06d2a76f8602a9d240db76c3e9bcb5795c7ba27ad3ab4164": {
                "Name": "portainer",
                "EndpointID": "f2a95d3c8e09a4cbe5242b53e2c863a1b59bcde867c7421cff79fd9517a9060f",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            }
        }
        // ...
    }
]

```

  - `docker network create --driver`
    - create a network
  - `docker network connect`
    - attach a network to a container
  - `docker network disconnect`
    - detach a network from a container

### Docker network drivers
  - What is a network driver
    - built-in or 3rd party extension that gives you virtual network features

### Docker networks DNS
  - Docker daemon has built-in DNS server that containers use by default
  - docker defaults to the hostname but you can also set aliases
  - bridge network does not have built in dns server by default
  - however all custom networks come with dns sever enabled by default

#### Docker DNS Round Robin
  - we can multiple containers on a created network resopnd to the same DNS address
  - it will cycle through the dns records using dns round robin

## Docker inspect
  - uses Go templates
  - format is case sensitive

  - `docker inspect portainer`

```text
tpool@tpool-thinkpad-l480:~$ docker inspect portainer
[
    {
        "Id": "9ac08dc89f5a9e6b06d2a76f8602a9d240db76c3e9bcb5795c7ba27ad3ab4164",
        "Created": "2021-10-04T13:23:00.369505177Z",
        "Path": "/portainer",
        "Args": [],
        "State": {
            "Status": "running",
            "Running": true,
            "Paused": false,
            "Restarting": false,
            "OOMKilled": false,
            "Dead": false,
            "Pid": 2545,
            "ExitCode": 0,
            "Error": "",
            "StartedAt": "2023-10-30T22:24:10.553120828Z",
            "FinishedAt": "2023-10-30T22:15:42.373298346Z"
        },
        "Image": "sha256:580c0e4e98b06d258754cf28c55f21a6fa0dc386e6fe0bf67e453c3642de9b8b",
        "ResolvConfPath": "/var/lib/docker/containers/9ac08dc89f5a9e6b06d2a76f8602a9d240db76c3e9bcb5795c7ba27ad3ab4164/resolv.conf",
        "HostnamePath": "/var/lib/docker/containers/9ac08dc89f5a9e6b06d2a76f8602a9d240db76c3e9bcb5795c7ba27ad3ab4164/hostname",
        "HostsPath": "/var/lib/docker/containers/9ac08dc89f5a9e6b06d2a76f8602a9d240db76c3e9bcb5795c7ba27ad3ab4164/hosts",
        "LogPath": "/var/lib/docker/containers/9ac08dc89f5a9e6b06d2a76f8602a9d240db76c3e9bcb5795c7ba27ad3ab4164/9ac08dc89f5a9e6b06d2a76f8602a9d240db76e9bcb5795c7ba27ad3ab4164-json.log",
        "Name": "/portainer",
        "RestartCount": 0,
        "Driver": "overlay2",
        "Platform": "linux",
        "MountLabel": "",
        "ProcessLabel": "",
        "AppArmorProfile": "docker-default",
        "ExecIDs": null,
        "HostConfig": {
            "Binds": [
                "/var/run/docker.sock:/var/run/docker.sock",
                "portainer_data:/data"
            ],
            "ContainerIDFile": "",
            "LogConfig": {
                "Type": "json-file",
                "Config": {}
            },
            "NetworkMode": "default",
            "PortBindings": {
                "8000/tcp": [
                    {
                        "HostIp": "",
                        "HostPort": "8000"
                    }
                ],
                "9000/tcp": [
                    {
                        "HostIp": "",
                        "HostPort": "9000"
                    }
                ]
            },
            "RestartPolicy": {
                "Name": "always",
                "MaximumRetryCount": 0
            },
            "AutoRemove": false,
            "VolumeDriver": "",
            "VolumesFrom": null,
            "ConsoleSize": [
                0,
                0
            ],
            "CapAdd": null,
            "CapDrop": null,
            "CgroupnsMode": "host",
            "Dns": [],
            "DnsOptions": [],
            "DnsSearch": [],
            "ExtraHosts": null,
            "GroupAdd": null,
            "IpcMode": "private",
            "Cgroup": "",
            "Links": null,
            "OomScoreAdj": 0,
            "PidMode": "",
            "Privileged": false,
            "PublishAllPorts": false,
            "ReadonlyRootfs": false,
            "SecurityOpt": null,
            "UTSMode": "",
            "UsernsMode": "",
            "ShmSize": 67108864,
            "Runtime": "runc",
            "Isolation": "",
            "CpuShares": 0,
            "Memory": 0,
            "NanoCpus": 0,
            "CgroupParent": "",
            "BlkioWeight": 0,
            "BlkioWeightDevice": [],
            "BlkioDeviceReadBps": null,
            "BlkioDeviceWriteBps": null,
            "BlkioDeviceReadIOps": null,
            "BlkioDeviceWriteIOps": null,
            "CpuPeriod": 0,
            "CpuQuota": 0,
            "CpuRealtimePeriod": 0,
            "CpuRealtimeRuntime": 0,
            "CpusetCpus": "",
            "CpusetMems": "",
            "Devices": [],
            "DeviceCgroupRules": null,
            "DeviceRequests": null,
            "MemoryReservation": 0,
            "MemorySwap": 0,
            "MemorySwappiness": null,
            "OomKillDisable": false,
            "PidsLimit": null,
            "Ulimits": null,
            "CpuCount": 0,
            "CpuPercent": 0,
            "IOMaximumIOps": 0,
            "IOMaximumBandwidth": 0,
            "MaskedPaths": [
                "/proc/asound",
                "/proc/acpi",
                "/proc/kcore",
                "/proc/keys",
                "/proc/latency_stats",
                "/proc/timer_list",
                "/proc/timer_stats",
                "/proc/sched_debug",
                "/proc/scsi",
                "/sys/firmware"
            ],
            "ReadonlyPaths": [
                "/proc/bus",
                "/proc/fs",
                "/proc/irq",
                "/proc/sys",
                "/proc/sysrq-trigger"
            ]
        },
        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/ef2ed5f8857015e17c63409cf30709ab27e28980904ff7485b71491398a40023-init/diff:/var/lib/docker/overl2/6446e65733c5aed3c46249e5591d0d0d5a4c2880d9677726de09d7264750fa34/diff:/var/lib/docker/overlay2/ea1bb36db029c8376e60ff20ffeaf6b2ffa1a87345ec3dc9d9873b7e19757e/diff:/var/lib/docker/overlay2/aec3d97f1397147c1cbd02e8940012108f46f00aa57feaf693d2e9288883818f/diff",
                "MergedDir": "/var/lib/docker/overlay2/ef2ed5f8857015e17c63409cf30709ab27e28980904ff7485b71491398a40023/merged",
                "UpperDir": "/var/lib/docker/overlay2/ef2ed5f8857015e17c63409cf30709ab27e28980904ff7485b71491398a40023/diff",
                "WorkDir": "/var/lib/docker/overlay2/ef2ed5f8857015e17c63409cf30709ab27e28980904ff7485b71491398a40023/work"
            },
            "Name": "overlay2"
        },
        "Mounts": [
            {
                "Type": "volume",
                "Name": "portainer_data",
                "Source": "/var/lib/docker/volumes/portainer_data/_data",
                "Destination": "/data",
                "Driver": "local",
                "Mode": "z",
                "RW": true,
                "Propagation": ""
            },
            {
                "Type": "bind",
                "Source": "/var/run/docker.sock",
                "Destination": "/var/run/docker.sock",
                "Mode": "",
                "RW": true,
                "Propagation": "rprivate"
            }
        ],
        "Config": {
            "Hostname": "9ac08dc89f5a",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "ExposedPorts": {
                "8000/tcp": {},
                "9000/tcp": {}
            },
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": null,
            "Image": "portainer/portainer",
            "Volumes": {
                "/data": {}
            },
            "WorkingDir": "/",
            "Entrypoint": [
                "/portainer"
            ],
            "OnBuild": null,
            "Labels": {}
        },
        "NetworkSettings": {
            "Bridge": "",
            "SandboxID": "07bbc281fa8bb4cd026e14b8ff43938038b0cef93acb8e8abeddf8847564b8bc",
            "HairpinMode": false,
            "LinkLocalIPv6Address": "",
            "LinkLocalIPv6PrefixLen": 0,
            "Ports": {
                "8000/tcp": [
                    {
                        "HostIp": "0.0.0.0",
                        "HostPort": "8000"
                    },
                    {
                        "HostIp": "::",
                        "HostPort": "8000"
                    }
                ],
                "9000/tcp": [
                    {
                        "HostIp": "0.0.0.0",
                        "HostPort": "9000"
                    },
                    {
                        "HostIp": "::",
                        "HostPort": "9000"
                    }
                ]
            },
            "SandboxKey": "/var/run/docker/netns/07bbc281fa8b",
            "SecondaryIPAddresses": null,
            "SecondaryIPv6Addresses": null,
            "EndpointID": "f2a95d3c8e09a4cbe5242b53e2c863a1b59bcde867c7421cff79fd9517a9060f",
            "Gateway": "172.17.0.1",
            "GlobalIPv6Address": "",
            "GlobalIPv6PrefixLen": 0,
            "IPAddress": "172.17.0.2",
            "IPPrefixLen": 16,
            "IPv6Gateway": "",
            "MacAddress": "02:42:ac:11:00:02",
            "Networks": {
                "bridge": {
                    "IPAMConfig": null,
                    "Links": null,
                    "Aliases": null,
                    "NetworkID": "9cc27e1d79d7df5e7f15b5eea7e4de674acf99b0841fbda6dab6f81054f413ac",
                    "EndpointID": "f2a95d3c8e09a4cbe5242b53e2c863a1b59bcde867c7421cff79fd9517a9060f",
                    "Gateway": "172.17.0.1",
                    "IPAddress": "172.17.0.2",
                    "IPPrefixLen": 16,
                    "IPv6Gateway": "",
                    "GlobalIPv6Address": "",
                    "GlobalIPv6PrefixLen": 0,
                    "MacAddress": "02:42:ac:11:00:02",
                    "DriverOpts": null
                }
            }
        }
    }
]
```

  - ![alt-text](/2023-10-13-docker-udemy-course/inspect.png)
    - gets the ID for the container

  - ![alt-text](/2023-10-13-docker-udemy-course/inspect2.png)
    - gets the ip address for the container

# Section 5 Container Images

## What is an image?
  - app binaries and dependencies
  - metadata about the image data and how to run the image
  - not a complete os. no kernel, drivers
  - could be as small as one executable file
  - could be as big as a linux distro like ubuntu with ap, apache, php and more

## Official and unofficial images
  - There is only one image that is official, there is no slashes in the name just the name like nginx
  - unofficial images are ones that have a username/reponame

## Image layers
  - images are layers upon layers
  - you don't have to install layers you already have
  - as we make changes to our images, it creates more layers
  - we are never storing the same layer multiple times on our system

## docker history & docker inspect
  - `docker history`
    - gives the history of the docker image
    - uses copy on write concept

## Building an image from a dockerfile
  - `docker build -t customnginx .`
    - the t just specifies the name of the image
    - we just use a dot because docker will look for a file named DockerImage
    - after processing you can find your image with `docker image ls`
    - say we want to build it again but a couple of the lines are the same, docker will cache it for the next run
      - that is what makes docker so fast

## Ordering of the dockerfile
  - order matters especially when it comes to speed
  - when you build an image it will go line by line and use the cache if it has not changed.
    - if it has changed it will have to run the code again taking longer
    - but not only will it have to run that code again, it will have to run all of the code below that too
    - that is why you keep the code that changes less at the top, and the code that changes the most at the bottom

## Keywords
  - FROM
    - from an offical repo or a custom one to base your image off of
  - WORKDIR
    - just like a cd mydir. It just changes your directory
  - COPY
    - copy to/from your local machine into your docker images

# Section 6 Persistent Data : Volumes
  - containers are usually immutable and ephemeral
  - only re-deploy container, never change
  - Docker gives us this feature to ensure these "separation of concerns"
  - known as "persistent data"
  - Two ways
    - Volumes
      - make special location outside of container UFS
    - Bind Mounts
      - link container path to host path
      - cool because it links to a directory on your host, and your docker container can use that file/folder
      - Maps a host file or directory to a container file
      - Skips UFS (Union file system) and host files overwrite any in container


## Volume Command
  - VOLUME command
    - used to create a mount point and associate it with a directory in the container. This allows the container to share data between the host machine and the container or between containers.
    - all files created in the container will outlive the container in a separate place on the host
    - needs manual deletion if you were to delete a container, it would not delete the volume
  - you dont' have to use the volume command to create a volume in docker, because you can just specify the location manually, however it is recommended to make a volume

  - creating a volume
  `docker volume create <myVolume>`

  - `docker container run -d --name mysql -v mysqlVolume mysqlImage`
    - with **-v** you can specify the name of the volume

  - `docker container run -d --name mysql -v mysqlVolume:/var/lib/volumes/mysqlVol mysqlImage`
    - you can even specify the location and name like this

## Bind Mounting
  - Maps a host file or directory to a container file or directory
  - Can't use in Dockerfile, must be at container run
  - `docker container run -v $(pwd):/usr/share/nginx/`
    - this will bind the mount in the cwd to /user/share/nginx in the container

## Bind Mounts vs Volumes
  - Bind mounts directly map host files or directories to container files or directories, while volumes are managed by Docker and provide more portability and functionality.
  - Bind mounts are suitable for development and can be used to access host files during container runtime, while volumes are preferred for sharing data among containers and across different Docker hosts.


## docker volume create
  - you can create your own volume manually
  - you would want to do this if you want to add a specific **driver**

# Section 7. Docker Compose

## What is docker compose
  - Docker Compose is a tool provided by Docker that simplifies the process of defining, running, and managing multi-container Docker applications.
  - It allows you to define the services, networks, and volumes required for your application in a single **YAML file**, typically named docker-compose.yml.
  - it uses Declarative synatx making it easy to read and maintain
  - it allows you to define dependencies
  - allows you to easily scale by defining the number of instances you want to run the yaml file

## Docker cli tool
  - `docker-compose`
  - cli tool used for local/dev/test automation with those yaml files
  - `docker-compose.yml` - is the default filename, but any can be used with `docker-compose -f`
  - now with docker 1.13+ these yaml files can be used with swarm

## docker-compose down --rmi local -v
  - removes all of the images that were built specifically for this docker-compose file and also removes any volumes that were created in association with it

## docker build
  - creates custom images before creating a container that will use them

```docker-compose
services:
  drupal:
    image: custom-drupal-image
    build: .
    ports:
      - "8080:80"
    volumes:
      - drupal-module:/var/www/html/modules
      - drupal-profiles:/var/www/html/profiles
      - drupal-sites:/var/www/html/sites
      - drupal-themes:/var/www/html/themes

  postgres:
    image: postgres
    environment:
      - POSTGRES_PASSWORD=password
    volumes:
      - drupal-data:/var/lib/postgresql/data

volumes:
  drupal-data:
  drupal-module:
  drupal-profiles:
  drupal-sites:
  drupal-themes:
```
  - creates the image first with the Docker file that is in the current directory and names that image name 'custom-drupal-image'

# Section 8. Swarm Intro and Creating a 3-Node Swarm Cluster

## What is it
  - Swarm mode is a clustering solution built inside of docker
  - note related to swarm "classic" for pre-1.12 versions
  - Not enabled by default, new commands once enabled
    - `docker swarm`
    - `docker node`
    - `docker service`
    - `docker stack`
    - `docker secret`

## How it works
  - A swarm is made of nodes
  - A manager node has a database locally on them, it stores their configuration and gives them all the need to be the authority inside a swarm
  - They all have their own local db copy and encrypt their traffic to ensure integrity 
  - the control plane is where all the traffic between the nodes gets sent over
  - ![docker manager](\2023-10-13-docker-udemy-course\docker-manager.png)
  - ![docker manager overview](\2023-10-13-docker-udemy-course\manager-overview.png)
  - a manager is just a worker with permissions to control the swarm
  - ![docker manager overview](\2023-10-13-docker-udemy-course\swarm-example.png)
    - a single service can have multiple tasks, as seen in the picture
  - ![docker swarm architecture](\2023-10-13-docker-udemy-course\swarm-architecure.png)

## docker swarm init
  - Lots of PKI and security automation
    - Root signing certificate created for our swarm
    - cert is issued for first manager role
    - join tokens were created
  - Raft database created to store root CA, configs, and secrets
    - encrypted by default
    - no need for another key/value system to hold orchestration/secrets

## docker node ls
  - gets all of the manager and nodes in a swarm

## docker service ls
  - gets all of the services sent to a swarm of containers

## docker service ps <service-id>
  - gets all of the tasks for a given service

## docker service
  - used to sort of in place of the docker run command so we don't break existing docker code

## Say one of those containers goes down
  - if were to remove a container while a docker swarm has a service that has 3 replicas spinned up. It will create another container and continue. 
  - Swarm does its best to make sure if a container goes down to spin up a new one as fast as it can

## Overlay Multi-Host Networking
  - use `--driver overlay` when creating a network
  - for container to container traffic inside a single swarm
  - optional IPSec (AES) encryption on network creation
  - each service can be connect to multiple networks (ex. backend, frontend)

## Swarm Routing mesh
  - routes ingress (incoming) packets for a service to proper task
  - spans all nodes in a swarm
  - uses ipvs from linux kernel
  - two ways this works
    - container-to-container in an overlay network (uses vip)
    - external traffic incoming to published ports (all nodes listen)
  - stateless load balancing
  - Load balancer is at OSI Level 3
    - But the limitation can be overcame by using something like nginx that operates on level 4

## mounting volumes in swarm
  - [stackoverflow post](https://stackoverflow.com/questions/47756029/how-does-docker-swarm-implement-volume-sharing)

## Stacks
  - A new layer of abstraction to swarm called **stacks**
  - Stacks accept **compose files** as their **declarative** definition for **services, networks, and volumes**
  - `docker stack deploy`
  - stacks manages all thos objects for us, including the **overlay network** per stack. Adds stack name to start of their name
  - deploy key in compose file **Cannot** do **build**
    - compose ignores **deploy**: keyword
    - swarm ignores **build**: keyword
  - stacks only work on a 1 swarm basis. Meaning a single stack file can only deploy one swarm, that's it
  - `docker stack deploy -c mystackfile.yml stackName`
    - deploy a swarm with a yml file

## Updating a stack
  - If you wanted to updated a running stack, you just have to update the .yml file and rerun `docker stack deploy -c <mystackfile.yml> mystackname`
  - docker will go through the file and make any necessary updates

## Secrets in stacks
  - Easiest "secure" solution for storing secrets in swarm
  - built into swarm
  - secure because encrypted at rest, transit.
  - as of docker 1.13 swarm raft db is encrypted on disk
  - what is a secret
    - ssh keys
    - tls cert
    - username & passwords
    - etc. whatever you don't want anyone to view
  - supports generic strings or binary content up to **500kb** in size
  - doesn't require apps to be rewritten
  - only stored on disk of manager nodes
  - secrets are first stored in swarm, then assigned to a service
  - they look like files in container but are actually stored in **memory** fs
    - /run/secrets/<secret-name> or 
      - /run/secrets/<secret-alias>

## Creating the secret through the file
  - `docker secret create password mypasswordfile.txt`
## Creating the secret by passing it through the shell
  - `echo "myDBpassword" | docker secret create psql_pass -`
    - the `-` at the end tells the shell to get the input from stdin which was passed via grep

## Telling docker to use a secret for a docker container   

```shell
  docker service create --name psql \
    --secret psql_user --secret psql_pass \
    -e POSTGRES_PASSWORD_FILE=/run/secrets/psql_pass \
    -e POSTGRES_USER_FILE=/run/secrets/psql_user postgres
```
  - this is a security concern because the file gets stored on the file system of the container it is used for
  - if we were to connect to the shell of this container, the file would be stored here `/run/secrets/<secret-name>`

## Telling docker to use secrets in a container in the docker compose file

```yaml
version: "3.1"

# services
services:
  psql:
    image: postgres
    secrets:
      - psql_user
      - psql_pass
    environment:
      - POSTGRES_PASSWORD_FILE: /run/secrets/psql_pass
      - POSTGRES_USER_FILE: /run/secrets/psql_user

# define our secrets
secrets:
  psql_user:
    file: ./psql_user.txt
  psql_pass:
    file: ./psql_pass.txt
```
  - `docker stack deploy -c docker-compose.yml mydb`
  - creates the secrets before the services
  - At the bottom we are defining our environment variables by using the file it is stored in
  - And in the psql service we are using the file path where the environment variable will be stored in on the container

We could also define our secrets before hand and use them in our docker compose another way

## Secrets with stacks
  - version fo the compose file has to be at min 3.1
  - **external** keyword tells the compose file to look for the secret that has been declared before
```yaml
# This example file from a previous lecture where we ran drupal in docker compose
# in this Assignment, change it to work with the default drupal image, and change
# postgres to use a Swarm secret. More info in the README.md file.

version: "3.1"

services:

  drupal:
    image: custom-drupal
    ports:
      - "8080:80"
    volumes:
      - drupal-modules:/var/www/html/modules
      - drupal-profiles:/var/www/html/profiles
      - drupal-sites:/var/www/html/sites
      - drupal-themes:/var/www/html/themes

  postgres:
    image: postgres:14
    environment:
      - POSTGRES_PASSWORD=/run/secrets/psql-pw
    # the docker manager will share the secret with this container
    secrets:
      - psql-pw
    volumes:
      - drupal-data:/var/lib/postgresql/data

volumes:
  drupal-data:
  drupal-modules:
  drupal-profiles:
  drupal-sites:
  drupal-themes:

# tells compose file that the secret has already been declared
secrets:
  psql-pw:
    external: true
```

# Section 10: Swarm App Lifecycle
  
## Full App Lifecycle with Compose
  - `docker-compose up` for development environment
  - `docker-compose up` for CI environment
  - `docker stack deploy` production environment
  - `docker-compose.override.yml` - by default when you run `docker-compose up` it will run this file
  - `docker-compose -f docker-compose.override.yml up -d` - First runs docker-compose.yml then docker-compose.override.yml and merges them


## Using the docker-compose config to merge
  `docker-compose -f docker-compose.yml -f docker-compose.test.yml config > output.yml`
  - merges the two compose files into one combined one and outputs it to `output.yml`

## Swarm Updates
  - Provides rolling replacement of tasks/containers in a service
  - Limits downtime (be careful with "prevents" downtime) 

  - How to update the image used to a newer version
    - `docker service update --image myapp:1.2.1 myservicerunning`
  - Adding an environment variable and remove a port
    - `docker service update --env-add NODE_ENV=production --publish-rm 8080`
  - Change number of replicas of two services
    - `docker service scale web=8 api=6`
  - Rebalancing to even out the tasks to the nodes in a swarm
    - `docker service update --force web`

## Docker Healthcheck
  - `HEALTHCHECK` was added in 1.12
  - supported in dockerfile, compose yaml, docker run, and swarm services
  - docker engine will exec's the command in the container
  - it expects exit 0(OK) or exit 1(ERROR)
  - there are 3 container states (STARTING, HEALTHY, UNHEALTHY)
  - `docker service create --name db --replicas 3 -e POSTGRES_PASSWORD=mysecretpassword --health-cmd "pg_isready -U postgres || exit 1" -d postgres`
  - `docker container run --name db -e POSTGRES_PASSWORD=mysecretpassword --health-cmd "pg_isready -U postgres || exit 1" postgres`
```yaml
FROM UBUNTU:20.04

COPY ./Downloads /home/newuser/Downloads

WORKDIR /home/newuser/Downloads

HEALTHCHECK ./healcheck-script.sh || exit 1
```
- if the healthcheck script fails then it will return 1 and status will be unhealthy


# Section 13 The What and Why of Kubernetes
  
## What is Kubernetes
  -  Kubernetes = popular container orchestrator
  - Released by Google but now maintained by an open source community
  - Makes many machines act as one
  - Runs on Top of Docker (usually) as a set of APIs in containers
  - provides API/CLI to manage containers across servers
  - many clouds provide it for you
  - many vendors make a "distribution" of it
  - uses same raft protocol to get a consensus

## Why Kubernetes
  - It is the waythe industry is going
  - Servers + Change Rate = Benefit of orchestration

## Kubernetes vs Swarm
  - Swarm is Easy
  - Kubernetes has more features and flexibility
  - Swarm
    - Comes with docker
    - easiest orchestrator to deploy/manage yourself
    - Follows 80/20 rule, 20% of features of k8 and solves 80% of the uses cases
    - Runs anywhere Docker does: local,cloud,data-center, arm, windows, 32-bit
    - Secure by default
    - Easier to troubleshoot
  - Kubernetes
    - Clouds will deploy/manage kubernetes for you
    - infrastructure vendors are making their own distros
    - widest adoption and community
    - Flexible: Covers widest set of use cases
    - "No one ever got fired for buying IBM"

# Section 14 Kubernetes Architecture and Install

## Terminology
  Kubernetes 
  - The whole orchestration system
  - K8s (Kube for short)
  - (K eight letters and then the s)

  Kubectl
  - CLI to configure k8 and manage apps 
  - "cube control" - official pronunciation

  Node
  - Single server in the k8 cluster

  Pod
  - one or more containers running together on one node
  - basic unit of deployment. Containers are always in pods

  Controller
  - For creating/updating pods and other objects
  - Many types of Controllers
    - Deployment, Replicaset, Statefulset, DaemonSet, Job, CronJob

  Service
  - network endpoint to connect to a pod(s)
  - an abstraction which defines a logical set of Pods and a policy by which to access them.

  Jobs
  - Creates pods(s) and ensures that a specified number successfully completed. When a specified number of successful run of pods is completed, then the job is considered complete

  Namespace
  - Logical separation between teams and their environments. it allows various teams (Dev,Prod) to share K8's cluster by providing isolated workspace
  - Filtered group of objects in cluster

  Kubelet
  - k8 agent running on the nodes
  - since k8 runs on top of the docker engine, it needs its own agent and engine to function correctly (swarm didn't need one because it was built into docker)
  
  Control Plane:
  - Set of containers that manage the cluster
  - Includes API server, scheduler, controller manager, etcd, and more
  - sometimes called the "master"

# Section 15: Your first Pods

## Kubectl run, create, apply
  - `kubectl run` (single pod per command since 1.18)
    - similar to docker run
    - you always have to specify a name for the pod

  - `kubectl create` (create some resources via CLI or YAML)
    - similar to docker create

  - `kubectl apply` (create / update anything via YAML)
    - similar to docker stack deploy

## kubectl explain
  - the cli can give you information about something in k8 with the explain command
  - `kubectl explain pods`
  
## General
  - You typically use a yaml file for deployment and just the cli for testing and development
  - Unlike Docker, you can't create a container directly in k8
    - k8 creates pods (via cli,yaml or api) which k8 then in turn creates containers inside of it
  - kubelet tells the container runtime to create containers for you

## Deployment with kubectl
  - essentially the equivalent to what a swarm service is like
  - allows you to create one or more pods
  - `kubectl create deployment my-nginx --image nginx`
  - this will create a **relicateset** instead of a pod directly

  - `kubectl delete deployment my-nginx`
  - delete the deployment

## Scaling Relicasets
  - Essentially "add more pods or replicas to the node in the deploymment"
  - `kubectl scale` will change the deployment record
  - cm will see that only the replica count has changed
  - scheduler sees a new pod is requested, assigns to a node
  - kubelet sees a new pod, tells container runtime to start httpd



# Section 16. Inspecting Kubernetes Resources

## kubectl get ..
  - `kubectl get all`
    - List our common resources (in the default namespace)

  - `kubectl get deploy/<deployment-name>`
    - view only the kubectl resource you are trying to look at

  - `kubectl get deploy/apache -o wide`
    - view in wide format

  - `kubectl get deploy/apache -o json`
    - view in json format

  - `kubectl get` has a weakness
    - it can only show one resource at a time
    - we need a command that combines related resources
    - parent/child resources
    - events of that resource

## kubectl describe
  - `kubectl describe deploy/my-apache`
  - describe does the following
    - Deployment summary
    - ReplicaSet status
    - Pod Template
    - Old/New ReplicaSet names
    - Deployment Events

Example output
```yaml
trestenp@PD-ITCADTEST6:~/Playground/dca-training/Docker-Certified-Associate-DCA-Exam-Guide$ k describe deploy/apache
Name:                   apache
Namespace:              default
CreationTimestamp:      Fri, 31 May 2024 09:28:28 -0500
Labels:                 app=apache
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=apache
Replicas:               2 desired | 2 updated | 2 total | 2 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=apache
  Containers:
   httpd:
    Image:        httpd
    Port:         <none>
    Host Port:    <none>
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Progressing    True    NewReplicaSetAvailable
  Available      True    MinimumReplicasAvailable
OldReplicaSets:  <none>
NewReplicaSet:   apache-f9489c7dc (2/2 replicas created)
Events:          <none>
```

