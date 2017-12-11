FROM ruby:2.4.1
RUN mkdir /code
WORKDIR /code
RUN gem install jekyll
ADD . /code 
