require_relative "spec_helper"

require 'maniok_bdd/gherkin_formatter'
require 'maniok_bdd/cli'

module ManiokBdd

  describe Cli do

    context "With a feature file argument" do

      before do
        spy_on GherkinFormatter, :build

        @cli = Cli.new(["features/fake.feature"])
        @exit_code = @cli.run
      end

      it "uses a GherkinFormatter to parse the feature file" do
        verify(GherkinFormatter).build("features/fake.feature")
      end

      it "writes the result to a spec/acceptance/<feature-name>.feature.rb file"

      it "returns 0 to tell that it ran successfully" do
        expect { @exit_code == 0 }
      end

    end

  end

end