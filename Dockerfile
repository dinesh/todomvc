FROM ruby:alpine

RUN apk add --update build-base libffi-dev

ENV APP /root/app
ADD Gemfile $APP/
ADD Gemfile.lock $APP/

RUN cd $APP && bundle install --without test development

ADD . $APP
WORKDIR $APP

EXPOSE 9292
CMD ["bundle", "exec", "inesita", "server"]