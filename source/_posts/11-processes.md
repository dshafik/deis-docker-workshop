---
title: "Custom Processes"
layout: "post"
generator: pagination
use:
- posts
---

By default, Deis supports two processes, which it will automatically start when the container is deployed:

1. `web` — for applications deployed using a buildpack
2. `cmd` - for applications deployed using a `Dockerfile` or docker image

You can also specify your own processes, that can then be started, and scaled independently. This is done by adding a `Procfile` in the root of your application.

## Creating New Processes

To create a new process type, you simply define it in the `Procfile`, using the following pattern:

```yaml
<process name>: <command>
```

For example, we could add a process type that will run a task workers within our codebase:

```yaml
processor: python /workers/process-files.py
translator: ruby /workers/translate-file.py
```

## Starting & Scaling Processes

To start or scale a process, we use the `deis scale` command. We can run any different number of instances of each process type.

```sh
$ deis scale processor=2 translator=4
```

## Restarting Processes

To restart processes use `deis ps:restart`. 

To restart all processes of a given type use:

```sh
$ deis ps:restart web
Restarting processes... but first, coffee!
done in 14s
=== <random>-<words> Processes

--- web:
web.1 up (v2)
web.2 up (v2)
web.3 up (v2)
```

To restart a single process simply specify it's number:

```sh
$ deis ps:restart web.1
Restarting processes... but first, coffee!
done in 11s
=== <random>-<words> Processes

--- web:
web.1 up (v2)
web.2 up (v2)
web.3 up (v2)
```

## Monitoring Processes

You can see what is currently running on the cluster using `deis ps`:

```sh
$ deis ps

=== <random>-<words> Processes

--- web:
web.1 up (v2)
web.2 up (v2)
web.3 up (v2)
processor.1 up (v2)
processor.2 up (v2)
translator.1 up (v2)
translator.2 up (v2)
translator.3 up (v2)
translator.4 up (v2)
```


