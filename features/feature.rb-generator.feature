Feature: .feature.rb command line generator

  In order to save time,

  As a Developer who writes features in collaboration with a Customer / Product Owner,

  I want to generate *.feature.rb files from plain text .feature files with empty steps blocks.

  Background:
    * a file named "./features/simplest.feature" with:
    """
    Feature: The Simplest Feature
      A description

      Scenario: The Simplest Scenario
        Given some pre-conditions
        When something happens
        Then things should work as expected
    """

  Scenario: Generate a .feature.rb file from a new .feature file (1st time)

    When I run `maniok features/simplest.feature`

    Then the exit status should be 0

    And the file "spec/acceptance/simplest.feature.rb" should contain:
"""
require 'spec_helper'

Feature "The Simplest Feature" do

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