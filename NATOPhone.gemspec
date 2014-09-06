# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lib/version'

Gem::Specification.new do |spec|
  spec.name          = "natophone"
  spec.version       = NatoPhone::VERSION
  spec.authors       = ["Eric Dejonckheere"]
  spec.email         = ["eric@aya.io"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.bindir        = 'bin'
  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = %w{natophone}
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.18"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
