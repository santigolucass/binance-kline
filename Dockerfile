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

COPY Gemfile Gemfile.lock ./

# RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

COPY package.json yarn.lock ./

RUN yarn install --check-files

COPY . ./

ENTRYPOINT ["./entrypoint.sh"]
