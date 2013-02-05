class ManiokBdd::Cli
  def initialize(generator = ManiokBdd::Generator.new)
    @generator = generator
  end

  def run(feature_filepath)
    @generator.generate feature_filepath
    0 # success:)
  end
end