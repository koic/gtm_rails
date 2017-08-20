# frozen-string-literal: true

module GtmRails
  class Hooks
    def self.init
      require 'gtm_rails/yaml_loader'

      loader = ::GtmRails::YamlLoader.new

      GtmRails::Config.configure do |config|
        config.container_ids = (loader.load[Rails.env] || {}).with_indifferent_access
      end

      ActionView::Base.send :include, GtmRails::Helper
    end
  end
end
