# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aa_ancestors/version'

Gem::Specification.new do |spec|
  spec.name          = "pry-aa_ancestors"
  spec.version       = PryAaAncestors::VERSION
  spec.authors       = ["tbpgr"]
  spec.email         = ["tbpgr@tbpgr.jp"]
  spec.summary       = %q{Show the class hierarchy that is Ascii-Art format.}
  spec.description   = %q{Show the class hierarchy that is Ascii-Art format.}
  spec.homepage      = "https://github.com/tbpgr/pry-aa_ancestors"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "pry"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
