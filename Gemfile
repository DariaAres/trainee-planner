# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.6'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.5'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'image_processing', '~> 1.2'

# Comes with installation support for bundling and processing your CSS. [https://github.com/rails/cssbundling-rails]
gem 'cssbundling-rails'

# Set up esbuild, rollup, or webpack to allow bundling. [https://github.com/rails/jsbundling-rails]
gem 'jsbundling-rails'

# Devise is a flexible authentication solution for Rails based on Warden. [https://github.com/heartcombo/devise]
gem 'devise'

# Centralization of locale data collection for Ruby on Rails. [https://github.com/svenfuchs/rails-i18n]
gem 'rails-i18n'

# Validations for Active Storage (presence) [https://github.com/igorkasyanchuk/active_storage_validations]
gem 'active_storage_validations'

# The most popular HTML, CSS, and JavaScript framework. [https://github.com/twbs/bootstrap-rubygem]
gem 'bootstrap'

# Paginator for modern web app frameworks and ORMs. [https://github.com/kaminari/kaminari]
gem 'kaminari'

# Httparty can be used to query web services and examine the resulting output. [https://github.com/jnunemaker/httparty]
gem 'httparty'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]

  # rspec-rails is a testing framework for Rails 5+. [https://github.com/rspec/rspec-rails/tree/6-0-maintenance]
  gem 'rspec-rails'
  # A Ruby gem to load environment variables from `.env` [https://github.com/bkeepers/dotenv]
  gem 'dotenv-rails'

  # A fixtures replacement with a straightforward definition syntax [https://github.com/thoughtbot/factory_bot_rails]
  gem 'factory_bot_rails'

  # Pry is a runtime developer console and IRB alternative with powerful introspection capabilities. [https://github.com/pry/pry]
  gem 'pry', '~> 0.14.2'

  # It's a library for generating fake data such as names, addresses, and phone numbers. [https://github.com/faker-ruby/faker]
  gem 'faker'

  # Capybara helps you test web applications by simulating how a real user would interact with your app. [https://github.com/teamcapybara/capybara]
  gem 'capybara'

end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # RuboCop is a Ruby static code analyzer (a.k.a. linter) and code formatter. [https://github.com/rubocop/rubocop]
  gem 'rubocop', require: false

  # A RuboCop extension focused on enforcing Rails best practices and coding conventions. [https://github.com/rubocop/rubocop-rails]
  gem 'rubocop-rails', require: false

  # RSpec-specific analysis for your projects, as an extension to RuboCop. [https://github.com/rubocop/rubocop-rspec]
  gem 'rubocop-rspec', require: false

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Strategies for cleaning databases using ActiveRecord. [https://github.com/DatabaseCleaner/database_cleaner]
  gem 'database_cleaner-active_record'

  # Simple One-Liner Tests for Rails. [https://github.com/thoughtbot/shoulda-matchers]
  gem 'shoulda-matchers'

  # SimpleCov is a code coverage analysis tool for Ruby. [https://github.com/simplecov-ruby/simplecov]
  gem 'simplecov', require: false

  # Brings back assigns to your controller tests, assert_template. [https://github.com/rails/rails-controller-testing]
  gem 'rails-controller-testing'
  # Selenium implements the W3C WebDriver protocol to automate popular browsers. [https://github.com/SeleniumHQ/selenium/wiki/Ruby-Bindings]
  gem 'selenium-webdriver', '~> 4.4'

  # Run Selenium tests more easily with automatic installation and updates for all supported webdrivers. [https://github.com/titusfortner/webdrivers]
  gem 'webdrivers', '~> 5.0'
end
