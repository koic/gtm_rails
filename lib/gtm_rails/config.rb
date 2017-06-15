# -*- frozen-string-literal: true -*-

require 'singleton'

module GtmRails
  class Config
    include ActiveSupport::Configurable

    config_accessor :container_ids
  end
end
