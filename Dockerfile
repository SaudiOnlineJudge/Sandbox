FROM ubuntu:22.04

LABEL author="Muaath Alqarni"

ENV SANDBOX_VERSION=0.1-beta

RUN command

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

RUN apt-get update

RUN apt install time

# Compilers
RUN apt-get install -y g++ gcc
# Interpreters
# RUN apt-get install -y python2 python3 openjdk-8-jdk

RUN apt-get upgrade -y

# Rust Installation
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN echo 'source $HOME/.cargo/env' >> $HOME/.bashrc 

COPY runlang /usr/local/bin/runlang
RUN chmod +x /usr/local/bin/runlang

COPY code.sh ${HOME}
RUN chmod +x ${HOME}/code.sh

COPY checker.sh ${HOME}
RUN chmod +x ${HOME}/checker.sh