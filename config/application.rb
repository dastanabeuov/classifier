require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module Classifier
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'Almaty'
    config.i18n.fallbacks = true
    config.i18n.default_locale = :en
    config.i18n.fallbacks =[:ru, :kz, :en]
    config.app_generators.scaffold_controller :responders_controller
    config.autoload_paths += [config.root.join('app')]
    config.cache_store = :redis_store, 'redis://localhost:6379/0/cache', { expires_in: 90.minutes }

    config.generators do |g|
      g.test_framework :rspec,
                      view_specs: false,
                      helper_specs: false,
                      routng_specs: false,
                      request_specs: false
    end
  end
end
