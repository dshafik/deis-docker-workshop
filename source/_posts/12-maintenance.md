---
title: "Tasks"
layout: "post"
generator: pagination
use:
- posts
---

Best practices (12-factor) tell us that we should run maintenance and deployment
tasks — such as database migrations — as one-off processes. Deis allows you to do this easily using `deis run`.

The `deis run` command will spin up a new container (`web` or `cmd` process) in which it will run the given command, and then the container will be destroyed.

We use `deis run` like so:

```sh
$ deis run <cmd>
```

For example, if we want to run a rake migration, we might use:

```sh
$ deis run rake db:migrate
```
