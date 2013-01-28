require "spec_helper"

describe ManiokBdd do
  it "has a VERSION" do
    ManiokBdd::VERSION.should =~ /^[\.\da-z]+$/
  end
end
