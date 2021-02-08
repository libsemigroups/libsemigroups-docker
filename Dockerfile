FROM ubuntu:bionic

MAINTAINER James D. Mitchell <jdm3@st-andrews.ac.uk>

ENV LIBSEMIGROUPS_VERSION 1.3.6

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq \
  && apt-get install -y \
  automake \
  autoconf \
  build-essential \
  curl \
  git \
  libtool \
  m4 \
  pkg-config \
  sudo 

RUN adduser --quiet --shell /bin/bash --gecos "libsemigroups user,101,," --disabled-password libsemigroups \
    && adduser libsemigroups sudo \
    && chown -R libsemigroups:libsemigroups /home/libsemigroups/ \
    && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers \
    && cd /home/libsemigroups \
    && touch .sudo_as_admin_successful

RUN curl -L -O https://github.com/libsemigroups/libsemigroups/releases/download/v${LIBSEMIGROUPS_VERSION}/libsemigroups-${LIBSEMIGROUPS_VERSION}.tar.gz \
    && tar -xf libsemigroups-${LIBSEMIGROUPS_VERSION}.tar.gz \
    && rm libsemigroups-${LIBSEMIGROUPS_VERSION}.tar.gz \
    && cd libsemigroups-${LIBSEMIGROUPS_VERSION} \
    && ./configure --disable-hpcombi --disable-eigen \
    && make -j4 \
    && sudo make install \
    && cd / \
    && rm -rf libsemigroups-${LIBSEMIGROUPS_VERSION}

USER libsemigroups

ENV HOME /home/libsemigroups

WORKDIR home/libsemigroups

