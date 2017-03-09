# -*- frozen-string-literal: true -*-

module GtmRails
  class YamlLoader
    def load
      yaml = Rails.root.join('config', 'google_tag_manager.yml')

      config = if yaml && yaml.exist?
        require 'yaml'
        require 'erb'
        YAML.load(ERB.new(yaml.read).result) || {}
      else
        raise 'Could not load database configuration. No such file - config/google_tag_manager.yml'
      end

      config
    rescue Psych::SyntaxError => e
      raise "YAML syntax error occurred while parsing config/google_tag_manager.yml. " \
            "Please note that YAML must be consistently indented using spaces. Tabs are not allowed. " \
            "Error: #{e.message}"
    rescue => e
      raise e, "Cannot load `GtmRails:YamlLoader.load`:\n#{e.message}", e.backtrace
    end
  end
end
