require 'wrong/adapters/rspec'

RSpec.configure do |rspec|
  rspec.expect_with Wrong
end

Wrong.config.alias_assert :expect, override: true
Wrong.config.color

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/../../lib')
