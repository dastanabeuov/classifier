source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# default
gem 'bootsnap', require: false
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.2.0'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# theme style
gem 'bootstrap', '~> 4.6.0'
gem 'font-awesome-rails'
gem 'slim'

# function
gem 'active_model_serializers', '0.10.12'
gem 'activerecord-import'
gem 'ancestry'
gem 'cancancan'
gem 'cocoon'
gem 'devise', github: 'heartcombo/devise', branch: 'master'
gem 'doorkeeper', '5.1.0'
gem 'oj'
gem 'omniauth'
gem 'omniauth-github'
gem 'omniauth-rails_csrf_protection'
gem 'rails-i18n'
gem 'redis-rails'
gem 'responders'
gem 'roo'

# admin dashboard
gem 'rails_admin'
gem 'rails_admin_nestable'

# api docs
gem 'rspec_api_documentation', github: 'zipmark/rspec_api_documentation'
gem 'swagger_ui_engine'

# style guides
gem 'rubocop', require: false

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'launchy'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'pry'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console'
end

group :heroku do
  gem 'rails_12factor'
end
