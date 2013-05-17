![logo](http://seekingsustenance.files.wordpress.com/2010/04/manioc-whole.jpg)

RSpec extension to run Gherkin steps

[![Gem Version](https://badge.fury.io/rb/maniok_bdd.png)](http://badge.fury.io/rb/maniok_bdd)
[![Dependency Status](https://gemnasium.com/21croissants/maniok_bdd.png)](https://gemnasium.com/21croissants/maniok_bdd)
[![Build Status](https://travis-ci.org/21croissants/maniok_bdd.png?branch=master)](https://travis-ci.org/21croissants/maniok_bdd)
[![Coverage Status](https://coveralls.io/repos/21croissants/maniok_bdd/badge.png?branch=master)](https://coveralls.io/r/21croissants/maniok_bdd)
[![Code Climate](https://codeclimate.com/github/21croissants/maniok_bdd.png)](https://codeclimate.com/github/21croissants/maniok_bdd)

# Documentation

Please read the [draft of the announcement blog post](https://gist.github.com/21croissants/5574735).

[Hosted on relish](https://www.relishapp.com/21croissants/maniok-bdd) (out of date, I have to find a way to push my features!)

# Example

```ruby
require 'spec_helper'

# type :feature is for Capybara 
Feature "The Simplest Feature", type: :feature  do

  shared_steps "home" do
    Given "I am on the home page" do
      visit "/"
    end
  end

  Scenario "The Simplest Scenario" do
    include_steps "home"

    When "something happens" do

    end

    Then "it should assert correctly" do
      true.should be_true
    end
  end
end
``` 

# Author

[Jean-Michel Garnier](http://21croissants.com)<br/>

Heavily inspired by http://coulda.tiggerpalace.com/ & [Railsware rspec-example_steps](https://github.com/railsware/rspec-example_steps)

License: MIT<br/>
