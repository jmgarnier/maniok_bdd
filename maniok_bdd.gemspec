$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
name = "maniok_bdd"
require "#{name}/version"

Gem::Specification.new name, ManiokBdd::VERSION do |gem|
  gem.summary = "BDD with POROs"
  gem.authors = ["Jean-Michel Garnier"]
  gem.email = "jean-michel@21croissants.com"
  gem.homepage = "http://github.com/21croissants/#{name}"
  gem.files         = %w(README.md) + Dir.glob("lib/**/*.rb")	
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.license = "MIT"
  gem.add_runtime_dependency "rspec", "~>2.0"
  gem.add_runtime_dependency "gherkin", ">= 2.5"
end
