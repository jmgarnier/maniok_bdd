# More info at https://github.com/guard/guard#readme

guard 'rspec',
      cli: "--format progress", # --backtrace
      bundler: false,
      #binstubs ?
      spec_paths: %w( spec/unit ),
      focus_on_failed: true do
  watch(%r{^spec/unit/.+_spec\.rb$})
  watch(%r{^lib/maniok_bdd/(.+)\.rb$}) { |m| "spec/unit/#{m[1]}_spec.rb" }
  watch('spec/unit/spec_helper.rb') { "spec/unit" }
end

guard 'cucumber', cli: "--profile guard" do
  watch(%r{^features/.+\.feature$})
  watch(%r{^spec/acceptance/cucumber/support/.+$}) { 'features' }
  watch(%r{^spec/acceptance/cucumber/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
end

group 'maniok-acceptance-tests' do

  guard 'rspec',
        cli: "--format documentation --backtrace",
        bundler: false,
        spec_paths: %w( spec/acceptance/maniok ),
        focus_on_failed: true do
    watch(%r{^lib/(.+)\.rb$}) { "spec/acceptance/maniok" }
    watch(%r{^spec/acceptance/maniok/.+feature_spec\.rb$})
  end

end

