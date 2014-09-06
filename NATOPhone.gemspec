# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative 'lib/version'

Gem::Specification.new do |spec|
  spec.name          = "natophone"
  spec.version       = NATOPhone::VERSION
  spec.authors       = ["Eric Dejonckheere"]
  spec.email         = ["eric@aya.io"]
  spec.summary       = %q{Simple tool to encode/decode NATO alphabet.}
  spec.description   = %q{Simple tool to encode/decode NATO alphabet. Use as a CLI, or as a library for your apps.}
  spec.homepage      = "https://github.com/ericdke/NATOPhone"
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
