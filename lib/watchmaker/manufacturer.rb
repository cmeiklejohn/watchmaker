# encoding: UTF-8

module Watchmaker
  module Manufacturer
    extend ActiveSupport::Concern

    module ClassMethods

      # Create objects, by a specific means, either in memory or in the
      # database.
      # 
      def manufacture(profile, method)

        # Store created objects.
        #
        objects = []

        # If a profile exists, call the proc we've stored; if not, raise.
        #
        if selected_profile = Configuration.learned(profile)

          if dependencies = selected_profile[:dependencies]

            # For any abstract dependencies, infer how to create them.
            #
            if abstracts = dependencies[:abstract] 
              abstracts.each do |abstract|
                if Configuration.learned?(abstract)
                  objects << from_watchmaker(abstract, method)
                else
                  objects << from_factory(abstract, method)
                end
              end
            end

            # For any supplied factories, create them.
            #
            if factories = dependencies[:factories] 
              factories.each do |factory|
                objects << from_factory(factory, method)
              end
            end

            # For any supplied watchmakers, create them.
            #
            if watchmakers = dependencies[:watchmakers] 
              watchmakers.each do |watchmaker|
                objects << from_watchmaker(watchmaker, method)
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
