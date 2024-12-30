ARG TARGETPLATFORM
FROM --platform=$TARGETPLATFORM ruby:3.2

WORKDIR /usr/src/app

# Install curl and any other needed tools
RUN apt-get update && apt-get install -y \
  curl \
  bash \
  build-essential \
  && rm -rf /var/lib/apt/lists/*

COPY Gemfile /usr/src/app/Gemfile

RUN bundle install

WORKDIR /site

EXPOSE 4000
EXPOSE 35729

CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--livereload"]
