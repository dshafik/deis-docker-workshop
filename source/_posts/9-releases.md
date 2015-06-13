---
title: "Managing Releases"
layout: "post"
generator: pagination
use:
- posts
---

Each time you deploy an application to Deis, or change it's configuration, a new release is created and deployed.

You can review these releases using `deis releases`:

```sh
$ deis releases
=== <random>-<words> Releases
v4      3 minutes ago                     $USER deployed <sha1>
v3      1 hour 17 minutes ago             $USER added DATABASE_HOST
v2      6 hours 2 minutes ago             $USER deployed <sha1>
v1      6 hours 2 minutes ago             $USER deployed $USER/repo
```

## Rollbacks

You can rollback to any previous release using `deis rollback`. This will create a new release using the previous release:

```sh
$ deis rollback v2
Rolled back to v2

$ deis releases
=== <random>-<words> Releases
v5      Just now                          $USER rolled back to v2
v4      3 minutes ago                     $USER deployed <sha1>
v3      1 hour 17 minutes ago             $USER added DATABASE_HOST
v2      6 hours 2 minutes ago             $USER deployed <sha1>
v1      6 hours 2 minutes ago             $USER deployed $USER/repo
```

