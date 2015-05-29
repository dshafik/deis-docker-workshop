---
title: "Scaling Containers"
layout: "post"
generator: pagination
use:
- posts
---
Let's try scaling up more containers of our app. Pick either the Ruby or PHP application
and `cd` into the application directory. Then we can scale using the `deis scale` command:

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
