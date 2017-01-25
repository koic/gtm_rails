require 'singleton'

module GtmRails
  class Config
    include Singleton

    cattr_accessor :gtm
  end
end
