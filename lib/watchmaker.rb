# encoding: UTF-8

require "watchmaker/version"
require "watchmaker/configuration"
require "watchmaker/integrations"
require "watchmaker/learner"
require "watchmaker/constructor"

module Watchmaker # :nodoc:
  include Learner 
  include Constructor
  include Integrations
end
