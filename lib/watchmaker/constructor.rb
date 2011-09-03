# encoding: UTF-8

module Watchmaker
  module Constructor
    extend ActiveSupport::Concern

    module ClassMethods

      # Contruct a profile, or persist objects.
      # 
      def create(profile)
        manufacture(profile, :create)  
      end

      alias :construct :create

    end
  end
end
