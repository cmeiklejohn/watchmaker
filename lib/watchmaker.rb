# encoding: UTF-8

require "watchmaker/version"

module Watchmaker # :nodoc:

  # Attribute accessors to hold profile mappings.
  #
  mattr_accessor :profiles

  # Learn a new profile.
  #
  def self.learn(profile, options = {}, &block)

    # Initialize the profiles unless they exist.
    #
    @@profiles = {} unless @@profiles

    # Add the block to the list of known profiles.
    #
    @@profiles[profile] = {
      :options => options, 
      :block   => block 
    }

  end

  # Contruct a profile based on lambda.
  #
  def self.construct(profile)

    # Store created objects.
    #
    objects = []

    # If a profile exists, call the proc we've stored; if not, raise.
    #
    if selected_profile = @@profiles[profile]

      if options = selected_profile[:options]

        # For any supplied factories, create them.
        #
        if factories = options[:factories] 
          factories.each do |factory|
            objects << Factory.create(factory.to_sym)
          end
        end

        # For any supplied watchmakers, create them.
        #
        if watchmakers = options[:watchmakers] 
          watchmakers.each do |watchmaker|
            objects << Watchmaker.construct(watchmaker.to_sym)
          end
        end

      end

      # Run the supplied block.
      #
      if block = selected_profile.delete(:block)
        objects << block.call(objects)
      end

      # Return objects.
      #
      objects.flatten

    else
      raise "#{profile} is not a valid profile"
    end

  end

end
