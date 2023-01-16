# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

### (-: Boot large ruby/rails apps faster :-)
ruby '2.7.0'

<<<<<<< HEAD
gem 'bootsnap', '~> 1.7', require: false
gem 'pg', '~> 0.18'
gem 'puma', '~> 5.6'
gem 'rails', '~> 5.2.6'
gem 'turbolinks', '~> 5'

# additional format suport
gem 'jquery-rails', '~> 4.4.0'
gem 'sass-rails', '~> 5.0'

# minimize js
gem 'uglifier', '~> 4.2.0'
# gem 'mini_racer', '~> 0.6'

# theme style
gem 'bootstrap', '~> 4.6'
gem 'font-awesome-rails', '~> 4'
gem 'slim', '~> 4.1'

# tree date
=======
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.8', '>= 5.2.8.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails', '~> 4.4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Slim templates generator for Rails
gem 'slim', '~> 4.1'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

#database use
gem 'pg', '~> 1.4.5'

# lib css, font
gem 'bootstrap', '~> 4.6'
gem 'font-awesome-rails', '~> 4'

# tree views
>>>>>>> ca8170c5bcc79d6cf8b14e3aca0e95b86eb60666
gem 'ancestry', '~> 4'
gem 'cocoon', '~> 1.2.15'

# authorize
gem 'cancancan', '~> 3.2'
gem 'devise', '~> 4.8'
gem 'doorkeeper', '5.1.0'

# oauth2
gem 'omniauth', '~> 2.0'
gem 'omniauth-github', '~> 2.0'
gem 'omniauth-rails_csrf_protection', '~> 1.0'

# localize
gem 'rails-i18n', '~> 5'

# serializer json
gem 'active_model_serializers', '~> 0.10'
gem 'oj', '~> 3.11'
gem 'responders', '~> 3'

# importer xlsx
gem 'activerecord-import', '~> 1.1'
gem 'roo', '~> 2.8'

# admin dashboard
gem 'rails_admin', '~> 2'
gem 'rails_admin_nestable', '~> 0.3'

# api docs
gem 'rswag', '~> 2'

# job
gem 'redis-rails', '~> 5'
gem 'sidekiq', '~> 6'
gem 'sinatra', '2.2.0', require: false
gem 'whenever', '~> 1.0', require: false

# Search
gem 'mysql2', '~> 0.5'
gem 'thinking-sphinx', '~> 5.4'

group :development, :test do
<<<<<<< HEAD
  gem 'byebug', '~> 11', platforms: %i[mri mingw x64_mingw]
=======
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
>>>>>>> ca8170c5bcc79d6cf8b14e3aca0e95b86eb60666

  gem 'factory_bot_rails', '~> 6'
  gem 'faker', '~> 2'
  gem 'rspec-rails', '~> 5'
end

group :development do
  gem 'bullet', '~> 6'

<<<<<<< HEAD
  gem 'listen', '~> 3.7'
  gem 'spring', '~> 2.1.1'
  gem 'spring-watcher-listen', '~> 2.0.1'
  gem 'web-console', '~> 3.7.0'
=======
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  
>>>>>>> ca8170c5bcc79d6cf8b14e3aca0e95b86eb60666

  gem 'rubocop', '~> 1.16', require: false
  gem 'rubocop-i18n', '~> 3.0', require: false
  gem 'rubocop-performance', '~> 1.13', require: false
  gem 'rubocop-rails', '~> 2.13', require: false
  gem 'rubocop-rspec', '~> 2.8', require: false
end

group :test do
<<<<<<< HEAD
  gem 'capybara', '~> 3'
  gem 'chromedriver-helper', '~> 2'
  gem 'launchy', '~> 2'
  gem 'selenium-webdriver', '~> 3'

  gem 'rails-controller-testing', '~> 1'
  gem 'shoulda-matchers', '~> 4'

  gem 'database_cleaner', '~> 2'
  gem 'database_cleaner-active_record', '~> 2'
  gem 'database_cleaner-core', '~> 2'
end

group :production do
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
=======
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'

  gem 'launchy', '~> 2'
  gem 'rails-controller-testing', '~> 1'
  gem 'shoulda-matchers', '~> 4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
>>>>>>> ca8170c5bcc79d6cf8b14e3aca0e95b86eb60666
