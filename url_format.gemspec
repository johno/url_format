# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'url_format/version'

Gem::Specification.new do |spec|
  spec.name          = "url_format"
  spec.version       = UrlFormat::VERSION
  spec.authors       = ["John Otander"]
  spec.email         = ["johnotander@gmail.com"]
  spec.description   = %q{Validate the url format of an attribute.}
  spec.summary       = %q{Validate the url format of an attribute.}
  spec.homepage      = "https://github.com/johnotander/url_format"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
