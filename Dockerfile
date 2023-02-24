FROM ruby:3.0

# -qq = Dont show log without error.
RUN apt-get update -qq && \ 
    apt-get install -y vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# bundler install
RUN gem install bundler

# create requied dir
RUN mkdir /home/src && \
    mkdir -p /home/tmp/logs

ADD ./src/Gemfile /home/src/Gemfile

RUN cd /home/src && \
    bundle install
