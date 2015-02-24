FROM groovenauts/ruby:2.2.0-rc1
MAINTAINER m-shiramizu@groovenauts.jp
 
ENV RAILS_ENV production
 
ADD . /usr/src/app
WORKDIR /usr/src/app
VOLUME /usr/src/app/log
 
RUN bundle install --system
 
CMD ["bundle", "exec", "magellan-rails"]
