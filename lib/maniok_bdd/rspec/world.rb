module ManiokBdd
  module RSpec
    module World
      def shared_example_steps
        @shared_example_steps ||= {}
      end
    end
  end
end

RSpec::Core::World.send :include, ManiokBdd::RSpec::World