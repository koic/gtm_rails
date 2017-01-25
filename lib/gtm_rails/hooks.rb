module GtmRails
  class Hooks
    def self.init
      require 'gtm_rails/yaml_loader'

      loader = ::GtmRails::YamlLoader.new

      GtmRails::Config.gtm = (loader.load[ENV['RAILS_ENV']] || {}).with_indifferent_access

      ActionView::Base.send :include, GtmRails::Helper
    end
  end
end
