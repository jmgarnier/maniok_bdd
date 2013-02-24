require_relative "spec_helper"

require 'maniok_bdd/gherkin_formatter'
require 'maniok_bdd/cli'

module ManiokBdd

  describe Cli do

    context "When a valid existing .feature file is passed" do

      before do
        spy_on GherkinFormatter, :build
        @exit_code = Cli.new.run "fake.feature"
      end

      it "uses a GherkinFormatter to parse the feature file" do
        verify(GherkinFormatter).build("fake.feature")
      end

      it "writes the result to a spec/acceptance/<feature-name>.feature.rb file"

      it "returns 0 to tell that it ran successfully" do
        expect { @exit_code == 0 }
      end

    end

  end

end