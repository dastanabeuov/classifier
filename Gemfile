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

#additional function
gem 'cocoon'
gem 'devise'
gem 'ancestry'
gem 'cancancan'
gem 'rails_admin'
gem 'rails_admin_nestable'
gem 'responders'
gem 'redis-rails'
# gem 'redis'
#api docs
gem 'apipie-rails'
gem 'swagger_ui_engine'
gem 'rspec_api_documentation', github: 'zipmark/rspec_api_documentation'

#internationalize
gem 'rails-i18n'

#style
gem 'slim'
gem 'bootstrap'
gem "font-awesome-rails"

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
