require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'cucumber/rake/task'

task :default => [:spec, :features]

Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format progress"
end

desc "Run all unit & integration tests"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = "--color --format doc"
end

# extracted from https://github.com/grosser/project_template
rule /^version:bump:.*/ do |t|
  file = "lib/maniok_bdd/version.rb"

  sh "git status | grep 'nothing to commit'" # ensure we are not dirty
  index = ["major", "minor", "patch"].index(t.name.split(':').last)
  version_file = File.read(file)
  old_version, *version_parts = version_file.match(/(\d+)\.(\d+)\.(\d+)/).to_a
  version_parts[index] = version_parts[index].to_i + 1
  version_parts[2] = 0 if index < 2 # remove patch for minor
  version_parts[1] = 0 if index < 1 # remove minor for major
  new_version = version_parts * '.'

  File.open(file,"w"){|f| f.write(version_file.sub(old_version, new_version)) }
  sh "bundle && git add #{file} Gemfile.lock && git commit -m 'bump version to #{new_version}'"
end
