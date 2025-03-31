#!/usr/bin/env bash
# exit on error
set -o errexit

# Install dependencies
bundle install

# Create database directory if it doesn't exist
mkdir -p /tmp

# Run database migrations
RACK_ENV=production bundle exec rake db:migrate 