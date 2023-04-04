FROM ruby:3.0

ARG UID=50000

# -qq = Dont show log without error.
RUN apt-get update -qq && \ 
    apt-get install -y vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -U -u $UID -m gpt-chatbot -s /bin/bash

USER gpt-chatbot

WORKDIR /home/gpt-chatbot/workspace

# install bundler
RUN gem install bundler

# create requied dir
RUN mkdir ./src && \
    cd ./src

ADD ./src/Gemfile ./Gemfile

RUN bundle install
