source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.0'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

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

############
gem 'cocoon'
gem "font-awesome-rails"
gem 'octicons', '~> 10.0'
gem 'octicons_helper'
gem 'apipie-rails'
gem 'cancancan'
gem 'devise'
gem 'devise-bootstrap-views'
gem 'slim'
gem 'bootstrap'
gem 'rails_admin'
gem 'ancestry'
gem 'rails_admin_nestable'
gem 'devise-i18n'
gem 'rails-i18n'
gem 'rails_admin-i18n'
# gem 'globalize'
# gem 'rails_admin_globalize_field'
gem 'swagger_ui_engine'
gem 'rspec_api_documentation', github: 'zipmark/rspec_api_documentation'
