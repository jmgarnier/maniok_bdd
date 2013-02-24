require_relative "spec_helper"

require 'maniok_bdd/gherkin_formatter'

module ManiokBdd

  describe GherkinFormatter do

    describe ".build" do

      def simplest_feature
<<FEATURE
Feature: The Simplest Feature
  A description

  Scenario: The Simplest Scenario
FEATURE
      end

      before do
        feature_path = write_feature simplest_feature
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

        it "with a list of scenarios" do
          expect_presence_of "  Scenario"
        end
      end

      describe "For each scenario" do
        it "gets the name" do
          expect_presence_of "Scenario \"The Simplest Scenario\" do"
        end
        it "gets the list of steps"
      end

      describe "For each step" do

        it "gets the description inside a block"
      end
    end

  end

end