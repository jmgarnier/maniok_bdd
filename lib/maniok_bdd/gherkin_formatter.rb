require 'gherkin/parser/parser'

class ManiokBdd::GherkinFormatter

  def self.build(feature_file)
    new.tap do |gherkin_formatter|
      parser = Gherkin::Parser::Parser.new(gherkin_formatter, true)
      parser.parse(File.read(feature_file), feature_file, 0)
    end
  end

  def to_s
    @feature.to_s
  end

  def feature(gherkin_model_feature)
    @feature = Feature.new gherkin_model_feature
  end

  class Feature
    attr_reader :scenarios

    def initialize(gherkin_model_feature)
      @gherkin_model_feature = gherkin_model_feature
      @scenarios = []
    end

    def to_s
      <<RUBY_FEATURE
Feature "#{@gherkin_model_feature.name}" do
#{@gherkin_model_feature.description}

      #{print_scenarios}
end
RUBY_FEATURE
    end

    def print_scenarios
      @scenarios.map do |scenario|
        scenario.to_s
      end.join("\n")
    end
  end

  def scenario(gherkin_model_scenario)
    @feature.scenarios << (@current_scenario = Scenario.new(gherkin_model_scenario))
  end

  class Scenario
    attr_reader :steps
    def initialize(gherkin_model_scenario)
      @gherkin_model_scenario = gherkin_model_scenario
      @steps = []
    end

    def to_s
      <<RUBY_SCENARIO
  Scenario "#{@gherkin_model_scenario.name}" do
    #{print_steps}
  end
RUBY_SCENARIO
    end

    def print_steps
      @steps.map do |step|
        step.to_s
      end.join("\n")
    end
  end

  def step(gherkin_model_step)
    @current_scenario.steps << Step.new(gherkin_model_step)
  end

  class Step
    def initialize(gherkin_model_step)
      @gherkin_model_step = gherkin_model_step
    end

    def to_s
      <<RUBY_STEP
    #{@gherkin_model_step.keyword} "#{@gherkin_model_step.name}" do

    end
RUBY_STEP
    end
  end

  # to avoid undefined method `uri' & efo and keep Gherkin parser happy
  def uri(*)
  end

  def eof
  end

end