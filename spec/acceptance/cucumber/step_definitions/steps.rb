Given /^It can run the following steps:$/ do |ruby|

  steps %{
    Given a file named "./spec/acceptance/gherkin_spoken.feature.rb" with:
"""
require_relative '../../../../lib/maniok_bdd'

Feature "Gherkin spoken Feature" do
  Scenario "Gherkin spoken Scenario" do
    #{ruby}
  end
end
"""
    When I run `rspec spec/acceptance/gherkin_spoken.feature.rb`
    Then the exit status should be 0
    And it should pass with:
"""
0 failures
"""
}
end