# encoding: UTF-8

require "watchmaker/version"
require "watchmaker/configuration"

require "watchmaker/integrations"

require "watchmaker/learner"

require "watchmaker/manufacturer"
require "watchmaker/constructor"
require "watchmaker/assembler"

module Watchmaker # :nodoc:
  include Integrations
  include Learner 
  include Manufacturer
  include Constructor
  include Assembler
end
