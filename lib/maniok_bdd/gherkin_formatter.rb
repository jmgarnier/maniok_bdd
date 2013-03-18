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

  def scenario(gherkin_model_scenario)
    @feature.scenarios << (@current_scenario = Scenario.new(gherkin_model_scenario))
  end

  def step(gherkin_model_step)
    @current_scenario.steps << Step.new(gherkin_model_step)
  end

  # to avoid undefined method `uri' & efo and keep Gherkin parser happy
  def uri(*)
  end

  def eof
  end

  private

  class GherkinCollection
    attr_reader :elements

    def initialize(gherkin_object)
      @gherkin_object = gherkin_object
      @elements = []
    end

    def to_s
      <<RUBY
#{gherkin_to_maniok_block} do

#{print_elements}
end
RUBY
    end

    private

    def gherkin_to_maniok_block
      "#{gherkin_model_name} \"#{@gherkin_object.name}\""
    end

    def gherkin_model_name
      @gherkin_object.class.name.split('::').last
    end

    def print_elements
      @elements.map do |element|
        element.to_s
      end.join("\n")
    end
  end

  class Feature < GherkinCollection
    alias :scenarios :elements

    def to_s
      # TODO later
      #{@gherkin_model_feature.description}

      <<RUBY_FEATURE
require 'spec_helper'

#{super.to_s}
RUBY_FEATURE
    end

  end

  class Scenario < GherkinCollection
    alias :steps :elements

    def to_s
      <<RUBY_SCENARIO
  #{gherkin_to_maniok_block} do

#{print_elements}
  end
RUBY_SCENARIO
    end

  end

  class Step
    def initialize(gherkin_model_step)
      @gherkin_model_step = gherkin_model_step
    end

    def to_s
      <<RUBY_STEP
    #{@gherkin_model_step.keyword}"#{@gherkin_model_step.name}" do

    end
RUBY_STEP
    end
  end

end