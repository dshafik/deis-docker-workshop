# Contributing

> **Note:** *Do not* submit pull-requests against the `gh-pages` branch

It's super easy to contribute, all you need is some Markdown knowledge.

## Forking

You should be working in a fork, see the [following documentation](https://help.github.com/articles/fork-a-repo/)

## Before Making Any Changes

### Fetch The Latest Changes from upstream

> On the `master` branch

```sh
$ git fetch --all
$ git rebase upstream/master
```

### Create a New Branch

```sh
$ git checkout -b reason-for-changes
```

### Install Sculpin

In order to test your edited or new examples, you'll need to have Sculpin installed
in your dev environment. Please see the [Sculpin "Get Started"](https://sculpin.io/getstarted/) guide
for installation instructions.

## Editing an Existing Page:


Find the file in `source/_posts`, e.g. `1-install.md` and edit using Markdown.


## Creating a New File

Files are named with a numeric prefix to indicate their ordering in the table
of contents. 

Create a new file in `source/_posts` with the correct numeric prefix (e.g. `13-whats-next.md`)

Each file starts with the meta-data:

```yaml
---
title: "Page Title Here"
layout: "post"
generator: pagination
use:
- posts
---
```

- title: The title of the page
- layout: The layout to use (always post)

The last three lines are required to make the page show the Table of Contents.

## Testing Your Changes

In the root directory, to test run:

```sh
$ sculpin generate --watch --server
```
Then visit <http://localhost:8000>


## After Making Your Changes

### Commit Your Changes

```sh
$ git add source/_posts/FILE.md
$ git commit -m "DESCRIPTION OF CHANGES"
$ git push origin master
```


## Publishing Your Changes

> **Note:** You should only do this to test, you should not perform pull-requests against this branch.

In the root directory, to publish run:

```sh
$ ./publish.sh "COMMIT MESSAGE HERE"
```

## Pushing Changes Back Upstream

To contribute your changes back, simply perform a [Pull Request](https://help.github.com/articles/using-pull-requests/) against the master branch.
