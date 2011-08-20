# encoding: UTF-8

module Watchmaker

  # Singleton configuration class to hold all configured information.
  #
  class Configuration

    include Singleton

    # Store list of all profiles.
    #
    attr_accessor :profiles

    # Initialize to an empty hash.
    #
    def initialize 
      @profiles = {}
    end

    def self.learn(name, dependencies, &block) 
      instance.learn(name, dependencies, &block)
    end

    def self.learned(name)
      instance.learned(name)
    end

    def learn(name, dependencies, &block) 
      @profiles[name] = { 
        :dependencies => dependencies,
        :block        => block
      }
    end

    def learned(name)
      @profiles[name]
    end

  end

end
