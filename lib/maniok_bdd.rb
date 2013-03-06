require 'maniok_bdd/version'

module ManiokBdd
end

require 'rspec/core/formatters/base_formatter'
require 'rspec/core/formatters/documentation_formatter'
require "rspec/core/example_group"
require 'rspec/core/reporter'
require 'rspec/core/world'

require 'maniok_bdd/rspec/features'
require 'maniok_bdd/rspec/base_formatter'
require 'maniok_bdd/rspec/documentation_formatter'
require 'maniok_bdd/rspec/example_group'
require 'maniok_bdd/rspec/reporter'
require 'maniok_bdd/rspec/world'
require 'maniok_bdd/rspec/shared_steps'