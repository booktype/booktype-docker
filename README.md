# booktype-docker

A complete Docker installation of [Booktype](https://github.com/booktype/booktype).

## Table of contents ##
1. [Installation](#installation)
2. [Usage](#usage)
3. [Deploy on the server](#deploy-on-the-server)
4. [Support](#support)

### Installation ###
We assume that you have [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) 
and [Docker](https://docs.docker.com/engine/installation/) installed. You will also need 
[docker-compose](https://docs.docker.com/compose/install/#install-compose) installed.

There are only two commands you need to execute:
 - git clone https://github.com/booktype/booktype-docker.git
 - cd booktype-docker/prod/ && sudo docker-compose up -d
 
When Docker is ready, you should see the output in the terminal:

    Creating prod_rabbit_1 ... done
    Creating prod_redis_1  ... done
    Creating prod_db_1     ... done
    Creating prod_web_1    ... done

Then you can open your web browser on the localhost at http://127.0.0.1:8000/ and log into the Booktype instance with the username `admin` and password `admin`. Obviously this is not secure, and you should not deploy this configuration on a public-facing server without at least changing the admin password in the `web/scripts/manage_py.sh` file.
 
### Usage ###
Please read the [Docker](https://docs.docker.com/) and [docker-compose](https://docs.docker.com/compose/) documentation.

Here are some useful commands:

- `docker-compose up -d` - runs all required containers (listed in docker-compose.yml) in detached mode
- `docker ps` - list running containers
- `docker ps -a` - list all containers
- `docker exec -it CONTAINER_ID /bin/bash` - run a command in a running container in interactive mode
- `docker-compose down` - stops containers and removes containers, networks, volumes, and images created by `up`
- `docker-compose down --volume` - as the previous command, but also removes external volumes.

### Deploy on the server ###
The current Docker installation is not tested on production servers and may not be stable. If you need to deploy Booktype on a server, please read the [user manual](http://sourcefabric.booktype.pro/booktype-24-for-authors-and-publishers/before-you-install/), or the [deployment guide](http://booktype.readthedocs.io/en/latest/deployment/), or email contact@booktype.pro for assistance.

### Support ###
Please ask questions about Booktype on Docker in the [Booktype support forum](https://forum.sourcefabric.org/categories/booktype-support).
