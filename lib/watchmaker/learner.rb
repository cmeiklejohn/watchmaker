# encoding: UTF-8

module Watchmaker
  module Learner
    extend ActiveSupport::Concern

    module ClassMethods

      # Learn a profile by taking explicit dependencies.
      #
      def learn(name, dependencies = {}, &block)
        Configuration.learn(name, dependencies, &block)
      end

    end
  end
end
