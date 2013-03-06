# encoding: utf-8
module ManiokBdd
  module RSpec
    module ExampleGroup
      def include_steps(*args)
        name = args.shift
        shared_block = RSpec.world.shared_example_steps[name]
        shared_block or raise ArgumentError, "Could not find shared steps #{name.inspect}"
        instance_eval_with_args(*args, &shared_block)
      end

      def Given(message, options = {}, &block)
        Step :given, message, options, &block
      end

      def When(message, options = {}, &block)
        Step :when, message, options, &block
      end

      def Then(message, options = {}, &block)
        Step :then, message, options, &block
      end

      def And(message, options = {}, &block)
        Step :and, message, options, &block
      end

      def But(message, options = {}, &block)
        Step :but, message, options, &block
      end

      def _(message, options = {}, &block)
        Step :_, message, options, &block
      end

      private

      def Step(type, message, options = {}, &block)
        ::RSpec.world.reporter.example_step_started(self, type, message, options)
        if block_given? && !options[:pending]
          begin
            yield block
          rescue Exception => e
            ::RSpec.world.reporter.example_step_failed(self, type, message, options)
            raise e
          end
          ::RSpec.world.reporter.example_step_passed(self, type, message, options)
        else
          ::RSpec.world.reporter.example_step_pending(self, type, message, options)
        end
      end

    end
  end
end

RSpec::Core::ExampleGroup.send :include, ManiokBdd::RSpec::ExampleGroup
RSpec::Core::ExampleGroup.singleton_class.define_example_method :Scenario, :with_steps => true