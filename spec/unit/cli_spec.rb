require_relative '../helpers/unit'
require 'maniok_bdd/gherkin_formatter'
require 'maniok_bdd/cli'

module ManiokBdd

  describe Cli do

    context "With a feature file argument" do

      before do
        gherkin_formatter = gimme(GherkinFormatter)
        give(gherkin_formatter).to_s { "hi" }

        give(GherkinFormatter).build("features/fake.feature") { gherkin_formatter }

        spy_on GherkinFormatter, :build

        @cli = Cli.new(["features/fake.feature"])
        @exit_code = @cli.run
      end

      it "uses a GherkinFormatter to parse the feature file" do
        verify(GherkinFormatter).build("features/fake.feature")
      end

      it "uses the /spec/acceptance folder and appends .rb to the feature file as a naming convention" do
        ruby_file_path = @cli.ruby_file
        expect { ruby_file_path.include?("spec/acceptance/fake.feature.rb") }
      end

      it "writes the result to a spec/acceptance/<feature-name>.feature.rb file" do
        expect { File.exist? "spec/acceptance/fake.feature.rb" }
      end

      it "returns 0 to tell that it ran successfully" do
        expect { @exit_code == 0 }
      end

      after do
        # TODO use fake.fs for proper clean up
        File.delete "spec/acceptance/fake.feature.rb"
      end

    end

  end

end