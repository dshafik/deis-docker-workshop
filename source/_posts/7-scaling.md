---
title: "Scaling Containers"
layout: "post"
generator: pagination
use:
- posts
---

Let's try scaling up more containers of our app. Pick any application currently deployed to the Deis cluster
and `cd` into the application directory. Then we can scale using the `deis scale` command.

## Buildpacks

If the application was deployed using a buildpack, we want to scale the `web` processes:

```sh
$ deis scale web=3
Scaling processes... but first, coffee!
done in 133s
=== <random>-<words> Processes

--- web:
web.1 up (v2)
web.2 up (v2)
web.3 up (v2)
```

If we refresh our browser a few times, we see three containers responding to traffic.


## Dockerfiles and Docker Images

When using a `Dockerfile` or Docker image, deis will scale the `CMD` process to 1. To increase this use:

```sh
deis scale cmd=3
```