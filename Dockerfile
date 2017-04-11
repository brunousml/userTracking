FROM ruby:latest
MAINTAINER Bruno Melo <brunousml@gmail.com>

### Install some libs
RUN apt-get install -y apt-utils

RUN apt-get update -qq \
    && apt-get upgrade -qq

RUN apt-get install -y apt-utils build-essential libpq-dev nodejs

### Copy App
RUN mkdir /DashboardUserTracking
WORKDIR /DashboardUserTracking
COPY . /DashboardUserTracking

### Install Dependencies
RUN bundle install

# Finish setup
EXPOSE 3000
CMD rails server -b 0.0.0.0 -p 3000