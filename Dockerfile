FROM ruby:3-bullseye
RUN apt-get update -y \
  && apt-get install -y libpq-dev
