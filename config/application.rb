require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Classifier
  class Application < Rails::Application 
    #####################################
    config.assets.initialize_on_precompile = false
    ############################
    config.i18n.fallbacks = true
    #Локаль по умолчанию
    config.i18n.default_locale = :en
    # Permitted locales available for the application
    config.i18n.available_locales = [:ru, :kz, :en]
    #Default time-zona from app
    config.time_zone = 'Astana'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
      g.test_framework :rspec,
                      view_specs: false,
                      helper_specs: false,
                      routing_specs: false,
                      request_specs: false,
                      controller_specs: true
    end
  end
end
