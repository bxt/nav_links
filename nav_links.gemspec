# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nav_links/version'

Gem::Specification.new do |spec|
  spec.name          = "nav_links"
  spec.version       = NavLinks::VERSION
  spec.authors       = ["Bernhard H\xC3\xA4ussner", "Dan Tello", "Patrick Reagan", "Brian Landau"]
  spec.email         = ["bxt@die-optimisten.net", "dan.tello@viget.com", "patrick.reagan@viget.com", "brian.landau@viget.com"]
  spec.description   = %q{Rails helper to generate navigation links with a selected class.}
  spec.summary       = %q{Rails helper to generate navigation links with a selected class.}
  spec.homepage      = "https://github.com/bxt/nav_links"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rails", ">= 3.2.13", "< 6.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-rails", '~> 2.0'
end
