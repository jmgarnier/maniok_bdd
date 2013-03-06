module ManiokBdd
  module RSpec
    module Reporter
      def example_step_started(example, type, message, options)
        notify :example_step_started, example, type, message, options
      end

      def example_step_passed(example, type, message, options)
        notify :example_step_passed, example, type, message, options
      end

      def example_step_pending(example, type, message, options)
        notify :example_step_pending, example, type, message, options
      end

      def example_step_failed(example, type, message, options)
        notify :example_step_failed, example, type, message, options
      end
    end
  end
end

RSpec::Core::Reporter.send :include, ManiokBdd::RSpec::Reporter