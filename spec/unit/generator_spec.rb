require_relative "spec_helper"

require 'maniok_bdd/generator'

module ManiokBdd

  describe Generator do

    context "Given a .feature file" do

      describe "#generate" do
        before :each do
          @generator = Generator.new
        end

        it "uses cucumber/gherkin to parse the feature file"

        it "generates a skeleton of ruby block for each step"

        it "writes the result to a spec/acceptance/<feature-name>.feature.rb file"
      end

    end

  end

end
