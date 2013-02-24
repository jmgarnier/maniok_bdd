require_relative "spec_helper"

require 'maniok_bdd/cli'

module ManiokBdd

  describe Cli do

    context "When a valid existing .feature file is passed" do

      it "uses a GherkinFormatter to parse the feature file"

      it "writes the result to a spec/acceptance/<feature-name>.feature.rb file"

      it "returns 0 to tell that it ran successfully"

    end

  end

end