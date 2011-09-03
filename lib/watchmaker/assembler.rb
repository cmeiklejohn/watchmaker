# encoding: UTF-8

module Watchmaker
  module Assembler
    extend ActiveSupport::Concern

    module ClassMethods

      # Assemble a profile, or build in memory only.
      # 
      def build(profile)
        manufacture(profile, :build)
      end

      alias :assemble :build

    end
  end
end
