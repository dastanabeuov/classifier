require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Classifier
  class Application < Rails::Application 
    config.i18n.fallbacks = true
    config.i18n.default_locale = :ru
    config.i18n.available_locales = [:ru, :kz, :en]
    config.time_zone = 'Astana'

    config.generators do |g|
      g.test_framework :rspec, view_specs: false, 
                               helper_specs: false, 
                               routing_specs: false, 
                               request_specs: false
    end
  end
end
