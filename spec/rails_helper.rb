# frozen_string_literal: true

require 'database_cleaner'

require 'spec_helper'

ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

abort('The Rails environment is running in production mode!') if Rails.env.production?

require 'rspec/rails'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.backtrace_inclusion_patterns = [/app|spec/]
  # Example records
  config.include FactoryBot::Syntax::Methods
  # Devise engine require from controllers
  config.include Devise::Test::ControllerHelpers, type: :controller
  # require /support/*.rb
  config.include ControllerHelpers, type: :controller
  config.include FeatureHelpers, type: :feature
  config.include RequestHelpers, type: :request
  #config.include SphinxHelpers, type: :feature

  # capybara from interface testing
  Capybara.javascript_driver = :selenium_chrome_headless
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.after(:all) do
    FileUtils.rm_rf("#{Rails.root}/tmp/storage")
  end

<<<<<<< HEAD
  # database_cleaner
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
=======
  # config.before(:suite) do
  #   DatabaseCleaner.strategy = :transaction
  #   DatabaseCleaner.clean_with(:truncation)
  # end

  # config.around do |example|
  #   DatabaseCleaner.cleaning do
  #     example.run
  #   end
  # end
>>>>>>> ca8170c5bcc79d6cf8b14e3aca0e95b86eb60666
end

# DSL from testing rspec
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
