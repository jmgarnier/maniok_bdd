class ManiokBdd::Cli

  def initialize(args)
    @feature_file = args.first
  end

  def run
    ManiokBdd::GherkinFormatter.build @feature_file
    0 # success:)
  end

  def ruby_file
    feature_file_basename = File.basename(@feature_file)
    File.join "spec", "acceptance", "#{feature_file_basename}.rb"
  end
end