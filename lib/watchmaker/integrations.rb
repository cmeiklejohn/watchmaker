# encoding: UTF-8

module Watchmaker
  module Integrations
    extend ActiveSupport::Concern

    module ClassMethods

      # Construct from a factory.
      #
      def from_factory(factory, method = :create)
        Factory.send(method, factory.to_sym)
      end
     
      # Construct from another watchmaker.
      # 
      def from_watchmaker(watchmaker, method = :construct)
        self.send(method, watchmaker.to_sym)
      end

    end
  end
end
