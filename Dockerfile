FROM ubuntu:wily

RUN apt-get update
RUN apt-get install -y -q php5-cli php5-curl git

ADD . /site

WORKDIR /site
RUN /site/sculpin install
CMD /site/sculpin generate --server

EXPOSE 8000
