
FROM ruby:3.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs build-essential libpq-dev

# Set working directory
WORKDIR /devapp

# Copy Gemfile and Gemfile.lock (only these files initially for better Docker caching)
COPY Gemfile Gemfile.lock ./

# Install gems and precompile assets
RUN gem install bundler:2.5.22 && bundle install

# Copy the rest of the application
COPY . .

# Expose port 4000
EXPOSE 4000

# Run Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "4000"]





