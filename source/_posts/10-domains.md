---
title: "Custom Domains"
layout: "post"
generator: pagination
use:
- posts
---

It is possible to use a custom domain with your application. To do this, use the `deis domains` command.

## Adding a Domain

To add a domain use `deis domains:add`:

```sh
$ deis domains:add example.org
Adding example.org to <random>-<words>... done
```

You should then create a `CNAME` record pointing to the original deis assigned domain.

## Removing a Domain

To remove a domain, use `deis domain:remove`:

```sh
$ deis domains:remove
```

## Reviewing Domains

You can review all current domains using `deis domains:list`.

```sh
$ deis domains:list
```