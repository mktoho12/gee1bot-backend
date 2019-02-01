FROM ruby:2.6.0

WORKDIR /app

RUN apt-get update && \
    apt-get install -y nodejs \
                       postgresql-client \
                    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

COPY Gemfile /app
COPY Gemfile.lock /app

RUN bundle install

CMD bundle exec rails server -b 0.0.0.0
