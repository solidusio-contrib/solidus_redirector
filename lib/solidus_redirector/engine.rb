# frozen_string_literal: true

require 'spree/core'

module SolidusRedirector
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace ::Spree

    engine_name 'solidus_redirector'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'solidus_subscriptions.configure_backend' do
      next unless ::Spree::Backend::Config.respond_to?(:menu_items)

      ::Spree::Backend::Config.configure do |config|
        config.menu_items << config.class::MenuItem.new(
          [:redirects],
          'arrow-right',
          url: :admin_redirect_rules_path,
          condition: ->{ can?(:admin, RedirectRule) },
          match_path: '/redirect_rules'
        )
      end
    end
  end
end
