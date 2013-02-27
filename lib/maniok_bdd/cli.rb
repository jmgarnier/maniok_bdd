class ManiokBdd::Cli

  def initialize(args)
    @feature_file = args.first
  end

  def run
    gherkin_formatter = ManiokBdd::GherkinFormatter.build @feature_file

    create_spec_acceptance_folder
    write_file ruby_file, gherkin_formatter.to_s

    0 # success:)
  end

  def create_spec_acceptance_folder
    create_unless_exists "spec"
    create_unless_exists File.join("spec", "acceptance")
  end

  def ruby_file
    feature_file_basename = File.basename(@feature_file)
    File.join "spec", "acceptance", "#{feature_file_basename}.rb"
  end

  private

  def write_file(file_path, content)
    open(file_path, 'w') { |f| f << content }
  end

  def create_unless_exists(path)
    Dir.mkdir(path) unless Dir.exist?(path)
  end

end