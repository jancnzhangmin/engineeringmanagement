require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Engineeringmanagement
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.app = '工程进度管理'
    config.version = '4.0.1'
    config.app_sidebar = true
    config.logo = 'logo.png'
    config.app_flavor = '工程进度管理'
    config.app_flavor_subscript = '微信项目进度'
    config.user = 'Dr. Codex Lantern'
    config.avatar = 'avatar-admin.png'
    config.app_header = true
    config.app_layout_shortcut = true
    config.layout_settings = true
    config.chat_interface = true
    config.email = 'drlantern@gotbootstrap.com'
    config.twitter = 'codexlantern'
    config.shortcut_menu = false
    config.chat_interface = true
    config.layout_settings = false
    config.app_footer = true
    config.copyright = "2019 © 快盈科技".html_safe
    config.copyright_inverse = "2019 © 工程进度管理 by&nbsp;快盈科技".html_safe
    config.app_name = '工程进度管理'
    config.bs4v = '4.3'
    config.sa_assets_prefix = 'smartadmin/'
    config.sa_asset_filetypes =
        %w(*.png *.jpg *.jpeg *.gif *.svg *.json *.webm *.mp4 *.js *.css)
  end
end
