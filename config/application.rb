require File.expand_path('../boot', __FILE__)

require 'csv'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DiversityTicketing
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'


    # Where the I18n library should search for translation files
    I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml')]
    I18n.available_locales = [:en, :es, :fr]
    config.i18n.default_locale = :en

    config.active_job.queue_adapter = :sidekiq

    # set default url options for mailers
    config.action_mailer.default_url_options = {host: 'localhost'}
    # set default url options for Sidekiq workers
    config.x.worker_routes.default_url_options = {host: 'localhost'}
    # prints rails logs to heroku logs only needed if there are problems in heroku
    # config.logger = Logger.new(STDOUT)
  end
end
