# encoding: UTF-8

require 'singleton'

module Watchmaker

  # Singleton configuration class to hold all configured information.
  #
  class Configuration
    include Singleton

    attr_accessor :profiles
  end

  # As soon as we define the singleton configuration class, instantitate
  # it and default some values.
  #
  Configuration.instance.tap do |o|
    o.profiles = {} 
  end

end
