class ManiokBdd::Cli

  def initialize(args)
    @feature_file = args.first
  end

  def run
    ManiokBdd::GherkinFormatter.build @feature_file
    0 # success:)
  end
end