# encoding: UTF-8

module Watchmaker
  module Constructor
    extend ActiveSupport::Concern

    module ClassMethods

      # Construct from a factory.
      #
      def construct_from_factory(factory)
        Factory.create(factory.to_sym)
      end
     
      # Construct from another watchmaker.
      # 
      def construct_from_watchmaker(watchmaker)
        construct(watchmaker.to_sym)
      end

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

            # For any abstract dependencies, infer how to create them.
            #
            if abstracts = dependencies[:abstract] 
              abstracts.each do |abstract|
                if Configuration.learned?(abstract)
                  objects << construct_from_watchmaker(abstract)
                else
                  objects << construct_from_factory(abstract)
                end
              end
            end

            # For any supplied factories, create them.
            #
            if factories = dependencies[:factories] 
              factories.each do |factory|
                objects << construct_from_factory(factory)
              end
            end

            # For any supplied watchmakers, create them.
            #
            if watchmakers = dependencies[:watchmakers] 
              watchmakers.each do |watchmaker|
                objects << construct_from_watchmaker(watchmaker)
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
