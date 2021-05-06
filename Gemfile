source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

#default
gem 'rails', '~> 5.2.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'bootsnap', require: false

#theme style
gem 'slim'
gem 'bootstrap'
gem "font-awesome-rails"

#function
gem 'cocoon'
gem 'ancestry'
gem 'rails-i18n'
gem 'responders'
gem 'redis-rails'
gem 'devise', github: 'heartcombo/devise', branch: 'master'
gem 'omniauth'
gem 'omniauth-rails_csrf_protection'
gem 'omniauth-github'
gem 'cancancan'
gem 'doorkeeper', '5.1.0'
gem 'active_model_serializers', '0.10.12'
gem 'oj'
gem 'roo'
#admin dashboard
gem 'rails_admin'
gem 'rails_admin_nestable'

#api docs
gem 'swagger_ui_engine'
gem 'rspec_api_documentation', github: 'zipmark/rspec_api_documentation'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
  gem 'launchy'
end

group :development do
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :heroku do
  gem 'rails_12factor'
end
