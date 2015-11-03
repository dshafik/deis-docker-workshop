FROM ubuntu:wily

RUN apt-get update -qq
RUN apt-get install -y -q ruby ruby-dev ruby-posix-spawn python-pygments git build-essential nodejs
RUN gem install -V rdiscount jekyll

RUN git clone https://github.com/maciakl/Sample-Jekyll-Site.git blog
WORKDIR blog

EXPOSE 4000

CMD ["jekyll", "serve", "-H", "0.0.0.0"]
