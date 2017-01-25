module GtmRails
  class Railtie < ::Rails::Railtie
    initializer 'gtm_rails.initialize' do
      ActiveSupport.on_load(:action_view) do
        GtmRails::Hooks.init
      end
    end
  end
end
