---
title: "Deploying to AWS"
layout: "post"
generator: pagination
use:
- posts
---

The Deis project has community-contributed provision scripts for various providers in the deis `contrib`
directory. These provision scripts provision a cluster of CoreOS machines (3 by default) with some
system tweaks for Deis. We also configure things like EBS volumes and their mount points, install
some helper scripts, etc.

First, we need to tell Deis to use our key. Edit `contrib/aws/cloudformation.json` to confirm the key:

```javascript
[
    {
        "ParameterKey":     "KeyPair",
        "ParameterValue":   "deis"
    }
]
```

We should also add it to our local SSH agent so it's offered when we try to log into the machines:

```sh
$ ssh-add ~/.ssh/deis-$USER
```

Generate a new discovery URL and deploy the deis cluster:

```sh
$ make discovery-url
$ cd contrib/aws
$ ./provision-aws-cluster.sh deis
Creating CloudFormation stack deis
{
    "StackId": "arn:aws:cloudformation:us-east-1:69326027886:stack/deis/<UUID>"
}
Waiting for instances to be provisioned (CREATE_IN_PROGRESS, 600s) ...
Waiting for instances to be provisioned (CREATE_IN_PROGRESS, 590s) ...
Waiting for instances to be provisioned (CREATE_COMPLETE, 580s) ...
Waiting for instances to pass initial health checks (600s) ...
Waiting for instances to pass initial health checks (590s) ...
Waiting for instances to pass initial health checks (580s) ...
Instances are available:
<id>  <ip>    <instance type>        <region>      running
<id>  <ip>    <instance type>        <region>      running
<id>  <ip>    <instance type>        <region>      running
Using ELB <elb URL>
Your Deis cluster has been successfully deployed to AWS CloudFormation and is started.
Please continue to follow the instructions in the documentation.
Enabling proxy protocol
1
```

At this point you have a CoreOS cluster deployed in AWS CloudFormation.

> **Note:** you may wish to copy down the instance details for future reference
