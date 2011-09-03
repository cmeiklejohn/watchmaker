# encoding: UTF-8

require 'singleton'

module Watchmaker # :nodoc:

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

    class << self 
      def define(name, dependencies, &block) 
        instance.define(name, dependencies, &block)
      end

      alias :learn :define

      def defined(name)
        instance.defined(name)
      end

      alias :learned :defined

      def defined?(name)
        !!defined(name)
      end

      alias :learned? :defined?
    end

    def define(name, dependencies, &block) # :nodoc:
      @profiles[name] = { 
        :dependencies => dependencies,
        :block        => block
      }
    end

    alias :learn :define

    def defined(name) # :nodoc:
      @profiles[name]
    end

    alias :learned :defined

  end

end
