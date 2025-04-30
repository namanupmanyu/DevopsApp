FROM ruby:3.2


RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /devapp

COPY . .


RUN gem install bundler:2.5.22 && \
    bundle install && \
    bundle exec rails assets:precompile


EXPOSE 4000


CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "4000"]




