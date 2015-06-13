---
title: "Setting Up Deis"
layout: "post"
generator: pagination
use:
- posts
---

Now, we have the a cluster of CoreOS instances and a domain we can use to access the cluster. It's time
to actually setup Deis on the hosts.

We'll need one of the public IPs of our instances (these were output by the provision script). Any
one will do. Then, we set an environment variable so our local `deisctl` knows who to talk to:

```sh
$ export DEISCTL_TUNNEL=<instance-IP>
```

We also provide the SSH key we used to provision the hosts. This is used by the `deis run` command
to log into the host machine and schedule one-off tasks:

```sh
$ deisctl config platform set sshPrivateKey=~/.ssh/deis-$USER
```

Now, we need to have `deisctl` tell our CoreOS cluster what our domain will be. Note that this is
the domain one level above what the apps will be called (i.e. the domain we set here is
`<elb-IP>.xip.io`, and our apps will be `app-name.<elb-IP>.xip.io`).

```console
$ deisctl config platform set domain=<elb-IP>.xip.io
```

*Finally*, we can install and start the platform. This will take about 20 minutes for the platform
to fully start, as it's pulling each component's Docker image from Docker Hub.

```console
$ deisctl install platform
$ deisctl start platform
```

What exactly did this do? `deisctl` talked to [fleet](https://github.com/coreos/fleet), the CoreOS cluster scheduler, and asked it to run the Deis components on the cluster. We can use `deisctl list` to see on which hosts  the components ended up.
