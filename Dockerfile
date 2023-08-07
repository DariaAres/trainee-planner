FROM ruby:3.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /list
WORKDIR /list
ADD Gemfile /list/Gemfile
ADD Gemfile.lock /list/Gemfile.lock
RUN bundle install --gemfile /list/Gemfile
