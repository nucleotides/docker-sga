FROM debian:wheezy
MAINTAINER Michael Barton, mail@michaelbarton.me.uk

ENV PACKAGES bamtools zlib1g-dev libsparsehash-dev wget
ENV TAR https://github.com/jts/sga/archive/v0.10.13.tar.gz
ENV DIR /tmp/sga

RUN echo "deb http://http.us.debian.org/debian testing main" > /etc/apt/sources.list
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends ${PACKAGES}

RUN mkdir ${DIR}
RUN cd ${DIR} && \
    wget ${TAR} --no-check-certificate --output-document - \
    | tar xzf - --directory . --strip-components=1


ADD run run
