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
