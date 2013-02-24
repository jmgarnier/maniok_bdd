require_relative "spec_helper"

require 'maniok_bdd/gherkin_formatter'

module ManiokBdd

  describe GherkinFormatter do

    describe ".build" do

      before do
        feature_path = fixture_path "simplest.feature"
        @gherkin_formatter = GherkinFormatter.build feature_path
      end

      def expect_presence_of(text)
        expect { @gherkin_formatter.to_s.include? text }
      end

      describe "builds a Feature block" do
        it "with a name" do
          expect_presence_of "Feature \"The Simplest Feature\" do"
        end

        it "with a description" do
          expect_presence_of "A description"
        end
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