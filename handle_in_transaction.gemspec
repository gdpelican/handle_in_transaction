# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'handle_in_transaction/version'

Gem::Specification.new do |spec|
  spec.name          = "handle_in_transaction"
  spec.version       = HandleInTransaction::VERSION
  spec.authors       = ["James Kiesel"]
  spec.email         = ["james.kiesel@gmail.com"]
  spec.summary       = "Adds a helper to wrap model methods in transactions easily."
  spec.homepage      = "http://www.github.com/gdpelican/handle_in_transaction"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "activerecord", "~> 4.0.0"
end
