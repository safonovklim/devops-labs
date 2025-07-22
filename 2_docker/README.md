# Lab 2: Work with Docker

In this lab, you will learn how to build simple Docker images.


## Preparation

### Docker CLI

1. Open your terminal
2. Verify that `docker` installed by running `docker --version`

Example:

```
> docker --version

Docker version 20.10.22, build 3a2c30b
```


If not installed, follow official Docker instructions: https://docs.docker.com/desktop


## Task


1. Run `cat devops.html` to inspect the content of HTML page
2. Run `cat Dockerfile` to inspect docker build process
3. Run `docker build -t devops-info -f Dockerfile .`
4. Run `docker images` -> find image with `devops-info` name

```
> docker images

REPOSITORY                    TAG       IMAGE ID       CREATED          SIZE
devops-info                   latest    1a97c015faf2   35 seconds ago   198MB
```

5. Run `docker ps` -> make sure it returns no running containers

```
> docker ps

CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```

6. Run docker-info image: `docker run -d -p 80:80 devops-info:latest`
7. Open `localhost:80` -> verify that you see default nginx page
8. Open `localhost:80/devops.html` -> verify that you see devops.html page from the same folder
9. Run `docker ps` -> confirm one rurnning container

```
> docker ps
CONTAINER ID   IMAGE                COMMAND                  CREATED         STATUS         PORTS                NAMES
3b864af454e3   devops-info:latest   "/docker-entrypoint.…"   2 minutes ago   Up 2 minutes   0.0.0.0:80->80/tcp   elastic_kapitsa
```

10. Stop container using `CONTAINER ID` or `NAMES`: `docker stop elastic_kapitsa`
11. Run `docker ps` -> make sure it returns no running containers

```
> docker ps

CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```


12. Make sure localhost:80 is no longer accessible

Done ✅
