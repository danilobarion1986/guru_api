FROM ruby:2.5.3
MAINTAINER Vagas.com

RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends vim nodejs postgresql-client \
      locales freetds-dev

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN export LC_ALL="en_US.utf8"

RUN mkdir -p /opt/vagas/requisicao_service

ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle install
RUN gem install bundler-audit

WORKDIR /opt/vagas/requisicao_service
ADD . /opt/vagas/requisicao_service
