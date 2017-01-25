module GtmRails
  class Hooks
    def self.init
      require 'gtm_rails/yaml_loader'

      loader = ::GtmRails::YamlLoader.new

      gtms = loader.load[ENV['RAILS_ENV']] || []

      GtmRails::Config.gtm = gtms.each_with_object({}.with_indifferent_access) {|gtm, ret|
        ret[gtm.keys.first] = gtm.values.first
      }

      ActionView::Base.send :include, GtmRails::Helper
    end
  end
end
