# booktype-docker
Dockerized booktype

## Table of contents ##
- About
- Installation
- Usage
- Deploy on the server
- Installation for development
- Need support?


### About ###
Complete docker installation of Booktype 2.3.


### Installation ###
We assume that you have [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) 
and [Docker](https://docs.docker.com/engine/installation/) installed.

There are only 2 commands you need to execute:
 - git clone https://github.com/booktype/booktype-docker.git
 - cd booktype-docker/prod/ && docker-compose up -d
 
 
### Usage ###

Read [docker](https://docs.docker.com/) and [docker compose](https://docs.docker.com/compose/) documentation.

Here are some usefull commands you may use:

- `docker-compose up -d` - runs all required containers (listed in docker-compose.yml) in detached mode
- `docker ps` - list running containers
- `docker ps -a` - list all containers
- `docker exec -it CONTAINER_ID /bin/bash` - run a command in a running container in interactive mode
- `docker-compose down` - stops containers and removes containers, networks, volumes, and images created by `up`
- `docker-compose down --volume` - as previous command but it also removes external volumes.


### Deploy on the server ###
Current docker installation is not tested on the server and may not be stable. 
If you need to deploy booktype on the server, 
check this link https://wiki.sourcefabric.org/display/Booktype/Installing or contact https://booktype.pro

### Need support? ###
Check our [support forum](https://forum.sourcefabric.org/categories/booktype-support)