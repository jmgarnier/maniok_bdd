Feature: Gherkin Spoken

  In order to minimize the risk (be able to switch back to cuke, turnip or spinach if things go wrong!)
  As a BDD practioner who advocate for standards,
  I want to maniok to understand the whole Gherkin vocabulary:

    • Feature
    • Background
    • Scenario
    • Given
    • When
    • Then
    • And
    • But
    • *
    • Scenario Outline
    • Examples

  Scenario: Given When Then And But
    * It can run the following steps:
    """
      Given "some pre-conditions" do end
      When "something happens" do end
      Then "things should work as expected" do end
      And "it does indeed, most of the time" do end
      But "sometimes not, shit happens, c'est la vie!" do end
    """



