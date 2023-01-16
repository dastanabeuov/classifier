# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  # DatabaseCleaner settings
  config.before(:suite) do
<<<<<<< HEAD
    DatabaseCleaner.clean_with(:truncation)
=======
    # DatabaseCleaner.clean_with(:truncation)
>>>>>>> ca8170c5bcc79d6cf8b14e3aca0e95b86eb60666
    # Ensure sphinx directories exist for the test environment
    ThinkingSphinx::Test.init
    # Configure and start Sphinx, and automatically stop Sphinx at the end of the test suite.
    ThinkingSphinx::Test.start_with_autostop
  end

<<<<<<< HEAD
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, sphinx: true) do
    DatabaseCleaner.strategy = :truncation
=======
  config.before(:each, sphinx: true) do
    # DatabaseCleaner.strategy = :truncation
>>>>>>> ca8170c5bcc79d6cf8b14e3aca0e95b86eb60666
    # Index data when running an acceptance spec.
    ThinkingSphinx::Test.index
  end

<<<<<<< HEAD
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
=======
  # config.before(:each) do
  #   DatabaseCleaner.start
  # end

  # config.before(:each) do
  #   DatabaseCleaner.strategy = :transaction
  # end

  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end
>>>>>>> ca8170c5bcc79d6cf8b14e3aca0e95b86eb60666
end