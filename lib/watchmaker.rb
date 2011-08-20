# encoding: UTF-8

require "watchmaker/version"
require "watchmaker/configuration"
require "watchmaker/learner"
require "watchmaker/constructor"

module Watchmaker
  include Learner 
  include Constructor
end
