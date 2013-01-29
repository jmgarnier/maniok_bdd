Feature: Feature to Ruby Generator

  In order to save time,

  As a Developer who writes features in collaboration,

  I want to generate *.feature.rb fies from plain text .feature files with empty steps blocks.

  Background:
    * A ruby project
    * a "the_simplest_feature.feature" file:
    """
    Feature: The Simplest Feature
      A description

      Scenario: The Simplest Scenario
        Given some pre-conditions
        When something happens
        Then things should work as expected
    """

  Scenario: First time generation

    When I run the manioc command on the feature

    Then it creates a "spec/acceptance/the_simplest_feature.feature.rb" file with:
    """
    require 'spec_helper'

    Feature 'The Simplest Feature' do

      Description <<TXT
      A description
    >>
      end

      Scenario "The Simplest Scenario" do

        Given "some pre-conditions" do

        end

        When "something happens" do

        end

        Then "things should work as expected" do

        end
      end
    end
    """