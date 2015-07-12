# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stash_api/version'

Gem::Specification.new do |spec|
  spec.name          = "stash_api"
  spec.version       = StashAPI::VERSION
  spec.authors       = ["Zachary Chai"]
  spec.email         = ["zachary.chai@outlook.com"]
  spec.summary       = "Atlassian Stash API client"
  spec.description   = "A client for interacting with Atlassian Stash API"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version     = '>= 2.2.0'

  spec.add_dependency 'httparty', '~> 0.13.2'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
end
