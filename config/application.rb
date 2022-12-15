# frozen_string_literal: true

require_relative 'boot'
require 'csv'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module Classifier
  class Application < Rails::Application
    config.hosts << "ece8-37-99-43-218.eu.ngrok.io"
    config.load_defaults 7.0
    config.time_zone = 'Almaty'
    config.i18n.fallbacks = true
    config.i18n.default_locale = :en
    config.i18n.fallbacks = %i[ru kz en]

    config.active_record.cache_versioning = false

    config.app_generators.scaffold_controller :responders_controller
    config.autoload_paths += [config.root.join('app')]

    config.action_cable.disable_request_forgery_protection = true

    config.cache_store = :redis_store, 'redis://localhost:6379/0/cache', { expires_in: 90.minutes }
    config.active_job.queue_adapter = :sidekiq

    config.generators do |g|
      g.test_framework :rspec,
                       view_specs: false,
                       helper_specs: false,
                       routng_specs: false
    end
  end
end