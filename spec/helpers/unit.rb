require_relative 'base'
require 'fakefs/safe'

# Helpers
def write_feature(content)
  file_path = File.join File.dirname(__FILE__), "..", "..", "tmp", "simplest.feature"
  open(file_path, 'w') { |f| f << content }
  file_path
end