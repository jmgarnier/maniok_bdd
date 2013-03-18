require 'wrong/adapters/rspec'
require 'gimme'
require 'fakefs/safe'
require 'coveralls'

Coveralls.wear!

RSpec.configure do |rspec|
  rspec.expect_with Wrong
  rspec.mock_framework = Gimme::RSpecAdapter
end

Wrong.config.alias_assert :expect, override: true
Wrong.config.color

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/../../lib')

# Helpers
def write_feature(content)
  file_path = File.join File.dirname(__FILE__), "..", "..", "tmp", "simplest.feature"
  open(file_path, 'w') { |f| f << content }
  file_path
end