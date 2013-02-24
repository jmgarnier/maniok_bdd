class ManiokBdd::Cli
  def run(feature_file)
    ManiokBdd::GherkinFormatter.build feature_file
    0 # success:)
  end
end