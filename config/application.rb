require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BucketPost
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    #deviseの日本語化
    config.i18n.default_locale = :ja
    #タイムゾーンを日本語に変更
    config.time_zone = 'Asia/Tokyo'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators do |g|
      g.test_framework :rspec,
            view_specs: false,
            helper_specs: false,
            controller_specs: false,
            routing_specs: false
    end
  end
end
