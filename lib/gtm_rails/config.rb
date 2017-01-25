require 'singleton'

module GtmRails
  class Config
    include Singleton

    cattr_accessor :container_ids
  end
end
