require_relative "spec_helper"

require 'maniok_bdd/gherkin_formatter'

module ManiokBdd

  describe GherkinFormatter do

    describe ".build" do

      it "passes itself and the feature file to the Gherkin::Parser::Parser"

      describe "builds a feature" do
        it "with a name"
        it "with a description"
        xit "with a background"
        it "with a list of scenarios"
      end

      describe "For each scenario" do
        it "build a name"
        it "with a list of steps"
      end

      describe "For each step" do

        it "builds a description"
      end
    end

  end

end