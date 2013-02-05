require_relative "spec_helper"

require 'maniok_bdd/cli'

module ManiokBdd

  describe Cli do

    context "When an exisiting .feature file is passed" do

      it "runs the generator" do
        generator = gimme "generator"
        cli = Cli.new generator
        cli.run "fake.feature"

        verify(generator).generate(anything)
      end
    end

  end

end