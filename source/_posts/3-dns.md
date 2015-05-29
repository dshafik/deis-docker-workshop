---
title: "Configuring DNS"
layout: "post"
generator: pagination
use:
- posts
---

We'll need to configure DNS to point to our Deis cluster.

Normally we would use a real domain name and create an appropriate DNS record for Deis, but for this workshop
we will fake it by using [xip.io](http://xip.io) and one of the IP addresses for the ELB.

The ELB hostname can be found in the output of the `./provision-ec2-cluster.sh` command, and will look like
`deis-DeisWebELB-<id>.us-east-1.elb.amazonaws.com`.

## Using a custom domain

To setup a custom domain for real-world usage, you simply point a CNAME record to the ELB, for example `lb.example.org`.

```sh
$ dig lb.example.org CNAME +short
deis-deiswebelb-<id>.us-east-1.elb.amazonaws.com.
```

## Using xip.io

[xip.io](http://xip.io) is a free service that automatically resolves `some-string.<IP>.xip.io`
to the IP in the hostname.

While it's not recommended to create A records for AWS ELBs, as the actual IPs can
change, for short-lived clusters, this should work just fine. First, we need to get an
IP for our ELB:

```sh
$ host deis-deiswebelb-<id>.us-east-1.elb.amazonaws.com
deis-deiswebelb-<id>.us-east-1.elb.amazonaws.com has address <ip>
deis-deiswebelb-<id>.us-east-1.elb.amazonaws.com has address <ip>
```

Then, we can compose a domain as `some-string.<elb-IP>.xip.io`. For example:

```console
$ dig <some-string>.<elb-IP>.xip.io A +short
<ip>
```

We also provide the SSH key we used to provision the hosts. This is used by the `deis run` command
to log into the host machine and schedule one-off tasks:

```sh
$ deisctl config platform set sshPrivateKey=~/.ssh/deis-$USER
```
