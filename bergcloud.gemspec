# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bergcloud/version'

Gem::Specification.new do |spec|
  spec.name          = "bergcloud"
  spec.version       = BERGCloud::VERSION
  spec.authors       = ["Alex Forey"]
  spec.email         = ["me@alexforey.com"]
  spec.description   = %q{BERG Cloud API Wrapper Gem}
  spec.summary       = spec.description
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
