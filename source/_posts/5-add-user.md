---
title: "Creating a User"
layout: "post"
generator: pagination
use:
- posts
---

To deploy applications to the Deis cluster, you must first register a user with the controller.

This is done using the `deis register` command.

To register, you must supply the controller address. The first account registered will
be granted super user priviledges.

The controller address is always `http://deis.<domain>`, where `<domain>` is the value
 we supplied to `deisctl config platform set domain=` when setting up Deis (e.g. `<elb-IP>.xip.io`).

```sh
$ deis register http://deis.<elb-IP>.xip.io
username: <username>
password:
password (confirm):
email: <email>
Registered <username>
Logged in as <username>
```

## Deploying via git

If you plan on using `git push` to deploy applications to Deis, you must provide your SSH public key. 

Use the `deis keys:add` command to upload your default SSH public key:

```sh
$ deis keys:add
Found the following SSH public keys:
1) id_rsa.pub
Which would you like to use with Deis? 1
Uploading /Users/myuser/.ssh/id_rsa.pub to Deis... done
```
