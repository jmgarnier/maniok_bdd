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
end
RUBY_FEATURE
  end

  def feature(gherkin_model_feature)
    @gherkin_model_feature = gherkin_model_feature
  end

  # to avoid undefined method `uri' & efo and keep Gherkin parser happy
  def uri(*)
  end

  def eof
  end
end