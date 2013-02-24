require_relative "spec_helper"

require 'gherkin/parser/parser'
require 'maniok_bdd/gherkin_formatter'

module ManiokBdd

  describe GherkinFormatter do

    describe ".build" do

      before do
        feature_path = fixture_path "simplest.feature"
        @gherkin_formatter = GherkinFormatter.build feature_path
      end

      describe "builds a feature" do
        it "with a name" do
          expect { @gherkin_formatter.feature.name == "The Simplest Feature" }
        end

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