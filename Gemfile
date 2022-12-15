# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

### (-: Boot large ruby/rails apps faster :-)
ruby '~> 3.0.0'

gem 'rails', '~> 7'

#postgresql
gem 'pg'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.6'

#Fast redirect link
gem 'turbolinks'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'
gem 'sass-rails'

#If big project and more assets, you can use alternative sassc-rails (building lang C) Fasterer 4x
#gem 'sassc-rails'

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem 'jsbundling-rails'

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem 'cssbundling-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# theme style
gem 'bootstrap', '~> 4.6'
gem 'font-awesome-rails'
gem 'slim'

# tree date
gem 'ancestry'
gem 'cocoon'

# authorize
gem 'cancancan'
gem 'devise'
gem 'doorkeeper'

# oauth2
gem 'omniauth'
gem 'omniauth-github'
gem 'omniauth-rails_csrf_protection'

# localize
gem 'rails-i18n'

# serializer json
gem 'active_model_serializers'
gem 'oj'
gem 'responders'

# importer xlsx
gem 'activerecord-import'
gem 'roo'

# admin dashboard
gem 'rails_admin'
gem 'rails_admin_nestable'

# api docs
gem 'rswag'

# job
gem 'redis-rails'
gem 'sidekiq', '~> 6'
gem 'sinatra', require: false
gem 'whenever', require: false

# Search
gem 'mysql2',          '~> 0.5', :platform => :ruby
gem 'jdbc-mysql',      '= 8.0.27',  :platform => :jruby
gem 'thinking-sphinx', '~> 5.4'
gem 'multi_json'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]

  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
end

group :development do
  gem 'bullet'

  gem 'listen'
  gem 'web-console'

  gem 'rubocop', require: false
  gem 'rubocop-i18n', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'capybara'
  gem 'chromedriver-helper'
  gem 'launchy'
  gem 'selenium-webdriver'

  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
end
gem "sassc-rails"
gem "sassc-rails"
gem "sassc-rails"
gem "sassc-rails"
