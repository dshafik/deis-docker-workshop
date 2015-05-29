---
title: "Deploying Applications"
layout: "post"
generator: pagination
use:
- posts
---

Deis supports deployment via [Heroku Buildpacks](https://devcenter.heroku.com/articles/buildpacks), 
[Dockerfiles](https://docs.docker.com/reference/builder/), and [Docker Images](https://docs.docker.com/introduction/understanding-docker/).

There are Heroku buildpacks available for common setups for many different languages. Deis will automatically recognize
the appropriate buildpack to use based on the contents of your repository.

Supported buildpacks are:

- [Ruby](https://github.com/heroku/heroku-buildpack-ruby)
- [Node.js](https://github.com/heroku/heroku-buildpack-nodejs)
- [Clojure](https://github.com/heroku/heroku-buildpack-clojure)
- [Python](https://github.com/heroku/heroku-buildpack-python)
- [Java](https://github.com/heroku/heroku-buildpack-java)
- [Gradle](https://github.com/heroku/heroku-buildpack-gradle)
- [Grails](https://github.com/heroku/heroku-buildpack-grails)
- [Scala](https://github.com/heroku/heroku-buildpack-scala)
- [Play](https://github.com/heroku/heroku-buildpack-play)
- [PHP](https://github.com/heroku/heroku-buildpack-php)
