# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pangu/version'

Gem::Specification.new do |spec|
  spec.name          = "pangu"
  spec.version       = Pangu::VERSION
  spec.authors       = ["Richard Lee"]
  spec.email         = ["dlackty@gmail.com"]

  spec.summary       = %q{Paranoid text spacing in Ruby}
  spec.description   = %q{Insert a white space between full-width characters (Chinese, Japanese, etc.) and half-width alphanumerics for good readability.}
  spec.homepage      = "https://github.com/dlackty/pangu.rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2"
end
