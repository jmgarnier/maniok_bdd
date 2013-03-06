module ManiokBdd
  module Features
    def self.included(base)
      base.instance_eval do
        alias :Background :before
      end
    end
  end
end

def self.Feature(*args, &block)
  describe(*args, &block)
end

RSpec.configuration.include ManiokBdd::Features