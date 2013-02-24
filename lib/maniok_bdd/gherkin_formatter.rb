require 'gherkin/parser/parser'

class ManiokBdd::GherkinFormatter

  def self.build(feature_file)
    new.tap do |builder|
      parser = Gherkin::Parser::Parser.new(builder, true)
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
    attr_accessor :scenarios

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
    def initialize(gherkin_model_scenario)
      @gherkin_model_scenario = gherkin_model_scenario
    end

    def to_s
      <<RUBY_SCENARIO
  Scenario "#{@gherkin_model_scenario.name}" do
  end
RUBY_SCENARIO
    end
  end

  # to avoid undefined method `uri' & efo and keep Gherkin parser happy
  def uri(*)
  end

  def eof
  end

end