# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'poshy_matcher/version'

Gem::Specification.new do |gem|
  gem.name          = "poshy_matcher"
  gem.version       = PoshyMatcher::VERSION
  gem.authors       = ["Gabriel Schammah"]
  gem.email         = ["gschammah@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'treetop', '~> 1.4.12'
end
