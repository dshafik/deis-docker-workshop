FROM ubuntu:wily

RUN apt-get update
RUN apt-get install -y -q php5-cli

ADD . /site

WORKDIR /site
CMD /site/sculpin generate --server

EXPOSE 8000
