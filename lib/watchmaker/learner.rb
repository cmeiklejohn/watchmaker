# encoding: UTF-8

module Watchmaker
  module Learner
    extend ActiveSupport::Concern

    module ClassMethods

      # Learn a new profile.
      #
      def learn(profile, options = {}, &block)

        # Add the block to the list of known profiles.
        #
        Configuration.instance.profiles[profile] = {
          :options => options, 
          :block   => block 
        }

      end

    end
  end
end
