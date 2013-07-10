https://github.com/21croissants/maniok_bdd

# Introducing Maniok, yet another alternative to cucumber

## I love BDD!

Maniok is a tool for teams practicing [Specification by Example](http://www.specificationbyexample.com/) / [BDD](http://bddkickstart.com/details#fundamentals). I started back in 2007 with the [RSpec story runner](http://blog.davidchelimsky.net/2007/10/21/story-runner-in-plain-english/) and then used cucumber for 4 years in 5 different projects. In 2 projects where developers abused of [web steps](http://aslakhellesoy.com/post/11055981222/the-training-wheels-came-off), I got very tired of reading 15 lines scenarios written in a very imperative style and trying to understand what the hell steps with 5 or 6 regexps + a table actually did. Maintaining cucumber features takes time and sweat:( Maniok is my modest attempt to contribute to the future of cucumber [2.0](http://blog.mattwynne.net/2012/04/26/a-vision-for-cucumber-2-0/).

## Stop reading if you look for an integration testing tool!

To quote [BDD coach Chris Parsons](http://chrismdp.com/2012/11/the-integration-testing-trap/): 
> Perhaps many people miss the point of the outer part of the BDD cycle entirely - the tests are about the customer, not us
> ...I’ve often said before that if no one is reading our features, we’re better off using RSpec

If your customers do not see value in Spec by Example, I strongly recommend to use capybara and maybe its feature & scenario "DSL" to organize your integrations tests. But the real value of this practice comes from writing Gherkin scenarios (Given / When / Then) collaboratively with your customers and capybara "DSL" does not provide these steps.

## Training

Writing good scenarios that customers and developers enjoy reading takes time, I strongly recommend to ask a coach or attend a workshop - http://www.specificationbyexample.com/ or http://bddkickstart.com/ - to speed up the process (I am not affiated to them).

## 1. Collaborate with a Product Owner / Customer to write a feature

Sit down with non-technical person to sketch out the behaviour you want. You must follow Gherkin grammar (shared by cucumber, turnip & spinach). Then use the command line to generate the skeleton of a ruby file.

### Example

* Given a file named "./features/simplest.feature" with:

``` cucumber
Feature: The Simplest Feature
  Scenario: The Simplest Scenario
    Given some pre-conditions
    When something happens
    Then things should work as expected
```

* When I run `maniok features/simplest.feature`
* Then the file "spec/acceptance/simplest.feature.rb" should contain:

```ruby
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
```

## 2. Write the tests with RSpec

### Example using capybara

```ruby
require 'spec_helper'
require 'maniok-bdd'
 
Feature "The Simplest Feature", type: :feature  do
  shared_steps "home" do
    Given "some pre-conditions" do
      visit "/"
    end
  end
 
  Scenario "The Simplest Scenario" do
    include_steps "home"
 
    When "something happens" do 
    end
 
    Then "things should work as expected" do
      true.should be_true
    end
  end
end
```

## 3. When you're done, publish the gherkin feature. 

From now, you're not supposed to edit the files in the features folder.

Because Maniok is a RSpec extension, we use a RSpec doc formatter to generate the gherkin feature.

```
rspec --format doc spec/acceptance/simplest.feature.rb > features/simplest.feature
```

*TODO implement a command line tool to automate  & add screenshot*

To update your customers about the scenario changes, I strongly recommend using something like https://www.relishapp.com/ (private projects available) or [Courgette](https://github.com/21croissants/courgette).

## How does it compare to Cucumber, Turnip & Spinach

All these tools are far more mature than Maniok. 

The main difference is the DRYer declaration of scenario steps. There is no parsing of a Gherkin feature and step definition matching in Maniok. Everything is in one place: the ruby file. With other tools, I found it annoying to have to change the text in 2 places (feature file & step definition file) every time I changed a comma.

If you use a declarative style to write your features, you won't share so many steps anyway.

## FEEDBACK Welcome :)

I would love some feedback from the BDD community about these PROS & CONS 

### PROS

* All the power of RSpec for free (community, tags, formatters, third party extensions). One testing framework to rule them all, a lower learning curve for developers new to BDD.
* 100% compatible with Gherkin so you can still use relishapp.com
* Zero dupplication. If you write your features with a [declarative style](http://aslakhellesoy.com/post/11055981222/the-training-wheels-came-off), you won't re-use that many steps. If you use cucumber / spinach / turnip, you'll have to edit 2 files when you want to change a step: once in the feature file and another time in the step definitions.
* Everything in 1 place. Whereas in a complex cucumber project, you constantly have to open 2-5 files to be able to read all the step definitions of a given scenario
* Good bye Regular expressions. I agree with both Josep and Jonas, regexps in step defs bring no value for testing and make it even harder to read. In worst case, people end up writing step definitions with 5 or more arguments and not so obvious regexps. Plain ruby helpers coupled with the Page Object pattern shall make maintaining & DRYing the tests smoothier.  
* Speed. We can use a before(:all) to set up some invariant test data shared by all scenarios. You can't do that with cuke, can you?
* Small footprint. Maniok is a very thin wrapper around RSpec whereas Cucumber code base is huge. cucumber stacktraces can be very noisy. 

### CONS

* no AST:Table (yet)
* cucumber community is huge (66K download for the latest version)
* please add some in the comments ;)

Some links:
* http://www.jackkinsella.ie/2011/09/26/why-bother-with-cucumber-testing.html

## Quotes

> Where exactly should I put my step definitions? What if they're corelated - can I abstract them in a simple way? 
> Can I reuse them across projects? Could I even test them?
> With cucumber, you usually run into this kind of situations and there's no easy way to get over it.
> You should use better step file namings perhaps? Create some methods that live next to each other in the cucumber World? 
> Nah, it just doesn't feel good. 

  Josep Jaume Rey, 21st of October 2011 on [codegram's blog](http://blog.codegram.com/2011/10/how-to-achieve-more-clean-encapsulated-modular-step-definitions-with-spinach)

> In the beginning, it was fantastic, the overhead of Cucumber was gone, we were insanely productive. 
> But over time, cracks appeared. As the projects grew larger, the tests became more and more difficult to maintain.

  Jonas Nicklas, 17th of November 2011 on [elabs's blog]( http://elabs.se/blog/30-solving-cucumber-s-problems )
