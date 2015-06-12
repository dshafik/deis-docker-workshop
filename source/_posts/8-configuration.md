---
title: "Application Configuration"
layout: "post"
generator: pagination
use:
- posts
---

All configuration for applications should be set using the environment. This is done using `deis config`.

Each change to the configuration will result in a new deployment.

## Setting Environment Variables

To set an environment variable, use the `deis config:set` command:

```sh
$ deis config:set DATABASE_USER=myapp
$ deis config:set DATABASE_PASSWORD=mypassword
$ deis config:set DATABASE_HOST=my.db.host
```

To minimize the number of deployments, you should attempt to set multiple environment variables at the same time:

```sh
$ deis config:set DATABASE_USER=myapp DATABASE_PASSWORD=mypassword DATABASE_HOST=my.db.host
```

## Using Environment Files

Lastly, you can use a `.env` file to store your environment settings. You can easily create a `.env` file from the existing configuration using `deis config:pull`:

```sh
$ deis config:pull
```

This will create an `.env` file containing the current environment, for example:

```ini
DATABASE_USER=myapp
DATABASE_PASSWORD=mypassword
DATABASE_HOST=my.db.host
```

You can (create or) make changes to this file and deploy them using `deis config:push`:

```sh
$ echo "MEMCACHE_HOST=localhost:11211"
$ deis config:push

Creating config... done, v#

=== <random>-<words>
DEIS_APP: <random>-<words>
DATABASE_USER=myapp
DATABASE_PASSWORD=mypassword
DATABASE_HOST=my.db.host
MEMCACHE_HOST=localhost:11211
```

This will _merge_ the config with the existing environment.

## Reviewing Configuration

You can easily review the configuration using `deis config:list`.

## Deleting Environment Variables

To remove an environment variable, we can use `deis config:unset`. As with `deis config:set` you should specify multiple variables to minimize deployments.

```sh
$ deis config:unset DATABASE_USER DATABASE_PASSWORD DATABASE_HOST
```

> **Note:** If you set the variable using `.env` previously, remember to remove it from the file too
