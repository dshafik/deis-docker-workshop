---
title: "Cleaning Up"
layout: "post"
generator: pagination
use:
- posts
---

When you are ready to shutdown your Deis cluster, simply issue:

```sh
$ aws cloudformation delete-stack --stack-name deis
```
