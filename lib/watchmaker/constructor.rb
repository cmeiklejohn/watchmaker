# encoding: UTF-8

module Watchmaker
  module Constructor
    extend ActiveSupport::Concern

    module ClassMethods

      # Contruct a profile.
      #
      def construct(profile)

        # Store created objects.
        #
        objects = []

        # If a profile exists, call the proc we've stored; if not, raise.
        #
        if selected_profile = Configuration.learned(profile)

          if dependencies = selected_profile[:dependencies]

            # For any supplied factories, create them.
            #
            if factories = dependencies[:factories] 
              factories.each do |factory|
                objects << Factory.create(factory.to_sym)
              end
            end

            # For any supplied watchmakers, create them.
            #
            if watchmakers = dependencies[:watchmakers] 
              watchmakers.each do |watchmaker|
                objects << construct(watchmaker.to_sym)
              end
            end

          end

          # Run the supplied block.
          #
          if block = selected_profile[:block]
            objects << block.call(objects)
          end

          # Return objects.
          #
          objects

        else
          raise "#{profile} is not a valid profile"
        end

      end

    end
  end
end
