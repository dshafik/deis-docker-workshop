---
title: "Deploying using Docker Images"
layout: "post"
generator: pagination
use:
- posts
---

You can also deploy fully-backed Docker images — for examples those created by your continuous integration system.

Images **must** be pushed to Docker hub (or a private registry) prior to deployment on Deis.

> **Note:** support for Docker registry authentication is coming soon. This means your image _must_ be public.

## Build and Push The Image

```sh
$ docker build -t <username>/<image> .
$ docker push <username>/<image> .
```

## Deploying to Deis

To deploy, we must first create an application on the controller, which requires a local working directory:

```sh
$ mkdir -p /tmp/app-name
$ cd /tmp/app-name
$ deis create
```

> **Note:** The deis client uses the name of the current directory as the default app name.

Then you can have Deis simply pull the image and deploy it:

```sh
$ deis pull <username>/<image>
```

## Scaling

Because you are using a Docker image it will scale the `CMD` process to 1. To increase this use:

```sh
deis scale cmd=3
```