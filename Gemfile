# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

### (-: Boot large ruby/rails apps faster :-)
ruby '2.7.0'

gem 'bootsnap', '~> 1.7', require: false
gem 'puma', '~> 5.6'
gem 'rails', '~> 5.2'
gem 'pg', '~> 1.4.5'
gem 'turbolinks', '~> 5'

#Assets precompile
gem 'sprockets', '~> 4.0'
gem 'jquery-rails', '~> 4.4.0'
gem 'sass-rails', '~> 6'

# minimize js
gem 'uglifier', '~> 4.2.0'
# gem 'mini_racer', '~> 0.6'

# theme style
gem 'bootstrap', '~> 4.6'
gem 'font-awesome-rails', '~> 4'
gem 'slim', '~> 4.1'

# tree date
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
  gem 'byebug', '~> 11', platforms: %i[mri mingw x64_mingw]

  gem 'factory_bot_rails', '~> 6'
  gem 'faker', '~> 2'
  gem 'rspec-rails', '~> 5'
end

group :development do
  gem 'bullet', '~> 6'

  gem 'listen', '~> 3.7'
  gem 'spring', '~> 2.1.1'
  gem 'spring-watcher-listen', '~> 2.0.1'
  gem 'web-console', '~> 3.7.0'

  gem 'rubocop', '~> 1.16', require: false
  gem 'rubocop-i18n', '~> 3.0', require: false
  gem 'rubocop-performance', '~> 1.13', require: false
  gem 'rubocop-rails', '~> 2.13', require: false
  gem 'rubocop-rspec', '~> 2.8', require: false
end

group :test do
  gem 'capybara', '~> 3'
  gem 'webdrivers', '~> 5.0', require: false
  gem 'launchy', '~> 2'
  gem 'selenium-webdriver', '~> 4'

  gem 'rails-controller-testing', '~> 1'
  gem 'shoulda-matchers', '~> 4'

  gem 'database_cleaner', '~> 2'
  gem 'database_cleaner-active_record', '~> 2'
  gem 'database_cleaner-core', '~> 2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
#gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
