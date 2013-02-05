class ManiokBdd::Cli
  def initialize(poro_generator)
    @poro_generator = poro_generator
  end

  def run(feature_filepath)
    @poro_generator.generate feature_filepath
  end
end