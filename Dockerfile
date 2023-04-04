FROM ubuntu:22.04

ARG UID=50000

# -qq = Dont show log without error.
RUN apt-get update \
    && apt-get install -y vim \
      # ruby install
      ruby-full \
      # require gem install
      make \
      build-essential \
      libssl-dev \
      libffi-dev \
      python3-dev \
    && apt-get clean  \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/gpt-chatbot/workspace

# install bundler
RUN gem install bundler

# create requied dir
RUN mkdir ./src && \
    cd ./src

ADD ./src/Gemfile ./Gemfile

RUN bundle install

RUN useradd -U -u $UID -m gpt-chatbot -s /bin/bash

USER gpt-chatbot