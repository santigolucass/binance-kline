FROM ruby:3.0.0-alpine

RUN apk add --update --no-cache \
      build-base \
      file \
      git \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      nodejs \
      postgresql-dev \
      tzdata \
      yarn

RUN gem install bundler

WORKDIR /app

COPY . ./

RUN chmod +x /app/entrypoint.sh

RUN bundle check || bundle install
RUN yarn install --check-files

ENTRYPOINT [ "bundle", "exec" ]
