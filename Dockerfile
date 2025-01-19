# Dockerfile
FROM ruby:3.3.5

# Install any necessary dependencies
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    nodejs \
    vim \
    git \
    curl \
    && apt-get clean

# Set working directory inside the container
WORKDIR /app

# Ensure bundler is up-to-date
RUN gem install bundler

# Default command keeps the container running
CMD ["tail", "-f", "/dev/null"]
