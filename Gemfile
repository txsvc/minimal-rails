# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 3.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.8'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.6'

# mini-app application gems
gem 'high_voltage', '~> 3.1'

# for deployment on Google App Engine
# gem 'appengine'

gem 'omniauth-github', github: 'omniauth/omniauth-github', branch: 'master'
gem 'omniauth-google-oauth2', '~> 1.1'
gem 'omniauth-discord'
gem 'omniauth-rails_csrf_protection'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"

  # Automatic Rails code style checking tool
  gem 'rubocop', require: false
  # A collection of RuboCop cops to check for performance optimizations in Ruby code
  gem 'rubocop-performance', require: false
  # Automatic Rails code style checking tool
  gem 'rubocop-rails', require: false
  # Code style checking for RSpec files
  gem 'rubocop-rspec', require: false
end
