require_relative "spec_helper"

require 'maniok_bdd/cli'

module ManiokBdd

  describe Cli do

    context "When a valid existing .feature file is passed" do

      before do
        @generator = gimme "generator"
        cli = Cli.new @generator
        @returned_code = cli.run "fake.feature"
      end

      it "runs the generator" do
        verify(@generator).generate(anything)
      end

      it "returns 0 when generation was successfull" do
        expect { @returned_code == 0 }
      end
    end

  end

end