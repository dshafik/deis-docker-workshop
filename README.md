# Docker/Deis Workshop

This workshop will familiarize you with Docker/Deis and deployment on AWS.

You can see the resulting workshop at <http://dshafik.github.io/deis-docker-workshop>

## Installation

This workshop uses [Sculpin](https://sculpin.io), a static site generator written in PHP.

If you have PHP installed locally, you can run it using:

```sh
$ sculpin generate --watch --server
```

Or, if you have a Docker environment, you can build it and run it using the Dockerfile:

```sh
$ docker build -t dshafik/deis-docker-workshop .
$ docker run -d -P dshafik/deis-docker-workshop 
```

You can then check `docker ps` to see which port is bound to port `8000`.
