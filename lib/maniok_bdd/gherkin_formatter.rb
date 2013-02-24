require 'gherkin/parser/parser'

class ManiokBdd::GherkinFormatter

  def self.build(feature_file)
    new.tap do |builder|
      parser = Gherkin::Parser::Parser.new(builder, true)
      parser.parse(File.read(feature_file), feature_file, 0)
    end
  end

  def to_s
    <<RUBY_FEATURE
Feature "#{@gherkin_model_feature.name}" do
#{@gherkin_model_feature.description}

#{print_scenarios}
end
RUBY_FEATURE
  end

  def feature(gherkin_model_feature)
    @gherkin_model_feature = gherkin_model_feature
  end

  def scenario(gherkin_model_scenario)
    @gherkin_model_scenarios ||= []
    @gherkin_model_scenarios << gherkin_model_scenario
  end

  # to avoid undefined method `uri' & efo and keep Gherkin parser happy
  def uri(*)
  end

  def eof
  end

  private

  def print_scenarios
    @gherkin_model_scenarios.map do |scenario|
      print_scenario(scenario)
    end.join("\n")
  end

  def print_scenario(gherkin_model_scenario)
    <<RUBY_SCENARIO
  Scenario "#{gherkin_model_scenario.name}" do
  end
RUBY_SCENARIO
  end
end