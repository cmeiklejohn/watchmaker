# encoding: UTF-8

module Watchmaker
  module Learner
    extend ActiveSupport::Concern

    module ClassMethods

      # Learn a profile by taking explicit dependencies.
      #
      def learn(name, dependencies = {}, &block)

        if name.is_a?(Hash)
          
          # Convert the hash into a profile name and a list of
          # dependencies that's either a hash of nested classes or
          # array.
          #
          name, dependencies = 
            name_and_dependencies_from_dependency_hash(name) 

          # Specifically store these as abstract dependencies.
          #
          dependencies = { :abstract => dependencies }

        end

        Configuration.learn(name, dependencies, &block)
      end

      # Get the profile name out of a dependency hash.
      #
      def name_and_dependencies_from_dependency_hash(dependencies)
        name = dependencies.keys.first
        [name, dependencies[name]]
      end

    end
  end
end
