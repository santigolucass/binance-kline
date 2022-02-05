FROM ruby:3.0.0-alpine

ENV PYTHONUNBUFFERED=1
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
      python3 \
      tzdata \
      yarn && ln -sf python3 /usr/bin/python

RUN python3 -m ensurepip

RUN pip3 install --no-cache --upgrade pip setuptools

RUN gem install bundler

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle install

COPY package.json yarn.lock ./

RUN yarn install --check-files

COPY . ./

ENTRYPOINT ["./entrypoint.sh"]
