require_relative "spec_helper"

require "maniok_bdd"

describe ManiokBdd do
  it "has a VERSION" do
    expect { ManiokBdd::VERSION =~ /^[\.\da-z]+$/ }
  end
end
