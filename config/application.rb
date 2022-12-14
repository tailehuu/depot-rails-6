require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DepotRails6
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # NEVER store or log credit card numbers
    config.filter_parameters += [ :credit_card_number ]

    # allow use files/classes in lib
    # no need: require 'something'
    config.autoload_paths << "#{root}/lib"

    # react will use the same locales
    config.middleware.use I18n::JS::Middleware
  end
end
