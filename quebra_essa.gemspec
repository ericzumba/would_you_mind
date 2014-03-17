# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'would_you_mind/version'

Gem::Specification.new do |spec|
  spec.name          = "would_you_mind"
  spec.version       = WouldYouMind::VERSION
  spec.authors       = ["Eric Torti"]
  spec.email         = ["etorti@sp.r7.com"]
  spec.description   = %q{would you mind}
  spec.summary       = %q{would you mind}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.6"
end
