Feature: RSpec runner integration

  In order to not to reinvent the wheel and target most existing BDD practioners

  As a Developer

  I want my acceptance testing tool to be tightly integrated with rspec-core

  Background:
  * a file named "./spec/acceptance/simplest.feature.rb" with:
"""
require_relative '../../../../lib/maniok_bdd'

Feature "The Simplest Feature" do
  Scenario "The Simplest Scenario" do
    Given "a step" do
      true.should be_true
    end
  end
end  
"""

  Scenario: Simplest example
    When I run `rspec spec/acceptance/simplest.feature.rb`
    Then the exit status should be 0
    And it should pass with:
"""
0 failures
"""
