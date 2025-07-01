ARG RUBY_VERSION=2.7.1
FROM registry.docker.com/library/ruby:$RUBY_VERSION-slim-buster AS base
RUN apt-get update && apt-get install -y --no-install-recommends curl npm nano

RUN curl -fsSL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get update \
    && apt-get install --no-install-recommends -y nodejs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ENV RAILS_ENV="development" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle"

RUN npm install -g yarn@^1.22.0

FROM base AS build

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential git libpq-dev pkg-config shared-mime-info \
    && rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git

COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile --non-interactive --silent

COPY . .

RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

FROM base

RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl postgresql-client && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /app /app

RUN useradd rails --no-create-home --shell /bin/bash && \
    chown -R rails:rails db log tmp
USER rails:rails

ENTRYPOINT ["/app/bin/docker-entrypoint"]

EXPOSE 3000
CMD ["./bin/rails", "server"]