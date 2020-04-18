require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Classifier
  class Application < Rails::Application
    #Локаль по умолчанию
    config.i18n.default_locale = :ru
    # Permitted locales available for the application
    config.i18n.available_locales = [:en, :ru, :kz]
    #Default time-zona from app
    config.time_zone = 'Astana'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
